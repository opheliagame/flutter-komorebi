import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/connection/data/connection_repository.dart';
import 'package:flutter_komorebi/src/features/connection/usecase/connection_usecase.dart';
import 'package:flutter_komorebi/src/features/history/data/history_repository.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';

class DriftConnectionUsecaseImpl implements ConnectionUsecase {
  final NotesRepository notesRepository;
  final CollectionsRepository collectionsRepository;
  final HistoryRepository historyRepository;
  final ConnectionRepository connectionRepository;

  DriftConnectionUsecaseImpl({
    required this.notesRepository,
    required this.collectionsRepository,
    required this.historyRepository,
    required this.connectionRepository,
  });

  @override
  Future<bool> createNoteAndConnect({
    required String? content,
    required Uint8List? media,
    required List<int> collectionIds,
  }) async {
    try {
      final noteId = await notesRepository.createNote(content: content, media: media);
      await historyRepository.createAddNoteHistoryItem(noteId: noteId, content: content);

      await connectionRepository.addNoteToCollectionList(noteId: noteId, collectionIds: collectionIds);
      for (final collectionId in collectionIds) {
        await historyRepository.createAddConnectionHistoryItem(noteId: noteId, collectionId: collectionId);
      }

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> addNoteToCollection({required int noteId, required int collectionId}) async {
    try {
      await connectionRepository.addNoteToCollection(noteId: noteId, collectionId: collectionId);
      await historyRepository.createAddConnectionHistoryItem(noteId: noteId, collectionId: collectionId);

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> addNoteToCollectionList({required int noteId, required List<int> collectionIds}) async {
    try {
      await connectionRepository.addNoteToCollectionList(noteId: noteId, collectionIds: collectionIds);

      for (final id in collectionIds) {
        await historyRepository.createAddConnectionHistoryItem(noteId: noteId, collectionId: id);
      }

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> removeNoteFromCollection({required int noteId, required int collectionId}) async {
    try {
      await connectionRepository.removeNoteFromCollection(noteId: noteId, collectionId: collectionId);
      await historyRepository.createRemoveConnectionHistoryItem(noteId: noteId, collectionId: collectionId);

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> removeNoteFromCollectionList({required int noteId, required List<int> collectionIds}) async {
    try {
      await connectionRepository.removeNoteFromCollectionList(noteId: noteId, collectionIds: collectionIds);

      for (final id in collectionIds) {
        await historyRepository.createRemoveConnectionHistoryItem(noteId: noteId, collectionId: id);
      }

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
