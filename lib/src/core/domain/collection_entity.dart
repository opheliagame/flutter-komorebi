import 'dart:typed_data';

class CollectionEntity {
  final int id;
  final String name;
  final String? description;
  final Uint8List? media;

  final DateTime createdAt;
  final DateTime modifiedAt;

  CollectionEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.media,
    required this.createdAt,
    required this.modifiedAt,
  });
}
