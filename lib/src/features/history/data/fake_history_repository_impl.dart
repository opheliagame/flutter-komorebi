import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';

class FakeHistoryRepositoryImpl implements HistoryRepository {
  @override
  Future<List<HistoryEntity>> getAllHistory() {
    // TODO(dev): implement getAllHistory
    throw UnimplementedError();
  }

  @override
  Stream<List<HistoryExpandedEntity>> watchAllHistory() {
    // TODO(dev): implement watchAllHistory
    throw UnimplementedError();
  }

  @override
  Future<bool> saveHistoryItem(
      {required int? noteId, required int? collectionId, required HistoryType historyType, required String? content}) {
    // TODO(dev): implement saveHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createAddConnectionHistoryItem({required int noteId, required int collectionId}) {
    // TODO(dev): implement createAddConnectionHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createAddNoteHistoryItem({required int noteId, required String? content}) {
    // TODO(dev): implement createAddNoteHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createDeleteNoteHistoryItem(int noteId) {
    // TODO(dev): implement createDeleteNoteHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createRemoveConnectionHistoryItem({required int noteId, required int collectionId}) {
    // TODO(dev): implement createRemoveConnectionHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<List<HistoryEntity>> getNoteHistory(int noteId) {
    // TODO(dev): implement getNoteHistory
    throw UnimplementedError();
  }

  @override
  Stream<List<HistoryExpandedEntity>> watchNoteHistory(int noteId) {
    // TODO(dev): implement watchNoteHistory
    throw UnimplementedError();
  }
}
