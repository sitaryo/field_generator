import 'package:field_generator/generator/model/field_data.dart';

class MultipleText extends FieldData<String> {
  bool required = false;
  bool unique = false;
  bool hidden = false;

  MultipleText(int percentage) : super("多行文本", percentage, "多行文本");

  @override
  MultipleText clone() => MultipleText(percentage);
}
