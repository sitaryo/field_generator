import 'package:field_generator/generator/model/field_data.dart';

class FieldDataGroup {
  List<FieldData> data;
  bool dragging;
  bool isListItem;
  bool isTemplate;
  int? index;

  FieldDataGroup(
    this.data,
    this.dragging,
    this.isListItem,
    this.isTemplate, {
    this.index,
  });

  FieldDataGroup.draggingItem(this.data)
      : dragging = true,
        isListItem = false,
        isTemplate = false;

  FieldDataGroup.listItem(this.data, {this.index})
      : dragging = false,
        isListItem = true,
        isTemplate = false;

  FieldDataGroup.templateItem(
      this.data,
      )   : dragging = false,
        isListItem = false,
        isTemplate = true;

  @override
  String toString() {
    return 'FieldDataGroup{data: $data}';
  }
}
