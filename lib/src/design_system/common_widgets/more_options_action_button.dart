import 'package:flutter/material.dart';

class MoreOptionsActionButton extends StatelessWidget {
  const MoreOptionsActionButton({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text('Options'),
            children: children,
          ),
        );
      },
    );
  }
}
