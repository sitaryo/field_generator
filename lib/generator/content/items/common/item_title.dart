import 'package:field_generator/generator/model/field_data.dart';
import 'package:flutter/material.dart';

class ItemTitle extends StatelessWidget {
  final FieldData data;

  const ItemTitle({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final name = data.name;
    final description = data.description != null ? "(${data.description})" : "";
    return Text("$name $description");
  }
}
