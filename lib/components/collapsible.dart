// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CollapsibleTile extends StatelessWidget {
  final Widget header;
  final List<Widget> content;
  const CollapsibleTile({
    super.key,
    required this.header,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      collapsedBackgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      title: header,
      children: content,
    );
  }
}
