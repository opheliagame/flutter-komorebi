import 'package:flutter_komorebi/src/drift/database.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:image_picker/image_picker.dart';

class FakeNotesRepository implements NotesRepository {
  @override
  Future<Note> getNote(int noteId) {
    return Future(
      () => Note(id: 1, createdAt: DateTime(2024), modifiedAt: DateTime(2024)),
    );
  }

  @override
  Future<List<Note>> getNotesInCollection(int collectionId) {
    return Future(() => []);
  }

  @override
  Future<bool> addNoteToCollection({required int noteId, required int collectionId}) {
    // TODO: implement addNoteToCollection
    throw UnimplementedError();
  }

  @override
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds}) {
    // TODO: implement addNoteToCollectionList
    throw UnimplementedError();
  }

  @override
  Future<bool> createNote({required String? content, required XFile? media, required int? collectionId}) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteNote(int noteId) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getAllNotes() {
    // TODO: implement getAllNotes
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotesInCollectionList(List<int> collectionIds) {
    // TODO: implement getNotesInCollectionList
    throw UnimplementedError();
  }

  @override
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId}) {
    // TODO: implement removeNoteFromCollection
    throw UnimplementedError();
  }

  @override
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds}) {
    // TODO: implement removeNoteFromCollectionList
    throw UnimplementedError();
  }

  @override
  Stream<List<Note>> watchAllNotes() {
    // TODO: implement watchAllNotes
    throw UnimplementedError();
  }

  @override
  Stream<Note> watchNote(int noteId) {
    // TODO: implement watchNote
    throw UnimplementedError();
  }

  @override
  Stream<List<Note>> watchNotesInCollection(int collectionId) {
    // TODO: implement watchNotesInCollection
    throw UnimplementedError();
  }

  @override
  Stream<List<Note>> watchNotesInCollectionList(List<int> collectionIds) {
    // TODO: implement watchNotesInCollectionList
    throw UnimplementedError();
  }
}
