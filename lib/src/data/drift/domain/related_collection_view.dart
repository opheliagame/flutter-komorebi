import 'package:drift/drift.dart';
import 'package:flutter_komorebi/src/data/drift/domain/collection_table.dart';
import 'package:flutter_komorebi/src/data/drift/domain/join_tables.dart';
import 'package:flutter_komorebi/src/data/drift/domain/note_table.dart';

abstract class RelatedCollection extends View {
  NoteTable get notes;
  CollectionTable get collections;
  CollectionNoteTable get collectionNotes;

  @override
  Query<HasResultSet, dynamic> as() => select([collections.id]).from(collections).join([
        // Join collectionNotes to collections
        innerJoin(
          collectionNotes,
          collectionNotes.collectionId.equalsExp(collections.id),
        ),
        // Join notes to collectionNotes
        innerJoin(
          notes,
          notes.id.equalsExp(collectionNotes.noteId),
        ),
      ])
        // Only keep collections that share notes with the given collection
        // ..where(
        //   collectionNotes.noteId.isInQuery(
        //     select([collectionNotes])
        //       ..addColumns([collectionNotes.noteId])
        //       ..where(collectionNotes.collectionId.equals(collectionId)),
        //   ),
        // )
        // Optional: remove the original collection itself
        // ..where(collections.id.isNotValue(collectionId))
        ..distinct;
}
