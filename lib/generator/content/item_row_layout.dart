import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';

class ItemRowLayout extends StatelessWidget {
  final FieldDataGroup group;
  final Widget Function(FieldData data, int index) builder;

  const ItemRowLayout({super.key, required this.group, required this.builder});

  @override
  Widget build(BuildContext context) {
    final flexCount =
        group.data.map((e) => e.percentage).reduce((a, b) => a + b);
    return Row(
      children: [
        ...group.data
            .asMap()
            .map((i, e) =>
                MapEntry(i, Expanded(flex: e.percentage, child: builder(e, i))))
            .values
            ,
        if (flexCount < 4)
          Expanded(
            flex: 4 - flexCount,
            child: const SizedBox(),
          ),
      ],
    );
  }
}
