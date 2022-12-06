import 'package:flutter/material.dart';

class FieldData {
  UniqueKey key = UniqueKey();
  String name;
  int percentage;

  FieldData(this.name, this.percentage);

  copyWith({String? name, int? percentage}) =>
      FieldData(name ?? this.name, percentage ?? this.percentage);

  @override
  String toString() {
    return 'FieldData{key: $key, title: $name, percentage: $percentage}';
  }
}
