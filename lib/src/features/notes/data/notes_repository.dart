// import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/notes/data/drift_notes_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

abstract class NotesRepository {
  // crud operations
  Future<List<NoteEntity>> getAllNotes();
  Stream<List<NoteEntity>> watchAllNotes();
  Future<NoteEntity> getNote(int noteId);
  Stream<NoteEntity> watchNote(int noteId);
  Future<int> createNote({
    required String? content,
    required XFile? media,
  });
  Future<bool> deleteNote(int noteId);

  // collection related operations
  Future<List<NoteEntity>> getNotesInCollection(int collectionId);
  Stream<List<NoteEntity>> watchNotesInCollection(int collectionId);
  Future<List<NoteEntity>> getNotesInCollectionList(List<int> collectionIds);
  Stream<List<NoteEntity>> watchNotesInCollectionList(List<int> collectionIds);
}

final notesRepositoryProvider = Provider<NotesRepository>((ref) {
  return DriftNotesRepository(ref.read(appDatabaseProvider));
});

final notesListStreamProvider = StreamProvider.family<List<NoteEntity>, int?>((ref, currentCollectionId) {
  final repository = ref.read(notesRepositoryProvider);

  if (currentCollectionId == null) {
    return repository.watchAllNotes();
  } else {
    return repository.watchNotesInCollection(currentCollectionId);
  }
});

final noteStreamProvider = StreamProvider.family<NoteEntity, int>((ref, noteId) {
  final repository = ref.read(notesRepositoryProvider);
  return repository.watchNote(noteId);
});

final allNoteIdsProvider = FutureProvider<Iterable<int>>((ref) async {
  final repository = ref.read(notesRepositoryProvider);

  final notes = await repository.getAllNotes();
  return notes.map((e) => e.id);
});

final collectionsOfSingleNoteStreamProvider =
    StreamProvider.family.autoDispose<List<CollectionEntity>, int>((ref, noteId) {
  final repository = ref.read(collectionsRepositoryProvider);

  final result = repository.watchCollectionsOfNote(noteId);
  return result;
});
