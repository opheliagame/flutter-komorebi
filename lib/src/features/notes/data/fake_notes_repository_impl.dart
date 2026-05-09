import 'dart:typed_data';

import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';

class FakeNotesRepository implements NotesRepository {
  @override
  Future<bool> deleteNote(int noteId) {
    // TODO(dev): implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteEntity>> getAllNotes() {
    // TODO(dev): implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Future<NoteEntity> getNote(int noteId) {
    // TODO(dev): implement getNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteEntity>> getNotesInCollection(int collectionId) {
    // TODO(dev): implement getNotesInCollection
    throw UnimplementedError();
  }

  @override
  Future<List<NoteEntity>> getNotesInCollectionList(List<int> collectionIds) {
    // TODO(dev): implement getNotesInCollectionList
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteEntity>> watchAllNotes() {
    // TODO(dev): implement watchAllNotes
    throw UnimplementedError();
  }

  @override
  Stream<NoteEntity> watchNote(int noteId) {
    // TODO(dev): implement watchNote
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollection(int collectionId) {
    // TODO(dev): implement watchNotesInCollection
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollectionList(List<int> collectionIds) {
    // TODO(dev): implement watchNotesInCollectionList
    throw UnimplementedError();
  }

  @override
  Future<int> createNote({required String? content, required Uint8List? media}) {
    // TODO(dev): implement createNote
    throw UnimplementedError();
  }

  @override
  Future<int> updateNote({required int noteId, required String? content, required Uint8List? media}) {
    // TODO(dev): implement updateNote
    throw UnimplementedError();
  }
}
