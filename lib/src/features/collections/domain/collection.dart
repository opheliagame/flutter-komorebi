import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/features/collections/domain/collection_media.dart';

class Collections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get description => text()();
  BlobColumn get media => blob().nullable()();

  IntColumn get mediaId => integer().nullable().references(CollectionMedia, #id)();
  IntColumn get parentId => integer().nullable().references(Collections, #id)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
}
