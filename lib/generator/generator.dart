import 'package:field_generator/generator/content/content.dart';
import 'package:field_generator/generator/field/field_list.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:field_generator/generator/properties/properties_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Generator extends HookWidget {
  const Generator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = useState<List<FieldDataGroup>>([]);
    final selectedItem = useState<UniqueKey?>(null);

    return Scaffold(
      backgroundColor: const Color(0xffebecf0),
      body: Row(
        children: [
          const FieldList(),
          Content(item: item, selectedItem: selectedItem),
          PropertiesCard(
            item: item,
            selectedItem: selectedItem,
          ),
        ],
      ),
    );
  }
}
