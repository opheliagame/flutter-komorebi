import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/design_system/collection/collection_tile.dart';
import 'package:flutter_komorebi/src/design_system/skins/app_skin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CollectionTile renders skin image instead of icon', (tester) async {
    final collection = CollectionEntity(
      id: 1,
      name: 'Test Collection',
      description: null,
      media: null,
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appSkinProvider.overrideWith((ref) => AppSkin.defaultSkin),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: CollectionTile(
              collection: collection,
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Test Collection'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.local_florist_outlined), findsNothing);
  });
}
