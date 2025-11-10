import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';

enum HistoryType {
  unidentified,

  addNote,
  updateNote,
  deleteNote,
  addCollection,
  updateCollection,
  deleteCollection,

  addConnection,
  removeConnection,
  ;

  static HistoryType toEnum(int value) {
    return HistoryType.values.firstWhere((e) => e.index == value, orElse: () => HistoryType.unidentified);
  }
}

class HistoryEntity {
  final int id;
  final int? noteId;
  final int? collectionId;
  final HistoryType historyType;
  final String? content;
  final DateTime createdAt;

  HistoryEntity({
    required this.id,
    required this.noteId,
    required this.collectionId,
    required this.historyType,
    required this.content,
    required this.createdAt,
  });
}

class HistoryExpandedEntity extends HistoryEntity {
  final NoteEntity? noteEntity;
  final CollectionEntity? collectionEntity;

  HistoryExpandedEntity({
    required super.id,
    required super.noteId,
    required super.collectionId,
    required super.historyType,
    required super.content,
    required super.createdAt,
    required this.noteEntity,
    required this.collectionEntity,
  });

  bool get hasNote => noteEntity != null;
  bool get hasCollection => collectionEntity != null;
}
