import 'dart:typed_data';

import 'package:collection/collection.dart';

class NoteEntity {
  final int id;
  final String? content;
  final Uint8List? media;
  final int? citationId;

  final DateTime createdAt;
  final DateTime modifiedAt;

  NoteEntity({
    required this.id,
    required this.content,
    required this.media,
    required this.citationId,
    required this.createdAt,
    required this.modifiedAt,
  });

  String? get randomWord => content?.split(' ').toList().sample(1).single;
}
