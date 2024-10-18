import 'package:field_generator/generator/content/items/boolean_item.dart';
import 'package:field_generator/generator/content/items/default_item.dart';
import 'package:field_generator/generator/content/items/multiple_text_item.dart';
import 'package:field_generator/generator/content/items/single_text_item.dart';
import 'package:field_generator/generator/content/items/website_item.dart';
import 'package:field_generator/generator/content/layout_properties.dart';
import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/fields/boolean.dart';
import 'package:field_generator/generator/model/fields/multiple_text.dart';
import 'package:field_generator/generator/model/fields/single_text.dart';
import 'package:field_generator/generator/model/fields/website.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final FieldData data;

  const Item({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    Widget item() {
      switch (data) {
        case SingleText data:
          return SingleTextItem(data: data);
        case MultipleText data:
          return MultipleTextItem(data: data);
        case Website data:
          return WebsiteItem(data: data);
        case Boolean data:
          return BooleanItem(data: data);
        default:
          return DefaultItem(data: data);
      }
    }

    return Container(
      height: itemHeight,
      width: 800,
      margin: const EdgeInsets.all(itemMargin),
      padding: const EdgeInsets.all(itemPadding),
      child: item(),
    );
  }
}
