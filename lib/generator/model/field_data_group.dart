import 'package:field_generator/generator/model/field_data.dart';

class FieldDataGroup {
  List<FieldData> data;
  bool dragging;
  bool isTemplate;
  int? index;

  FieldDataGroup(
    this.data,
    this.dragging,
    this.isTemplate, {
    this.index,
  });

  FieldDataGroup.draggingItem(this.data)
      : dragging = true,
        isTemplate = false;

  FieldDataGroup.listItem(this.data, {this.index})
      : dragging = false,
        isTemplate = false;

  FieldDataGroup.templateItem(this.data)
      : dragging = false,
        isTemplate = true;

  @override
  String toString() {
    return 'FieldDataGroup{data: $data, dragging: $dragging, isTemplate: $isTemplate, index: $index}';
  }
}
