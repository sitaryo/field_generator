import 'package:field_generator/generator/model/field_data.dart';

class MultipleText extends FieldData<String> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  MultipleText(
    int percentage, {
    super.defaultValue,
    super.description,
    String? name,
  }) : super(name ?? "多行文本", percentage, "多行文本");

  @override
  MultipleText clone() => MultipleText(percentage);

  @override
  Map toJson() => super.toJson()
    ..addAll({
      "required": required,
      "unique": unique,
      "hidden": hidden,
    });

  MultipleText.fromJson(Map json)
      : required = json["required"],
        unique = json["unique"],
        hidden = json["hidden"],
        super(
          json["name"],
          json["percentage"],
          json["type"],
          description: json["description"],
          defaultValue: json["defaultValue"],
        );
}
