import 'package:field_generator/generator/content/item_row.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Item extends HookWidget {
  final FieldDataGroup group;

  const Item({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.move,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ItemRow(
          group: group,
          builder: (data) => Container(
            height: 84,
            width: 800,
            padding: const EdgeInsets.all(8),
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                data.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
