import 'dart:typed_data';

import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/connection/data/connection_repository.dart';
import 'package:flutter_komorebi/src/features/connection/usecase/drift_connection_usecase_impl.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ConnectionUsecase {
  Future<bool> createNoteAndConnect({
    required String? content,
    required Uint8List? media,
    required List<int> collectionIds,
  });
  Future<bool> addNoteToCollection({required int noteId, required int collectionId});
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds});
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId});
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds});
}

final connectionUsecaseProvider = Provider<ConnectionUsecase>((ref) {
  return DriftConnectionUsecaseImpl(
    notesRepository: ref.read(notesRepositoryProvider),
    collectionsRepository: ref.read(collectionsRepositoryProvider),
    historyRepository: ref.read(historyRepositoryProvider),
    connectionRepository: ref.read(connectionRepositoryProvider),
  );
});
