import 'package:field_generator/generator/model/to_json.dart';
import 'package:flutter/material.dart';

abstract class FieldData<V> extends ToJson {
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
  Map toJson() => {
        "name": name,
        "percentage": percentage,
        "type": type,
        "description": description,
        "defaultValue": defaultValue,
      };

  @override
  String toString() {
    return 'FieldData{key: $key, name: $name, percentage: $percentage, description: $description, defaultValue: $defaultValue}';
  }
}
