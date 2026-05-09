import 'dart:math';

import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/core/domain/note_entity.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/notes/data/notes_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoamState {
  const RoamState({
    this.previousNote,
    this.previousCollections = const [],
    this.currentNote,
    this.currentCollections = const [],
    this.isLoading = false,
  });

  final NoteEntity? previousNote;
  final List<CollectionEntity> previousCollections;
  final NoteEntity? currentNote;
  final List<CollectionEntity> currentCollections;
  final bool isLoading;

  RoamState copyWith({
    NoteEntity? previousNote,
    List<CollectionEntity>? previousCollections,
    NoteEntity? currentNote,
    List<CollectionEntity>? currentCollections,
    bool? isLoading,
  }) =>
      RoamState(
        previousNote: previousNote ?? this.previousNote,
        previousCollections: previousCollections ?? this.previousCollections,
        currentNote: currentNote ?? this.currentNote,
        currentCollections: currentCollections ?? this.currentCollections,
        isLoading: isLoading ?? this.isLoading,
      );
}

class RoamNotifier extends StateNotifier<RoamState> {
  RoamNotifier(this._ref) : super(const RoamState());

  final Ref _ref;
  final _rng = Random();

  NotesRepository get _notes => _ref.read(notesRepositoryProvider);
  CollectionsRepository get _collections => _ref.read(collectionsRepositoryProvider);

  /// Pick a random note from all notes to start roaming.
  Future<void> startRoam() async {
    state = state.copyWith(isLoading: true);
    try {
      final all = await _notes.getAllNotes();
      if (all.isEmpty) {
        state = const RoamState();
        return;
      }
      final note = all[_rng.nextInt(all.length)];
      final cols = await _collections.getCollectionsOfNote(note.id);
      state = RoamState(currentNote: note, currentCollections: cols);
    } catch (_) {
      state = const RoamState();
    }
  }

  /// Move to a random note in [collection], excluding the current note.
  Future<void> roamIntoCollection(CollectionEntity collection) async {
    final current = state.currentNote;
    state = state.copyWith(isLoading: true);
    try {
      final notesInCol = await _notes.getNotesInCollection(collection.id);
      final candidates = notesInCol.where((n) => n.id != current?.id).toList();

      // fall back to any note in the collection if only one exists
      final pool = candidates.isNotEmpty ? candidates : notesInCol;
      if (pool.isEmpty) {
        state = state.copyWith(isLoading: false);
        return;
      }

      final next = pool[_rng.nextInt(pool.length)];
      final nextCols = await _collections.getCollectionsOfNote(next.id);

      state = RoamState(
        previousNote: current,
        previousCollections: state.currentCollections,
        currentNote: next,
        currentCollections: nextCols,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final roamNotifierProvider = StateNotifierProvider.autoDispose<RoamNotifier, RoamState>((ref) {
  return RoamNotifier(ref);
});
