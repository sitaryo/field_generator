import 'package:field_generator/generator/model/field_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DescriptionProperties extends HookWidget {
  final FieldData data;
  final VoidCallback refreshListData;

  const DescriptionProperties({
    required this.data,
    required this.refreshListData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useRef(TextEditingController());

    useEffect(() {
      controller.value.text = data.name;
    }, [data.key]);

    descriptionChanged(String? s) {
      data.description = s;
      refreshListData();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("提示文字"),
          TextField(onChanged: descriptionChanged),
        ],
      ),
    );
  }
}
