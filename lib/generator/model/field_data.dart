import 'package:flutter/material.dart';

abstract class FieldData<V> {
  UniqueKey key = UniqueKey();
  String name;
  int percentage;
  String type;
  String? description;
  V? defaultValue;

  FieldData(
    this.name,
    this.percentage,
    this.type, {
    this.defaultValue,
    this.description,
  });

  @protected
  FieldData<V> clone();

  @override
  String toString() {
    return 'FieldData{key: $key, name: $name, percentage: $percentage, description: $description, defaultValue: $defaultValue}';
  }
}
