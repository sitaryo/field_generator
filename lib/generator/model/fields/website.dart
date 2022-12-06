import 'package:field_generator/generator/model/field_data.dart';

class Website extends FieldData<String> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  Website(int percentage) : super("网址", percentage, "网址");

  @override
  Website clone() => Website(percentage);
}
