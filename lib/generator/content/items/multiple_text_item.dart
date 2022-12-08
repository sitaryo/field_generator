import 'package:field_generator/generator/content/items/common/item_title.dart';
import 'package:field_generator/generator/model/fields/multiple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'common/use_text_field_controller.dart';

class MultipleTextItem extends HookWidget {
  final MultipleText data;

  const MultipleTextItem({
    Key? key,
    required this.data,
  }) : super(key: key);

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
          decoration: const InputDecoration(
            enabled: false,
            isDense: true,
          ),
        ),
      ],
    );
  }
}
