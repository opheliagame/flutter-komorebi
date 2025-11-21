import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/history_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';

class DriftHistoryRepositoryImpl implements HistoryRepository {
  DriftHistoryRepositoryImpl(this.database);

  final AppDatabase database;

  @override
  Future<List<HistoryEntity>> getAllHistory() async {
    final query = database.select(database.historyTable).get();
    final histories = (await query).map((e) => e.toDomain()).toList();
    return histories;
  }

  @override
  Stream<List<HistoryExpandedEntity>> watchAllHistory() {
    final query = database.select(database.historyTable).join([
      leftOuterJoin(database.noteTable, database.noteTable.id.equalsExp(database.historyTable.noteId)),
      leftOuterJoin(
          database.collectionTable, database.collectionTable.id.equalsExp(database.historyTable.collectionId)),
    ]).watch();
    // TODO(imp): is this mapping not dangerous
    final histories = query.map(
      (e) => e.map<HistoryExpandedEntity>((e1) {
        final historyEntity = e1.readTable(database.historyTable).toDomain();
        final noteEntity = e1.readTableOrNull(database.noteTable)?.toDomain();
        final collectionEntity = e1.readTableOrNull(database.collectionTable)?.toDomain();
        final result = HistoryExpandedEntity(
          id: historyEntity.id,
          noteId: historyEntity.noteId,
          collectionId: historyEntity.collectionId,
          historyType: historyEntity.historyType,
          content: historyEntity.content,
          createdAt: historyEntity.createdAt,
          noteEntity: noteEntity,
          collectionEntity: collectionEntity,
        );

        return result;
      }).toList(),
    );
    return histories;
  }

  @override
  Future<List<HistoryEntity>> getNoteHistory(int noteId) async {
    final query = database.select(database.historyTable)..where((q) => q.noteId.equals(noteId));
    final histories = (await query.get()).map((e) => e.toDomain()).toList();
    return histories;
  }

  @override
  Stream<List<HistoryExpandedEntity>> watchNoteHistory(int noteId) {
    final query = (database.select(database.historyTable)..where((q) => q.noteId.equals(noteId))).join([
      leftOuterJoin(database.noteTable, database.noteTable.id.equalsExp(database.historyTable.noteId)),
      leftOuterJoin(
          database.collectionTable, database.collectionTable.id.equalsExp(database.historyTable.collectionId)),
    ]).watch();
    final histories = query.map(
      (e) => e.map<HistoryExpandedEntity>((e1) {
        final historyEntity = e1.readTable(database.historyTable).toDomain();
        final noteEntity = e1.readTableOrNull(database.noteTable)?.toDomain();
        final collectionEntity = e1.readTableOrNull(database.collectionTable)?.toDomain();
        final result = HistoryExpandedEntity(
          id: historyEntity.id,
          noteId: historyEntity.noteId,
          collectionId: historyEntity.collectionId,
          historyType: historyEntity.historyType,
          content: historyEntity.content,
          createdAt: historyEntity.createdAt,
          noteEntity: noteEntity,
          collectionEntity: collectionEntity,
        );

        return result;
      }).toList(),
    );
    return histories;
  }

  @override
  Future<bool> saveHistoryItem({
    required int? noteId,
    required int? collectionId,
    required HistoryType historyType,
    required String? content,
  }) async {
    try {
      await database.into(database.historyTable).insert(
            HistoryTableCompanion.insert(
              collectionId: Value.absentIfNull(collectionId),
              noteId: Value.absentIfNull(noteId),
              content: Value.absentIfNull(content),
              historyType: historyType.index,
              createdAt: DateTime.now(),
            ),
          );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> createAddConnectionHistoryItem({required int noteId, required int collectionId}) async {
    try {
      await database.into(database.historyTable).insert(
            HistoryTableCompanion.insert(
              collectionId: Value(collectionId),
              noteId: Value(noteId),
              historyType: HistoryType.addConnection.index,
              createdAt: DateTime.now(),
            ),
          );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> createAddNoteHistoryItem({required int noteId, required String? content}) async {
    try {
      await database.into(database.historyTable).insert(
            HistoryTableCompanion.insert(
              noteId: Value(noteId),
              content: Value.absentIfNull(content),
              historyType: HistoryType.addNote.index,
              createdAt: DateTime.now(),
            ),
          );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> createRemoveConnectionHistoryItem({required int noteId, required int collectionId}) async {
    try {
      await database.into(database.historyTable).insert(
            HistoryTableCompanion.insert(
              collectionId: Value(collectionId),
              noteId: Value(noteId),
              historyType: HistoryType.removeConnection.index,
              createdAt: DateTime.now(),
            ),
          );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<bool> createDeleteNoteHistoryItem(int noteId) async {
    try {
      await database.into(database.historyTable).insert(
            HistoryTableCompanion.insert(
              noteId: Value(noteId),
              historyType: HistoryType.deleteNote.index,
              createdAt: DateTime.now(),
            ),
          );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
