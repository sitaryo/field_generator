import 'package:field_generator/generator/model/fields/boolean.dart';
import 'package:field_generator/generator/model/fields/single_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BooleanItem extends HookWidget {
  final Boolean data;

  const BooleanItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 800,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${data.name}${data.description != null ? "(${data.description})" : ""}",
          ),
          Switch(
            value: data.defaultValue ?? false,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
