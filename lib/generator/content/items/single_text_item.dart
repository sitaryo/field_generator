import 'package:field_generator/generator/content/items/common/item_title.dart';
import 'package:field_generator/generator/content/items/common/use_text_field_controller.dart';
import 'package:field_generator/generator/model/fields/single_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SingleTextItem extends HookWidget {
  final SingleText data;

  const SingleTextItem({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextFieldController(
      data,
      () => data.defaultValue ?? "",
      data.defaultValue,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemTitle(data: data),
        TextField(
          controller: controller,
          decoration: const InputDecoration(enabled: false, isDense: true),
        ),
      ],
    );
  }
}
