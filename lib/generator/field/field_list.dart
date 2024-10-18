import 'package:field_generator/generator/field/field_tag.dart';
import 'package:field_generator/generator/model/fields/boolean.dart';
import 'package:field_generator/generator/model/fields/default_item_data.dart';
import 'package:field_generator/generator/model/fields/multiple_text.dart';
import 'package:field_generator/generator/model/fields/single_text.dart';
import 'package:field_generator/generator/model/fields/website.dart';
import 'package:field_generator/generator/sized_box.dart';
import 'package:flutter/material.dart';

class FieldList extends StatelessWidget {
  const FieldList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "字段库",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          h16,
          SizedBox(
            width: 260,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                const FieldTag(Icons.text_fields, SingleText.new),
                const FieldTag(Icons.text_fields, MultipleText.new),
                const FieldTag(Icons.link, Website.new),
                const FieldTag(Icons.add, Boolean.new),
                FieldTag(Icons.radio_button_checked,
                    (p) => DefaultItemData("单选", p)),
                FieldTag(Icons.check_box, (p) => DefaultItemData("多选", p)),
                FieldTag(Icons.numbers, (p) => DefaultItemData("数字", p)),
                FieldTag(
                    Icons.monetization_on, (p) => DefaultItemData("货币", p)),
                FieldTag(Icons.percent, (p) => DefaultItemData("百分数", p)),
                FieldTag(Icons.phone, (p) => DefaultItemData("手机", p)),
                FieldTag(Icons.email, (p) => DefaultItemData("邮箱", p)),
                FieldTag(Icons.date_range, (p) => DefaultItemData("日期", p)),
                FieldTag(Icons.date_range, (p) => DefaultItemData("日期时间", p)),
                FieldTag(Icons.date_range, (p) => DefaultItemData("日期区间", p)),
                FieldTag(Icons.home, (p) => DefaultItemData("地址", p)),
                FieldTag(Icons.pin_drop, (p) => DefaultItemData("定位", p)),
                FieldTag(Icons.person, (p) => DefaultItemData("人员", p)),
                FieldTag(Icons.add, (p) => DefaultItemData("部门", p)),
                FieldTag(Icons.add, (p) => DefaultItemData("附件", p)),
                FieldTag(Icons.add, (p) => DefaultItemData("手写签名", p)),
                FieldTag(Icons.description, (p) => DefaultItemData("描述文字", p)),
                FieldTag(Icons.table_chart, (p) => DefaultItemData("明细表格", p)),
                FieldTag(Icons.numbers, (p) => DefaultItemData("自定义编号", p)),
                FieldTag(Icons.tag, (p) => DefaultItemData("自定义标签", p)),
                FieldTag(Icons.local_fire_department,
                    (p) => DefaultItemData("关注度", p)),
                FieldTag(Icons.add, (p) => DefaultItemData("分组标题", p)),
                FieldTag(Icons.text_fields, (p) => DefaultItemData("富文本", p)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
