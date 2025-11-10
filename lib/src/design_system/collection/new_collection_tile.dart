import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';

class NewCollectionTile extends StatelessWidget {
  const NewCollectionTile({
    super.key,
    required this.collectionId,
  });

  final int collectionId;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.pushRoute(CreateRoute(collectionId: collectionId));
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Theme.of(context).buttonTheme.colorScheme?.primaryContainer,
            child: Center(
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
