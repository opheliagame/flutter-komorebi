import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:image_picker/image_picker.dart';

class FakeNotesRepository implements NotesRepository {
  @override
  Future<bool> deleteNote(int noteId) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteEntity>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Future<NoteEntity> getNote(int noteId) {
    // TODO: implement getNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteEntity>> getNotesInCollection(int collectionId) {
    // TODO: implement getNotesInCollection
    throw UnimplementedError();
  }

  @override
  Future<List<NoteEntity>> getNotesInCollectionList(List<int> collectionIds) {
    // TODO: implement getNotesInCollectionList
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteEntity>> watchAllNotes() {
    // TODO: implement watchAllNotes
    throw UnimplementedError();
  }

  @override
  Stream<NoteEntity> watchNote(int noteId) {
    // TODO: implement watchNote
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollection(int collectionId) {
    // TODO: implement watchNotesInCollection
    throw UnimplementedError();
  }

  @override
  Stream<List<NoteEntity>> watchNotesInCollectionList(List<int> collectionIds) {
    // TODO: implement watchNotesInCollectionList
    throw UnimplementedError();
  }

  @override
  Future<int> createNote({required String? content, required XFile? media}) {
    // TODO: implement createNote
    throw UnimplementedError();
  }
}
