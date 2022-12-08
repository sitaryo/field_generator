import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../model/fields/single_text.dart';
import '../sized_box.dart';

class FieldTag extends HookWidget {
  final IconData icon;
  final FieldData Function(int percentage) dataBuilder;

  const FieldTag(
    this.icon,
    this.dataBuilder, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const normalColor = Colors.black;
    final focusColor = Theme.of(context).colorScheme.primary;
    final color = useState(normalColor);
    final data = useState(dataBuilder(4));

    onHover(bool hasHover) => color.value = hasHover ? focusColor : normalColor;

    final content = Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16,
            color: color.value,
          ),
          w8,
          Text(
            data.value.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: color.value, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );

    child(bool dragging) {
      return Container(
        width: 125,
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: Colors.white,
        ),
        child: dragging
            ? content
            : InkWell(onHover: onHover, onTap: () => {}, child: content),
      );
    }

    return Draggable<FieldDataGroup>(
      data: FieldDataGroup.templateItem([data.value]),
      onDragEnd: (d) {
        color.value = normalColor;
        // 加入 list 之后生成新的 data ，否则 list 内将会有多个相同元素
        data.value = dataBuilder(4);
      },
      feedback: child(true),
      child: child(false),
    );
  }
}
