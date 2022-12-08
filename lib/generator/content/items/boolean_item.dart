import 'package:field_generator/generator/content/items/common/item_title.dart';
import 'package:field_generator/generator/model/fields/boolean.dart';
import 'package:flutter/material.dart';

class BooleanItem extends StatelessWidget {
  final Boolean data;

  const BooleanItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemTitle(data: data),
        Switch(
          value: data.defaultValue ?? false,
          onChanged: (_) {},
        ),
      ],
    );
  }
}
