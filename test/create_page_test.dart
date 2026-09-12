import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/page/create_page.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Create note shows inline collection search before content input', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: CreatePage(entityType: EntityType.note),
        ),
      ),
    );

    expect(find.text('Search collections'), findsOneWidget);
    expect(find.byType(TextFormField), findsNothing);
  });
}
