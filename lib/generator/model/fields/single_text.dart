import 'package:field_generator/generator/model/field_data.dart';

class SingleText extends FieldData<String> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  SingleText(
    int percentage, {
    super.defaultValue,
    super.description,
    String? name,
  }) : super(name ?? "单行文本", percentage, "单行文本");

  @override
  SingleText clone() => SingleText(percentage);

  @override
  Map toJson() => super.toJson()
    ..addAll({
      "required": required,
      "unique": unique,
      "hidden": hidden,
    });

  SingleText.fromJson(Map json)
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
