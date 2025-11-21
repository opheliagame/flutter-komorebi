import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_komorebi/src/data/drift/database.dart';

extension MockDataSeeder on AppDatabase {
  Future<void> insertSimpleMockData() async {
    final random = Random();
    final now = DateTime.now();

    // --- Step 0: Clear existing data before inserting new ---
    await batch((batch) {
      batch.deleteWhere(historyTable, (_) => const Constant(true));
      batch.deleteWhere(collectionNoteRefTable, (_) => const Constant(true));
      batch.deleteWhere(noteTable, (_) => const Constant(true));
      batch.deleteWhere(collectionTable, (_) => const Constant(true));
      batch.deleteWhere(noteCitationTable, (_) => const Constant(true));
      batch.deleteWhere(collectionMediaTable, (_) => const Constant(true));
    });
    debugPrint('🧹 Cleared all existing mock data.');

    // --- Step 1: Insert 20 collections ---
    final collectionIds = <int>[];
    for (int i = 0; i < 20; i++) {
      final id = await into(collectionTable).insert(
        CollectionTableCompanion.insert(
          name: 'Collection ${i + 1}',
          description: Value('This is collection number ${i + 1}'),
          media: Value(Uint8List.fromList(List.generate(5, (_) => random.nextInt(255)))), // small random blob
          // mediaId: const Value.absent(),
          // parentId: i > 0 && random.nextBool()
          //     ? Value(collectionIds[random.nextInt(collectionIds.length)]) // random parent
          //     : const Value.absent(),
          createdAt: now,
          modifiedAt: now,
        ),
      );
      collectionIds.add(id);
    }

    // --- Step 2: Insert 100 notes ---
    final noteIds = <int>[];
    for (int i = 0; i < 100; i++) {
      final id = await into(noteTable).insert(
        NoteTableCompanion.insert(
          content: Value('Note content ${i + 1}'),
          media: random.nextBool()
              ? Value(Uint8List.fromList(List.generate(10, (_) => random.nextInt(255))))
              : const Value.absent(),
          citationId: const Value.absent(),
          createdAt: now.subtract(Duration(days: random.nextInt(30))),
          modifiedAt: now,
        ),
      );
      await into(historyTable).insert(
        HistoryTableCompanion.insert(
          noteId: Value.absent(),
          collectionId: Value(id),
          content: Value('Note content ${i + 1}'),
          historyType: HistoryType.addCollection.index,
          createdAt: DateTime.now(),
        ),
      );
      await into(historyTable).insert(
        HistoryTableCompanion.insert(
          collectionId: Value.absent(),
          noteId: Value(id),
          content: Value('Note content ${i + 1}'),
          historyType: HistoryType.addNote.index,
          createdAt: DateTime.now(),
        ),
      );
      noteIds.add(id);
    }

    // --- Step 3: Randomly connect notes and collections ---
    for (final noteId in noteIds) {
      // each note connects to 1–3 collections randomly
      final numConnections = 1 + random.nextInt(3);
      for (int j = 0; j < numConnections; j++) {
        final collectionId = collectionIds[random.nextInt(collectionIds.length)];
        await into(collectionNoteRefTable).insert(
          CollectionNoteRefTableCompanion.insert(
            noteId: noteId,
            collectionId: collectionId,
            createdAt: DateTime.now(),
          ),
        );
        await into(historyTable).insert(
          HistoryTableCompanion.insert(
            noteId: Value(noteId),
            collectionId: Value(collectionId),
            historyType: HistoryType.addConnection.index,
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    debugPrint('✅ Inserted simple mock data: 20 collections, 100 notes, and random connections.');
  }

  Future<void> insertMeaningfulMockData() async {
    final random = Random();
    final now = DateTime.now();

    // Some sample thematic words to create collections and notes around
    final themes = [
      'Nature',
      'Technology',
      'Dreams',
      'Memories',
      'Relationships',
      'Music',
      'Art',
      'Japan',
      'Design',
      'Writing',
      'Learning',
      'Philosophy',
      'Cities',
      'Poetry',
      'Time',
      'Light',
      'Food',
      'Work',
      'Movement',
      'Rest'
    ];

    // --- Step 0: Clear existing data before inserting new ---
    await batch((batch) {
      batch.deleteWhere(historyTable, (_) => const Constant(true));
      batch.deleteWhere(collectionNoteRefTable, (_) => const Constant(true));
      batch.deleteWhere(noteTable, (_) => const Constant(true));
      batch.deleteWhere(collectionTable, (_) => const Constant(true));
      batch.deleteWhere(noteCitationTable, (_) => const Constant(true));
      batch.deleteWhere(collectionMediaTable, (_) => const Constant(true));
    });
    debugPrint('🧹 Cleared all existing mock data.');

    // Step 1: Insert 20 meaningful collections
    final collectionIds = <int>[];
    for (final theme in themes) {
      final id = await into(collectionTable).insert(
        CollectionTableCompanion.insert(
          name: theme,
          description: Value('A collection of thoughts, media, and notes about $theme.'),
          media: random.nextBool()
              ? Value(Uint8List.fromList(List.generate(12, (_) => random.nextInt(255))))
              : const Value.absent(),
          // mediaId: const Value.absent(),
          // parentId: random.nextInt(10) < 3 && collectionIds.isNotEmpty
          //     ? Value(collectionIds[random.nextInt(collectionIds.length)]) // occasional nesting
          //     : const Value.absent(),
          createdAt: now.subtract(Duration(days: random.nextInt(60))),
          modifiedAt: now,
        ),
      );
      await into(historyTable).insert(
        HistoryTableCompanion.insert(
          noteId: Value.absent(),
          collectionId: Value(id),
          content: Value(theme),
          historyType: HistoryType.addCollection.index,
          createdAt: DateTime.now(),
        ),
      );
      collectionIds.add(id);
    }

    // Step 2: Generate 100 more realistic notes
    final noteIds = <int>[];

    final reflections = [
      'Sometimes I wonder if stillness is a kind of progress.',
      'Designing is like gardening — you can’t force things to grow faster.',
      'I keep thinking about how small moments define our memories.',
      'Maybe our tools shape our emotions more than we realize.',
      'Walking through Kyoto today reminded me how quiet can feel full.',
      'The way sunlight hits an empty cup says something about patience.',
      'Code is a form of poetry when written with care.',
      'Lately, I’ve been fascinated by invisible systems — like wind, or trust.',
      'Learning is a rhythm, not a race.',
      'There’s always beauty in the unfinished.'
    ];

    final quotes = [
      '"Simplicity is not the goal. It is the by-product of a good idea and modest expectations." – Paul Rand',
      '"We shape our tools and thereafter our tools shape us." – Marshall McLuhan',
      '"Art is the lie that enables us to realize the truth." – Picasso',
      '"Everything has beauty, but not everyone sees it." – Confucius',
      '"In the beginner’s mind there are many possibilities, in the expert’s few." – Shunryu Suzuki'
    ];

    final notes = [...reflections, ...quotes];

    for (int i = 0; i < 100; i++) {
      final content = notes[random.nextInt(notes.length)];

      final id = await into(noteTable).insert(
        NoteTableCompanion.insert(
          content: Value(content),
          media: random.nextInt(5) == 0
              ? Value(Uint8List.fromList(List.generate(20, (_) => random.nextInt(255))))
              : const Value.absent(),
          citationId: const Value.absent(),
          createdAt: now.subtract(Duration(days: random.nextInt(90))),
          modifiedAt: now,
        ),
      );
      await into(historyTable).insert(
        HistoryTableCompanion.insert(
          collectionId: Value.absent(),
          noteId: Value(id),
          content: Value(content),
          historyType: HistoryType.addNote.index,
          createdAt: DateTime.now(),
        ),
      );
      noteIds.add(id);
    }

    // Step 3: Randomly link notes to collections (1–3 per note)
    for (final noteId in noteIds) {
      final numConnections = 1 + random.nextInt(3);
      final selectedCollections = {
        for (int i = 0; i < numConnections; i++) collectionIds[random.nextInt(collectionIds.length)]
      };
      for (final cId in selectedCollections) {
        await into(collectionNoteRefTable).insert(
          CollectionNoteRefTableCompanion.insert(noteId: noteId, collectionId: cId, createdAt: DateTime.now()),
        );
        await into(historyTable).insert(
          HistoryTableCompanion.insert(
            noteId: Value(noteId),
            collectionId: Value(cId),
            historyType: HistoryType.addConnection.index,
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    debugPrint('✅ Inserted meaningful mock data: 20 themed collections, 100 notes, and random links.');
  }
}
