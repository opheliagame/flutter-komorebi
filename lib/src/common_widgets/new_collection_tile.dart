import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/collections/presentation/create_page.dart';

class NewCollectionTile extends StatelessWidget {
  const NewCollectionTile({
    super.key,
    required this.collectionId,
  });

  final int? collectionId;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CreatePage(collectionId: collectionId);
          }));
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
