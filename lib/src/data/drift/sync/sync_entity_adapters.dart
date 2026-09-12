import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';

/// Entity type identifiers used across the sync tables/protocol.
const collectionEntityType = 'collection';
const noteEntityType = 'note';

Map<String, dynamic> collectionToJson(CollectionTableData row) => {
      'name': row.name,
      'description': row.description,
      'media': row.media == null ? null : base64Encode(row.media!),
      'createdAt': row.createdAt.toIso8601String(),
      'modifiedAt': row.modifiedAt.toIso8601String(),
    };

Map<String, dynamic> noteToJson(NoteTableData row) => {
      'content': row.content,
      'media': row.media == null ? null : base64Encode(row.media!),
      'citationId': row.citationId,
      'createdAt': row.createdAt.toIso8601String(),
      'modifiedAt': row.modifiedAt.toIso8601String(),
    };

/// Applies an incoming [json] snapshot for a collection, inserting a new
/// local row if unseen ([localId] is null) or updating the existing one.
/// Returns the local row id.
Future<int> applyCollectionJson(AppDatabase database, int? localId, Map<String, dynamic> json) async {
  final companion = CollectionTableCompanion(
    name: Value(json['name'] as String),
    description: Value(json['description'] as String?),
    media: Value(json['media'] == null ? null : base64Decode(json['media'] as String)),
    createdAt: Value(DateTime.parse(json['createdAt'] as String)),
    modifiedAt: Value(DateTime.parse(json['modifiedAt'] as String)),
  );

  if (localId == null) {
    return database.into(database.collectionTable).insert(companion);
  }
  await (database.update(database.collectionTable)..where((t) => t.id.equals(localId))).write(companion);
  return localId;
}

Future<int> applyNoteJson(AppDatabase database, int? localId, Map<String, dynamic> json) async {
  final companion = NoteTableCompanion(
    content: Value(json['content'] as String?),
    media: Value(json['media'] == null ? null : base64Decode(json['media'] as String)),
    citationId: Value(json['citationId'] as int?),
    createdAt: Value(DateTime.parse(json['createdAt'] as String)),
    modifiedAt: Value(DateTime.parse(json['modifiedAt'] as String)),
  );

  if (localId == null) {
    return database.into(database.noteTable).insert(companion);
  }
  await (database.update(database.noteTable)..where((t) => t.id.equals(localId))).write(companion);
  return localId;
}
