import 'package:field_generator/generator/content/item.dart';
import 'package:field_generator/generator/content/item_row_layout.dart';
import 'package:field_generator/generator/content/move_layer.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ItemRow extends HookWidget {
  final FieldDataGroup group;
  final UniqueKey? selectIndexes;
  final int row;
  final void Function(UniqueKey key) onTap;

  const ItemRow({
    Key? key,
    required this.group,
    required this.row,
    required this.selectIndexes,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.move,
      child: ItemRowLayout(
        group: group,
        builder: (data, col) => selectIndexes == data.key
            ? MoveLayer(child: Item(data: data))
            : InkWell(
                onTap: () => onTap(data.key),
                child: Item(data: data),
              ),
      ),
    );
  }
}
