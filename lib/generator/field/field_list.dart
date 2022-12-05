import 'package:field_generator/generator/field/field_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FieldList extends HookWidget {
  const FieldList({Key? key}) : super(key: key);

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
          const SizedBox(height: 16,),
          SizedBox(
            width: 260,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                FieldTag(icon: Icons.text_fields, text: "单行文本"),
                FieldTag(icon: Icons.text_fields, text: "多行文本"),
                FieldTag(icon: Icons.link, text: "网址"),
                FieldTag(icon: Icons.add, text: "布尔值"),
                FieldTag(icon: Icons.radio_button_checked, text: "单选"),
                FieldTag(icon: Icons.check_box, text: "多选"),
                FieldTag(icon: Icons.numbers, text: "数字"),
                FieldTag(icon: Icons.monetization_on, text: "货币"),
                FieldTag(icon: Icons.percent, text: "百分数"),
                FieldTag(icon: Icons.phone, text: "手机"),
                FieldTag(icon: Icons.email, text: "邮箱"),
                FieldTag(icon: Icons.date_range, text: "日期"),
                FieldTag(icon: Icons.date_range, text: "日期时间"),
                FieldTag(icon: Icons.date_range, text: "日期区间"),
                FieldTag(icon: Icons.home, text: "地址"),
                FieldTag(icon: Icons.pin_drop, text: "定位"),
                FieldTag(icon: Icons.person, text: "人员"),
                FieldTag(icon: Icons.add, text: "部门"),
                FieldTag(icon: Icons.add, text: "附件"),
                FieldTag(icon: Icons.add, text: "手写签名"),
                FieldTag(icon: Icons.description, text: "描述文字"),
                FieldTag(icon: Icons.table_chart, text: "明细表格"),
                FieldTag(icon: Icons.numbers, text: "自定义编号"),
                FieldTag(icon: Icons.tag, text: "自定义标签"),
                FieldTag(icon: Icons.local_fire_department, text: "关注度"),
                FieldTag(icon: Icons.add, text: "分组标题"),
                FieldTag(icon: Icons.text_fields, text: "富文本"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
