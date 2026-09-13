import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/core/domain/collection_entity.dart';
import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_komorebi/src/features/collections/data/fake_collections_repository_impl.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/page/create_page.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/features/search/data/semantic_search_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final collections = [
    CollectionEntity(
      id: 1,
      name: 'Physics',
      description: 'Research and experiments',
      media: null,
      createdAt: DateTime(2026),
      modifiedAt: DateTime(2026),
    ),
    CollectionEntity(
      id: 2,
      name: 'Cooking',
      description: 'Recipes and meals',
      media: null,
      createdAt: DateTime(2026),
      modifiedAt: DateTime(2026),
    ),
  ];

  testWidgets('Create note shows inline collection search before content input',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          collectionsRepositoryProvider.overrideWithValue(
            _CollectionsRepository(collections),
          ),
          semanticSearchServiceProvider.overrideWithValue(
            _SemanticSearchService(),
          ),
        ],
        child: const MaterialApp(
          home: CreatePage(entityType: EntityType.note),
        ),
      ),
    );

    expect(find.text('Search collections'), findsOneWidget);
    expect(find.byType(TextFormField), findsNothing);
  });

  testWidgets('Create note uses semantic collection results', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          collectionsRepositoryProvider.overrideWithValue(
            _CollectionsRepository(collections),
          ),
          semanticSearchServiceProvider.overrideWithValue(
            _SemanticSearchService(collectionResults: [2]),
          ),
        ],
        child: const MaterialApp(
          home: CreatePage(entityType: EntityType.note),
        ),
      ),
    );
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'food ideas');
    await tester.pumpAndSettle();

    expect(find.text('Cooking'), findsOneWidget);
    expect(find.text('Physics'), findsNothing);
  });
}

class _CollectionsRepository extends FakeCollectionsRepository {
  _CollectionsRepository(this.collections);

  final List<CollectionEntity> collections;

  @override
  Stream<List<CollectionEntity>> watchAllCollections() {
    return Stream.value(collections);
  }
}

class _SemanticSearchService extends FakeSemanticSearchService {
  _SemanticSearchService({this.collectionResults = const []});

  final List<int> collectionResults;

  @override
  Future<List<int>> searchSimilarCollections({
    required String query,
    int topK = 10,
    double threshold = 0.0,
  }) async {
    return collectionResults.take(topK).toList();
  }
}
