import 'package:field_generator/generator/model/field_data.dart';

class DefaultItemData extends FieldData<dynamic> {
  DefaultItemData(
    name,
    percentage, {
    super.defaultValue,
    super.description,
  }) : super(name, percentage, name);

  @override
  DefaultItemData clone() => DefaultItemData(name, percentage);

  DefaultItemData.fromJson(Map json)
      : super(
          json["name"],
          json["percentage"],
          json["type"],
          description: json["description"],
          defaultValue: json["defaultValue"],
        );
}
