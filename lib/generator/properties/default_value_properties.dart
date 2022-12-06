import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/fields/boolean.dart';
import 'package:field_generator/generator/model/fields/multiple_text.dart';
import 'package:field_generator/generator/model/fields/website.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../model/fields/single_text.dart';

class DefaultValueProperties extends HookWidget {
  final FieldData data;
  final VoidCallback refreshListData;

  const DefaultValueProperties({
    Key? key,
    required this.data,
    required this.refreshListData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (data.runtimeType) {
        case Boolean:
          final d = data as Boolean;
          return _BooleanDefaultValue(
            defaultValue: d.defaultValue ?? false,
            onChanged: (v) {
              d.defaultValue = v;
              refreshListData();
            },
          );
        case SingleText:
        case MultipleText:
        case Website:
          return _StringDefaultValue(
            defaultValue: data.defaultValue as String?,
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
  final void Function(bool?) onChanged;

  const _BooleanDefaultValue({
    Key? key,
    required this.defaultValue,
    required this.onChanged,
  }) : super(key: key);

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
  final String? defaultValue;
  final void Function(String?) onChanged;

  const _StringDefaultValue({
    Key? key,
    required this.defaultValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useRef(TextEditingController());

    useEffect(() {
      controller.value.text = defaultValue ?? "";
    }, []);

    return TextField(
      controller: controller.value,
      onChanged: onChanged,
    );
  }
}
