import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ItemRowLayout extends HookWidget {
  final FieldDataGroup group;
  final Widget Function(FieldData data, int index) builder;

  const ItemRowLayout({Key? key, required this.group, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flexCount = group.data.map((e) => e.flex).reduce((a, b) => a + b);
    return Row(
      children: [
        ...group.data
            .asMap()
            .map((i, e) =>
                MapEntry(i, Expanded(flex: e.flex, child: builder(e, i))))
            .values
            .toList(),
        if (flexCount < 4)
          Expanded(
            flex: 4 - flexCount,
            child: const SizedBox(),
          ),
      ],
    );
  }
}
