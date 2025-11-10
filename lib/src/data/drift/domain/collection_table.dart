import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_media_table.dart';

class CollectionTable extends Table {
  @override
  String get tableName => 'collection';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  BlobColumn get media => blob().nullable()();

  IntColumn get mediaId => integer().nullable().references(CollectionMediaTable, #id)();
  IntColumn get parentId => integer().nullable().references(CollectionTable, #id)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
}

extension CollectionMapper on CollectionTableData {
  CollectionEntity toDomain() {
    return CollectionEntity(
      id: id,
      name: name,
      description: description,
      media: media,
      mediaId: mediaId,
      parentId: parentId,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
    );
  }
}
