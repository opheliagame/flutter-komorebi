import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';

class CollectionTextButton extends StatelessWidget {
  const CollectionTextButton({
    super.key,
    required this.collectionId,
    required this.collectionName,
  });

  final int collectionId;
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.router.push(HomeListRoute(collectionId: collectionId));
      },
      child: Text(
        collectionName,
      ),
    );
  }
}
