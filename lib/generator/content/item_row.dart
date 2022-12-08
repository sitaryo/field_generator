import 'dart:math' as math;

import 'package:field_generator/generator/content/item.dart';
import 'package:field_generator/generator/content/item_row_layout.dart';
import 'package:field_generator/generator/content/move_layer.dart';
import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final ValueNotifier<List<FieldDataGroup>> item;
  final FieldDataGroup group;
  final ValueNotifier<UniqueKey?> selectIndexes;
  final int row;
  final void Function(UniqueKey key) onTap;

  const ItemRow({
    Key? key,
    required this.item,
    required this.group,
    required this.row,
    required this.selectIndexes,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    rangeItem() {
      item.value.asMap().forEach((i, element) => element.index = i);
      item.value = [...item.value];
    }

    moveUp(int col, FieldData data) {
      var prev = item.value[row - 1];
      var cur = item.value[row];

      cur.data.removeAt(col);
      if (cur.data.isEmpty) {
        item.value.removeAt(row);
      }
      var other =
          4 - prev.data.map((e) => e.percentage).reduce((a, b) => a + b);
      data.percentage = math.min(other, data.percentage);
      prev.data.add(data);
      if (other == 0) {
        for (var e in prev.data) {
          e.percentage = prev.data.length == 2 ? 2 : 1;
        }
      }
      rangeItem();
    }

    moveDown(int col, FieldData data) {
      var cur = item.value[row];

      if (cur.data.length == 1) {
        // switch with next row
        final c = item.value.removeAt(row);
        item.value.insert(row + 1, c);
      } else {
        // move item to a new row
        data.percentage = 4;
        group.data.removeAt(col);
        item.value.insert(row + 1, FieldDataGroup.listItem([data]));
      }
      rangeItem();
    }

    moveLeft(int col) {
      var c = group.data.removeAt(col);
      group.data.insert(col - 1, c);
      rangeItem();
    }

    moveRight(int col) {
      var c = group.data.removeAt(col);
      group.data.insert(col + 1, c);
      rangeItem();
    }

    copy(FieldData data) {
      final newOne = data.clone();
      item.value.insert(row + 1, FieldDataGroup.listItem([newOne]));
      selectIndexes.value = newOne.key;
      rangeItem();
    }

    delete(int col) {
      if (group.data.length == 1) {
        item.value.removeAt(row);
      } else {
        group.data.removeAt(col);
      }
      selectIndexes.value = null;
      rangeItem();
    }

    return MouseRegion(
      cursor: SystemMouseCursors.move,
      child: ItemRowLayout(
        group: group,
        builder: (data, col) => selectIndexes.value == data.key
            ? MoveLayer(
                moveUp: row != 0 && item.value[row - 1].data.length != 4
                    ? () => moveUp(col, data)
                    : null,
                moveDown: () => moveDown(col, data),
                moveLeft: col != 0 ? () => moveLeft(col) : null,
                moveRight:
                    col != group.data.length - 1 ? () => moveRight(col) : null,
                copy: () => copy(data),
                delete: () => delete(col),
                child: Item(data: data),
              )
            : InkWell(
                onTap: () => onTap(data.key),
                child: Item(data: data),
              ),
      ),
    );
  }
}
