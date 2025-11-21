import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';

class RelatedCollectionNoteEntity {
  final int id;
  final CollectionEntity collection;
  final NoteEntity note;
  final DateTime createdAt;

  RelatedCollectionNoteEntity({
    required this.id,
    required this.collection,
    required this.note,
    required this.createdAt,
  });
}
