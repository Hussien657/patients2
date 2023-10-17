import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  ListViewSeparated({
    super.key,
    required this.itemCount,
    required this.child,
  });
  final int itemCount;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return child;
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}