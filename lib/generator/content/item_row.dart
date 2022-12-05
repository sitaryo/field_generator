import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ItemRow extends HookWidget {
  final FieldDataGroup group;
  final Widget Function(FieldData data) builder;

  const ItemRow({Key? key, required this.group, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flexCount = group.data.map((e) => e.flex).reduce((a, b) => a + b);
    return Row(
      children: [
        ...group.data
            .map((e) => Expanded(flex: e.flex, child: builder(e)))
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
