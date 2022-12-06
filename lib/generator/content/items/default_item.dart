import 'package:field_generator/generator/model/field_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DefaultItem extends HookWidget {
  final FieldData data;

  const DefaultItem({
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
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          data.name,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
