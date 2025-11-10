import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';

class FakeHistoryRepositoryImpl implements HistoryRepository {
  @override
  Future<List<HistoryEntity>> getAllHistory() {
    // TODO: implement getAllHistory
    throw UnimplementedError();
  }

  @override
  Stream<List<HistoryExpandedEntity>> watchAllHistory() {
    // TODO: implement watchAllHistory
    throw UnimplementedError();
  }

  @override
  Future<bool> saveHistoryItem(
      {required int? noteId, required int? collectionId, required HistoryType historyType, required String? content}) {
    // TODO: implement saveHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createAddConnectionHistoryItem({required int noteId, required int collectionId}) {
    // TODO: implement createAddConnectionHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createAddNoteHistoryItem({required int noteId, required String? content}) {
    // TODO: implement createAddNoteHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createDeleteNoteHistoryItem(int noteId) {
    // TODO: implement createDeleteNoteHistoryItem
    throw UnimplementedError();
  }

  @override
  Future<bool> createRemoveConnectionHistoryItem({required int noteId, required int collectionId}) {
    // TODO: implement createRemoveConnectionHistoryItem
    throw UnimplementedError();
  }
}
