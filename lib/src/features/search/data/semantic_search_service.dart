import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemma_rag_qdrant/flutter_gemma_rag_qdrant.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Whether [error] represents a `QdrantVectorStore` vector dimension
/// mismatch, as raised when a store's on-disk shard was opened with one
/// embedding dimension but is later queried/written with a different one
/// (e.g. after the on-device embedding model changes). Extracted as a
/// top-level function so it can be unit tested without a real vector store.
bool isVectorDimensionMismatch(Object error) {
  final message = error.toString();
  return message.contains('does not match stored dimension') ||
      message.contains('dimension mismatch');
}

abstract class SemanticSearchService {
  Future<void> initialize();
  Future<void> indexNote(NoteEntity note);
  Future<void> removeNote(int noteId);
  Future<void> indexCollection(CollectionEntity collection);
  Future<void> removeCollection(int collectionId);
  Future<List<int>> searchSimilarNotes(
      {required String query, int topK = 20, double threshold = 0.0});
  Future<List<int>> searchSimilarCollections(
      {required String query, int topK = 10, double threshold = 0.0});
  bool get isReady;
}

class QdrantSemanticSearchService implements SemanticSearchService {
  static const _embeddingChannel = MethodChannel('semantic_embedding');

  final QdrantVectorStore _noteStore = QdrantVectorStore();
  final QdrantVectorStore _collectionStore = QdrantVectorStore();
  final Map<int, DateTime> _indexedNotes = {};
  final Map<int, DateTime> _indexedCollections = {};
  bool _initialized = false;
  Future<void>? _initializationFuture;

  @override
  bool get isReady => _initialized;

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    return _initializationFuture ??= _initialize();
  }

  Future<void> _initialize() async {
    try {
      final supportDirectory = await getApplicationSupportDirectory();
      // The store paths were bumped to "_v2" because embeddings are now always
      // generated with a single fixed-language model, which changed the vector
      // dimension. Any pre-existing shard on disk from before this fix could have
      // a different (stale) dimension, which would make every query fail with a
      // "dimension mismatch" error. Using a fresh path guarantees a clean rebuild.
      await Future.wait([
        _noteStore.initialize(
          p.join(supportDirectory.path, 'komorebi_qdrant_notes_v2'),
        ),
        _collectionStore.initialize(
          p.join(supportDirectory.path, 'komorebi_qdrant_collections_v2'),
        ),
      ]);
      _initialized = true;
    } catch (e) {
      debugPrint('SemanticSearchService: initialization failed: $e');
      _initialized = false;
    } finally {
      if (!_initialized) {
        _initializationFuture = null;
      }
    }
  }

  @override
  Future<void> indexNote(NoteEntity note) async {
    final content = note.content?.trim();
    if (content == null || content.isEmpty) return;
    if (_indexedNotes[note.id] == note.modifiedAt) return;

    try {
      if (!_initialized) await initialize();
      if (!_initialized) return;

      final embedding = await _embed(content);
      await _addDocumentWithRecovery(
        _noteStore,
        id: 'note_${note.id}',
        content: content,
        embedding: embedding,
        metadata: '{"type":"note","id":${note.id}}',
      );
      _indexedNotes[note.id] = note.modifiedAt;
    } catch (e) {
      debugPrint('SemanticSearchService: failed to index note ${note.id}: $e');
    }
  }

  @override
  Future<void> removeNote(int noteId) async {
    try {
      if (!_initialized) await initialize();
      if (!_initialized) return;
      await _noteStore.removeDocument(id: 'note_$noteId');
      _indexedNotes.remove(noteId);
    } catch (e) {
      debugPrint('SemanticSearchService: failed to remove note $noteId: $e');
    }
  }

  @override
  Future<void> indexCollection(CollectionEntity collection) async {
    final parts = <String>[
      collection.name,
      if (collection.description != null &&
          collection.description!.trim().isNotEmpty)
        collection.description!.trim(),
    ];
    final content = parts.join('\n').trim();
    if (content.isEmpty) return;
    if (_indexedCollections[collection.id] == collection.modifiedAt) return;

    try {
      if (!_initialized) await initialize();
      if (!_initialized) return;

      final embedding = await _embed(content);
      await _addDocumentWithRecovery(
        _collectionStore,
        id: 'collection_${collection.id}',
        content: content,
        embedding: embedding,
        metadata: '{"type":"collection","id":${collection.id}}',
      );
      _indexedCollections[collection.id] = collection.modifiedAt;
    } catch (e) {
      debugPrint(
          'SemanticSearchService: failed to index collection ${collection.id}: $e');
    }
  }

  @override
  Future<void> removeCollection(int collectionId) async {
    try {
      if (!_initialized) await initialize();
      if (!_initialized) return;
      await _collectionStore.removeDocument(id: 'collection_$collectionId');
      _indexedCollections.remove(collectionId);
    } catch (e) {
      debugPrint(
          'SemanticSearchService: failed to remove collection $collectionId: $e');
    }
  }

  @override
  Future<List<int>> searchSimilarNotes({
    required String query,
    int topK = 20,
    double threshold = 0.0,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return [];

    try {
      if (!_initialized) await initialize();
      if (!_initialized) return [];

      final results = await _noteStore.searchSimilar(
        queryEmbedding: await _embed(trimmed),
        topK: topK,
        threshold: threshold,
      );

      final noteIds = <int>[];
      for (final hit in results) {
        if (hit.id.startsWith('note_')) {
          final idStr = hit.id.replaceFirst('note_', '');
          final parsed = int.tryParse(idStr);
          if (parsed != null) {
            noteIds.add(parsed);
          }
        }
      }
      return noteIds;
    } catch (e) {
      debugPrint('SemanticSearchService: search notes error: $e');
      await _recoverFromDimensionMismatch(e, _noteStore, _indexedNotes);
      return [];
    }
  }

  @override
  Future<List<int>> searchSimilarCollections({
    required String query,
    int topK = 10,
    double threshold = 0.0,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return [];

    try {
      if (!_initialized) await initialize();
      if (!_initialized) return [];

      final results = await _collectionStore.searchSimilar(
        queryEmbedding: await _embed(trimmed),
        topK: topK,
        threshold: threshold,
      );

      final collectionIds = <int>[];
      for (final hit in results) {
        if (hit.id.startsWith('collection_')) {
          final idStr = hit.id.replaceFirst('collection_', '');
          final parsed = int.tryParse(idStr);
          if (parsed != null) {
            collectionIds.add(parsed);
          }
        }
      }
      return collectionIds;
    } catch (e) {
      debugPrint('SemanticSearchService: search collections error: $e');
      await _recoverFromDimensionMismatch(
          e, _collectionStore, _indexedCollections);
      return [];
    }
  }

  /// Adds a document to [store], and if it fails due to a stored/query vector
  /// dimension mismatch (e.g. an on-disk shard left over from before a change
  /// to the embedding model), clears the store and retries once so the store
  /// self-heals instead of failing forever.
  Future<void> _addDocumentWithRecovery(
    QdrantVectorStore store, {
    required String id,
    required String content,
    required List<double> embedding,
    required String metadata,
  }) async {
    try {
      await store.addDocument(
        id: id,
        content: content,
        embedding: embedding,
        metadata: metadata,
      );
    } catch (e) {
      if (!_isDimensionMismatch(e)) rethrow;
      debugPrint(
          'SemanticSearchService: dimension mismatch detected, clearing store and retrying');
      await store.clear();
      await store.addDocument(
        id: id,
        content: content,
        embedding: embedding,
        metadata: metadata,
      );
    }
  }

  /// If [error] is a vector dimension mismatch, clears [store] and the
  /// matching indexed-ids cache so the next indexing pass rebuilds the store
  /// from scratch with the current (consistent) embedding dimension.
  Future<void> _recoverFromDimensionMismatch(
    Object error,
    QdrantVectorStore store,
    Map<int, DateTime> indexedIds,
  ) async {
    if (!_isDimensionMismatch(error)) return;
    try {
      await store.clear();
      indexedIds.clear();
    } catch (e) {
      debugPrint('SemanticSearchService: failed to recover store: $e');
    }
  }

  bool _isDimensionMismatch(Object error) => isVectorDimensionMismatch(error);

  Future<List<double>> _embed(String text) async {
    final result = await _embeddingChannel.invokeMethod<List<Object?>>(
      'embed',
      {'text': text},
    );
    if (result == null || result.isEmpty) {
      throw StateError(
          'The on-device sentence embedding model is unavailable.');
    }
    return result.map((value) => (value! as num).toDouble()).toList();
  }
}

class FakeSemanticSearchService implements SemanticSearchService {
  final Map<int, String> notes = {};
  final Map<int, String> collections = {};

  @override
  bool get isReady => true;

  @override
  Future<void> initialize() async {}

  @override
  Future<void> indexNote(NoteEntity note) async {
    if (note.content != null) {
      notes[note.id] = note.content!;
    }
  }

  @override
  Future<void> removeNote(int noteId) async {
    notes.remove(noteId);
  }

  @override
  Future<void> indexCollection(CollectionEntity collection) async {
    collections[collection.id] =
        '${collection.name} ${collection.description ?? ''}';
  }

  @override
  Future<void> removeCollection(int collectionId) async {
    collections.remove(collectionId);
  }

  @override
  Future<List<int>> searchSimilarNotes({
    required String query,
    int topK = 20,
    double threshold = 0.0,
  }) async {
    final q = query.toLowerCase().trim();
    if (q.isEmpty) return [];
    return notes.entries
        .where((e) => e.value.toLowerCase().contains(q))
        .map((e) => e.key)
        .take(topK)
        .toList();
  }

  @override
  Future<List<int>> searchSimilarCollections({
    required String query,
    int topK = 10,
    double threshold = 0.0,
  }) async {
    final q = query.toLowerCase().trim();
    if (q.isEmpty) return [];
    return collections.entries
        .where((e) => e.value.toLowerCase().contains(q))
        .map((e) => e.key)
        .take(topK)
        .toList();
  }
}

final semanticSearchServiceProvider = Provider<SemanticSearchService>((ref) {
  return QdrantSemanticSearchService();
});
