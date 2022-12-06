import 'package:field_generator/generator/model/field_data.dart';

class Boolean extends FieldData<bool> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  Boolean(
    int percentage, {
    bool? defaultValue,
    super.description,
    String? name,
  }) : super("布尔值", percentage, "布尔值", defaultValue: defaultValue ?? false);

  @override
  Boolean clone() => Boolean(percentage);

  @override
  Map toJson() => super.toJson()
    ..addAll({
      "required": required,
      "unique": unique,
      "hidden": hidden,
    });

  Boolean.fromJson(Map json)
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
