import 'package:flutter/material.dart';

class FieldData {
  UniqueKey key = UniqueKey();
  String title;
  int flex;
  bool dragging;
  bool isListItem;
  bool isTemplate;
  int? index;

  FieldData(
    this.title,
    this.flex,
    this.dragging,
    this.isListItem,
    this.isTemplate, {
    this.index,
  });

  FieldData.draggingItem(this.title, this.flex)
      : dragging = true,
        isListItem = false,
        isTemplate = false;

  FieldData.listItem(this.title, this.flex, {this.index})
      : dragging = false,
        isListItem = true,
        isTemplate = false;

  FieldData.templateItem(
    this.title,
    this.flex,
  )   : dragging = false,
        isListItem = false,
        isTemplate = true;

  copyWith({
    String? title,
    int? flex,
    bool? dragging,
    bool? isListItem,
    bool? isTemplate,
    int? index,
  }) =>
      FieldData(
        title ?? this.title,
        flex ?? this.flex,
        dragging ?? this.dragging,
        isListItem ?? this.isListItem,
        isTemplate ?? this.isTemplate,
        index: index ?? this.index,
      );

  @override
  String toString() {
    return 'FieldData{key: $key, title: $title, flex: $flex, dragging: $dragging, isListItem: $isListItem, isTemplate: $isTemplate, index: $index}';
  }
}
