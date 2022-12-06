import 'package:field_generator/generator/model/field_data.dart';

class Boolean extends FieldData<bool> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  Boolean(int percentage)
      : super(
          "布尔值",
          percentage,
          "布尔值",
          defaultValue: false,
        );

  @override
  Boolean clone() => Boolean(percentage);
}
