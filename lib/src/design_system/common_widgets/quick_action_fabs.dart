import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart';
import 'package:flutter_komorebi/src/router/app_router.gr.dart';

class QuickActionFabs extends StatelessWidget {
  const QuickActionFabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton.small(
          heroTag: 'quick_action_search',
          onPressed: () {
            context.pushRoute(SearchRoute());
          },
          child: const Icon(Icons.search),
        ),
        const SizedBox(height: 12),
        FloatingActionButton.small(
          heroTag: 'quick_action_roam',
          onPressed: () {
            context.pushRoute(RoamRoute());
          },
          child: const Icon(Icons.shuffle),
        ),
        const SizedBox(height: 12),
        FloatingActionButton.small(
          heroTag: 'quick_action_create',
          onPressed: () {
            context.pushRoute(CreateRoute(entityType: EntityType.note));
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
