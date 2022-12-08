import 'package:field_generator/generator/model/field_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useTextFieldController(
  FieldData data,
  String Function() initValue,
  dynamic key,
) {
  final controller = useTextEditingController();

  useEffect(() {
    controller.text = initValue();

    return () => {};
  }, [key]);
  return controller;
}
