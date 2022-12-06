import 'package:field_generator/generator/model/field_data.dart';

class Website extends FieldData<String> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  Website(
    int percentage, {
    super.defaultValue,
    super.description,
    String? name,
  }) : super(name ?? "网址", percentage, "网址");

  @override
  Website clone() => Website(percentage);

  @override
  Map toJson() => super.toJson()
    ..addAll({
      "required": required,
      "unique": unique,
      "hidden": hidden,
    });

  Website.fromJson(Map json)
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
