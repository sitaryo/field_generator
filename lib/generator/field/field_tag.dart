import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FieldTag extends HookWidget {
  final IconData icon;
  final String text;

  const FieldTag({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const normalColor = Colors.black;
    final focusColor = Theme.of(context).colorScheme.primary;
    final color = useState(normalColor);

    onHover(bool hasHover) => color.value = hasHover ? focusColor : normalColor;

    final child = Container(
      width: 125,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      child: InkWell(
        onHover: onHover,
        onTap: () => {},
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: color.value,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: color.value, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
    final childWhenDragging = Container(
      width: 125,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: color.value,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: color.value,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
    return Draggable<FieldDataGroup>(
      data: FieldDataGroup.templateItem([FieldData.templateItem(text, 4)]),
      onDragEnd: (d) => color.value = normalColor,
      feedback: childWhenDragging,
      child: child,
    );
  }
}
