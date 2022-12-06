import 'package:field_generator/generator/model/field_data.dart';

class SingleText extends FieldData<String> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  SingleText(int percentage) : super("单行文本", percentage,"单行文本");

  @override
  SingleText clone() => SingleText(percentage);
}
