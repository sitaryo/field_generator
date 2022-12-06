import 'package:field_generator/generator/model/field_data.dart';

class DefaultItemData extends FieldData<dynamic> {
  DefaultItemData(name, percentage):super(name,percentage,name);

  @override
  DefaultItemData clone() => DefaultItemData(name, percentage);
}
