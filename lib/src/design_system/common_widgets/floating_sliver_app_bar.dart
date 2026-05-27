import 'package:flutter/material.dart';

class FloatingSliverAppBar extends StatelessWidget {
  const FloatingSliverAppBar({
    super.key,
    this.title,
    this.actions,
    this.forceElevated = false,
  });

  final Widget? title;
  final List<Widget>? actions;
  final bool forceElevated;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      forceElevated: forceElevated,
      title: title,
      actions: actions,
    );
  }
}
