import 'package:dotted_border/dotted_border.dart';
import 'package:field_generator/generator/content/item_row_layout.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';

class ItemPreview extends StatelessWidget {
  final FieldDataGroup group;

  const ItemPreview({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(8),
      color: Colors.black45,
      child: ItemRowLayout(
        group: group,
        builder: (data, i) => Container(
          height: 68,
          width: 800,
          margin: EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color(0xffebecf0),
          ),
          child: Center(
            child: Text(
              data.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
