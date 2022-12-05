import 'package:field_generator/generator/content/content.dart';
import 'package:field_generator/generator/field/field_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Generator extends HookWidget {
  const Generator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebecf0),
      body: Row(
        children: [
          FieldList(),
          Content(),
        ],
      ),
    );
  }
}
