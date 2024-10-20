import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:field_generator/generator/properties/default_value_properties.dart';
import 'package:field_generator/generator/properties/description_properties.dart';
import 'package:field_generator/generator/properties/name_properties.dart';
import 'package:field_generator/generator/properties/percentage_properites.dart';
import 'package:flutter/material.dart';

class PropertiesCard extends StatelessWidget {
  final ValueNotifier<List<FieldDataGroup>> item;
  final ValueNotifier<UniqueKey?> selectedItem;

  const PropertiesCard({
    super.key,
    required this.item,
    required this.selectedItem,
  });

  FieldData? getCurrentSelectedData() {
    if (selectedItem.value == null) {
      return null;
    }
    return item.value
        .expand((e) => e.data)
        .firstWhere((e) => e.key == selectedItem.value);
  }

  int getCurrentRowIndex() {
    return item.value
        .indexWhere((e) => e.data.any((d) => d.key == selectedItem.value));
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

    refreshListData() => item.value = [...item.value];

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
      refreshListData();
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
              data.type,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            NameProperties(data: data, refreshListData: refreshListData),
            DescriptionProperties(data: data, refreshListData: refreshListData),
            DefaultValueProperties(
              data: data,
              refreshListData: refreshListData,
            ),
            PercentageProperties(
              isSelected: selectedFlex(data),
              onPressed: onFlexChanged,
            ),
          ],
        ),
      ),
    );
  }
}
