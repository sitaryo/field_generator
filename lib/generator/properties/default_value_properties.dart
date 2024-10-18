import 'package:field_generator/generator/model/field_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DefaultValueProperties extends StatelessWidget {
  final FieldData data;
  final VoidCallback refreshListData;

  const DefaultValueProperties({
    super.key,
    required this.data,
    required this.refreshListData,
  });

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (data) {
        case FieldData<bool> d:
          return _BooleanDefaultValue(
            data: data,
            defaultValue: d.defaultValue ?? false,
            onChanged: (v) {
              d.defaultValue = v;
              refreshListData();
            },
          );
        case FieldData<String> data:
          return _StringDefaultValue(
            data: data,
            defaultValue: data.defaultValue,
            onChanged: (v) {
              data.defaultValue = v ?? "";
              refreshListData();
            },
          );
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("默认值"),
          body(),
        ],
      ),
    );
  }
}

class _BooleanDefaultValue extends HookWidget {
  final bool defaultValue;
  final FieldData data;
  final void Function(bool?) onChanged;

  const _BooleanDefaultValue({
    required this.defaultValue,
    required this.onChanged,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      items: [false, true]
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e ? "选中" : "不选中"),
              ))
          .toList(),
      value: defaultValue,
      onChanged: onChanged,
    );
  }
}

class _StringDefaultValue extends HookWidget {
  final FieldData data;
  final String? defaultValue;
  final void Function(String?) onChanged;

  const _StringDefaultValue({
    required this.defaultValue,
    required this.onChanged,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useRef(TextEditingController());

    useEffect(() {
      controller.value.text = defaultValue ?? "";
      return null;
    }, [data.key]);

    return TextField(
      controller: controller.value,
      onChanged: onChanged,
    );
  }
}
