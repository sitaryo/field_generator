import 'package:field_generator/generator/content/item_row_layout.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';

class ItemDragging extends StatelessWidget {
  final FieldDataGroup group;

  const ItemDragging({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 84,
          width: 784,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.blueAccent,
          ),
          padding: const EdgeInsets.all(8),
          child: ItemRowLayout(
            group: group,
            builder: (data, i) => Center(
              child: Text(
                data.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
