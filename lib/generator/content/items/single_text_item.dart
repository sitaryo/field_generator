import 'package:field_generator/generator/model/fields/single_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SingleTextItem extends HookWidget {
  final SingleText data;

  const SingleTextItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = useRef(TextEditingController());

    useEffect(() {
      controller.value.text = data.defaultValue ?? "";
    }, [data.defaultValue]);

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
          TextField(
            controller: controller.value,
            decoration: const InputDecoration(enabled: false,isDense: true),
          ),
        ],
      ),
    );
  }
}
