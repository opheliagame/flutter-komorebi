import 'package:drift/drift.dart';

// TODO(feat): add media type to collection media
// class CollectionMedia {
//   final int id;
//   final String title;
//   final Uint8List picture;

//   CollectionMedia({required this.id, required this.title, required this.picture});
// }

class CollectionMediaTable extends Table {
  @override
  String get tableName => 'collection_media';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get caption => text().nullable()();
  BlobColumn get media => blob()();
  // gives circular id error
  // IntColumn get collectionId => integer().nullable().references(Collections, #id)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
}
