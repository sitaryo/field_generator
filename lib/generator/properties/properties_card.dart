import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PropertiesCard extends HookWidget {
  final ValueNotifier<List<FieldDataGroup>> item;
  final ValueNotifier<UniqueKey?> selectedIndexes;

  const PropertiesCard({
    Key? key,
    required this.item,
    required this.selectedIndexes,
  }) : super(key: key);

  FieldData? getCurrentSelectedData() {
    if (selectedIndexes.value == null) {
      return null;
    }
    return item.value
        .expand((e) => e.data)
        .firstWhere((e) => e.key == selectedIndexes.value);
  }

  int getCurrentRowIndex() {
    return item.value
        .indexWhere((e) => e.data.any((d) => d.key == selectedIndexes.value));
  }

  List<bool> selectedFlex(FieldData data) {
    final selected = List.filled(4, false);
    selected[data.percentage - 1] = true;
    return selected;
  }

  @override
  Widget build(BuildContext context) {
    final data = getCurrentSelectedData();
    if (data == null) {
      return const SizedBox();
    }

    onFlexChanged(int flex) {
      if (data.percentage == flex) {
        return;
      }
      data.percentage = flex;
      // 改变 flex 之后，重新整理布局。
      // 如果当前行的 flex 总数大于4，则将该行分成 flex 总数 <= 4 的若干行
      final row = getCurrentRowIndex();
      var f = 0;
      List<FieldDataGroup> groupToInsert = [FieldDataGroup.listItem([])];
      for (var value in item.value[row].data) {
        f += value.percentage;
        if (f > 4) {
          groupToInsert.add(FieldDataGroup.listItem([value]));
          f = value.percentage;
        } else {
          groupToInsert.last.data.add(value);
        }
      }
      item.value
        ..removeAt(row)
        ..insertAll(row, groupToInsert)
        ..asMap().forEach((i, element) => element.index = i);
      item.value = [...item.value];
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            ToggleButtons(
              onPressed: (flex) => onFlexChanged(flex + 1),
              isSelected: selectedFlex(data),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
              fillColor: Colors.blue[200],
              color: Colors.blue[400],
              children: const [
                Text("25%"),
                Text("50%"),
                Text("75%"),
                Text("100%"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
