import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/common_widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_komorebi/src/common_widgets/app_top_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class RoamPage extends ConsumerWidget {
  const RoamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppTopBar(),
      body: Center(
        child: Text('search page'),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
