import 'package:field_generator/generator/model/field_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NameProperties extends HookWidget {
  final FieldData data;
  final VoidCallback refreshListData;

  const NameProperties({
    Key? key,
    required this.data,
    required this.refreshListData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useRef(TextEditingController());

    useEffect(() {
      controller.value.text = data.name;
    }, [data.key]);

    nameChanged(String? s) {
      data.name = s ?? "";
      refreshListData();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("标识名"),
          TextField(
            controller: controller.value,
            onChanged: nameChanged,
          ),
        ],
      ),
    );
  }
}
