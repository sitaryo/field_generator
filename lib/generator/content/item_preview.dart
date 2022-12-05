import 'package:dotted_border/dotted_border.dart';
import 'package:field_generator/generator/content/item_row.dart';
import 'package:field_generator/generator/model/field_data_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ItemPreview extends HookWidget {
  final FieldDataGroup group;

  const ItemPreview({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(8),
        padding: const EdgeInsets.all(8),
        color: Colors.black45,
        child: ItemRow(
          group: group,
          builder:(data)=> Container(
            height: 68,
            width: 800,
            decoration: const BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(8)),
              color: Color(0xffebecf0),
            ),
            child: Center(
              child: Text(
                data.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  fontWeight: FontWeight.w700,
                  // color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
