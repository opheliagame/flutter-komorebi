import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/history/data/drift_history_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class HistoryRepository {
  Future<List<HistoryEntity>> getAllHistory();
  Stream<List<HistoryExpandedEntity>> watchAllHistory();
  Future<List<HistoryEntity>> getNoteHistory(int noteId);
  Stream<List<HistoryExpandedEntity>> watchNoteHistory(int noteId);

  Future<bool> saveHistoryItem({
    required int? noteId,
    required int? collectionId,
    required HistoryType historyType,
    required String? content,
  });

  Future<bool> createAddNoteHistoryItem({required int noteId, required String? content});
  Future<bool> createDeleteNoteHistoryItem(int noteId);
  Future<bool> createAddConnectionHistoryItem({
    required int noteId,
    required int collectionId,
  });
  Future<bool> createRemoveConnectionHistoryItem({
    required int noteId,
    required int collectionId,
  });
}

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return DriftHistoryRepositoryImpl(ref.read(appDatabaseProvider));
});

final historyListStreamProvider = StreamProvider.family<List<HistoryExpandedEntity>, int?>((ref, noteId) {
  final repository = ref.read(historyRepositoryProvider);

  return noteId == null ? repository.watchAllHistory() : repository.watchNoteHistory(noteId);
});
