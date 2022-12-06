import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/fields/boolean.dart';
import 'package:field_generator/generator/model/fields/default_item_data.dart';
import 'package:field_generator/generator/model/fields/single_text.dart';
import 'package:field_generator/generator/model/to_json.dart';

class FieldDataGroup extends ToJson {
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

  @override
  Map toJson() => {
        "data": data.map((e) => e.toJson()).toList(),
        "dragging": dragging,
        "isTemplate": isTemplate,
        "index": index,
      };

  FieldDataGroup.fromJson(Map json)
      : data = List.from(json["data"])
            .map((e) {
              switch (e['type'] as String) {
                case "单行文本":
                  return SingleText.fromJson(e);
                case "多行文本":
                  return SingleText.fromJson(e);
                case "网址":
                  return SingleText.fromJson(e);
                case "布尔值":
                  return Boolean.fromJson(e);
                default:
                  return DefaultItemData.fromJson(e);
              }
            })
            .whereType<FieldData>()
            .toList(),
        dragging = json['dragging'],
        isTemplate = json['isTemplate'],
        index = json['index'];
}
