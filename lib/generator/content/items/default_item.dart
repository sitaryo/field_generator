import 'package:field_generator/generator/model/field_data.dart';
import 'package:flutter/material.dart';

class DefaultItem extends StatelessWidget {
  final FieldData data;

  const DefaultItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
