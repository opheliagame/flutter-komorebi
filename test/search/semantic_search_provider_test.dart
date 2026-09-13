import 'dart:typed_data';

import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/features/notes/data/fake_notes_repository_impl.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_komorebi/src/features/search/data/semantic_search_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('search results preserve semantic relevance order', () async {
    final notes = [
      _note(id: 1, content: 'A note about planets'),
      _note(id: 2, content: 'Ideas for dinner'),
      _note(id: 3, content: 'Exact phrase: food ideas'),
    ];
    final container = ProviderContainer(
      overrides: [
        notesRepositoryProvider.overrideWithValue(_NotesRepository(notes)),
        semanticSearchServiceProvider.overrideWithValue(
          _SemanticSearchService(noteResults: [2, 1]),
        ),
      ],
    );
    addTearDown(container.dispose);

    container.read(searchQueryProvider.notifier).state = 'food ideas';
    final results = await container.read(searchResultsProvider.future);

    expect(results.map((note) => note.id), [2, 1, 3]);
  });

  test('search results fall back to keyword matches', () async {
    final notes = [
      _note(id: 1, content: 'A note about planets'),
      _note(id: 2, content: 'Exact phrase: food ideas'),
    ];
    final container = ProviderContainer(
      overrides: [
        notesRepositoryProvider.overrideWithValue(_NotesRepository(notes)),
        semanticSearchServiceProvider.overrideWithValue(
          _SemanticSearchService(),
        ),
      ],
    );
    addTearDown(container.dispose);

    container.read(searchQueryProvider.notifier).state = 'food ideas';
    final results = await container.read(searchResultsProvider.future);

    expect(results.map((note) => note.id), [2]);
  });
}

NoteEntity _note({required int id, required String content}) {
  return NoteEntity(
    id: id,
    content: content,
    media: null,
    citationId: null,
    createdAt: DateTime(2026),
    modifiedAt: DateTime(2026),
  );
}

class _NotesRepository extends FakeNotesRepository {
  _NotesRepository(this.notes);

  final List<NoteEntity> notes;

  @override
  Stream<List<NoteEntity>> watchAllNotes() {
    return Stream.value(notes);
  }

  @override
  Future<int> createNote({
    required String? content,
    required Uint8List? media,
  }) {
    throw UnsupportedError('Not used by this test.');
  }
}

class _SemanticSearchService extends FakeSemanticSearchService {
  _SemanticSearchService({this.noteResults = const []});

  final List<int> noteResults;

  @override
  Future<List<int>> searchSimilarNotes({
    required String query,
    int topK = 20,
    double threshold = 0.0,
  }) async {
    return noteResults.take(topK).toList();
  }
}
