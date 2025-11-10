import 'package:flutter_komorebi/src/features/collections/data/collections_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CollectionsNotifier extends StateNotifier<void> {
  CollectionsNotifier({required this.ref}) : super(null);
  final Ref ref;

  Future<bool> createCollection({
    required String collectionName,
    String? description,
    XFile? media,
  }) async {
    return ref
        .watch(collectionsRepositoryProvider)
        .createCollection(collectionName: collectionName, description: description, media: media);
  }

  Future<bool> deleteCollection(int collectionId) async {
    return ref.watch(collectionsRepositoryProvider).deleteCollection(collectionId);
  }
}

final collectionsNotifierProvider = StateNotifierProvider<CollectionsNotifier, void>((ref) {
  return CollectionsNotifier(ref: ref);
});
