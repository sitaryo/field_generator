import 'dart:convert';

import 'package:field_generator/generator/content/item_dragging.dart';
import 'package:field_generator/generator/content/item_preview.dart';
import 'package:field_generator/generator/content/item_row.dart';
import 'package:field_generator/generator/content/layout_properties.dart';
import 'package:field_generator/generator/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../model/field_data_group.dart';

class Content extends HookWidget {
  final ValueNotifier<List<FieldDataGroup>> item;
  final ValueNotifier<UniqueKey?> selectedItem;

  const Content({
    Key? key,
    required this.item,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offSet = useRef<Offset?>(null);
    final controller = useScrollController();

    onMove(DragTargetDetails<FieldDataGroup> detail) {
      final contentDy = offSet.value?.dy;
      final listDy = controller.offset;
      if (contentDy != null) {
        final dy = detail.offset.dy - contentDy + listDy;
        final index = (dy / itemTotalHeight).round();
        final newList = item.value
            .where((element) => detail.data.isTemplate
                // 如果是字段库中移入则排除 element.dragging 为 true 元素
                ? !element.dragging
                // 如果是列表中移动位置则排除 element.dragging 为 true 或将要移动的元素
                : !element.dragging && element.index != detail.data.index)
            .toList();

        if (newList.length <= index) {
          // 插到末尾
          newList.add(FieldDataGroup.draggingItem(detail.data.data));
        } else {
          // 插到 index 位置
          newList.insert(index, FieldDataGroup.draggingItem(detail.data.data));
        }
        item.value = newList;
      }
    }

    onLeave(_) {
      item.value = item.value.where((element) => !element.dragging).toList();
    }

    onAccept(_) {
      item.value = item.value
          .asMap()
          .map((i, element) =>
              MapEntry(i, FieldDataGroup.listItem(element.data, index: i)))
          .values
          .toList();
    }

    selectedItemChanged(key) => selectedItem.value = key;

    resetItem() => selectedItem.value = null;

    listItem(int i, FieldDataGroup data) => LongPressDraggable<FieldDataGroup>(
          onDragStarted: resetItem,
          data: FieldDataGroup.listItem(data.data, index: i),
          feedback: ItemDragging(group: data),
          child: data.dragging
              ? ItemPreview(group: data)
              : ItemRow(
                  item: item,
                  group: data,
                  row: i,
                  selectIndexes: selectedItem,
                  onTap: selectedItemChanged,
                ),
        );

    save() {
      final data = jsonEncode(item.value.map((e) => e.toJson()).toList());
      showDialog(
          context: context,
          builder: (c) {
            return SizedBox(
              width: 800,
              child: SimpleDialog(
                contentPadding: const EdgeInsets.all(16),
                title: const Text("页面数据如下："),
                children: [
                  SizedBox(
                    width: 800,
                    child: Column(
                      children: [
                        SelectableText(data),
                        h8,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("关闭"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    }

    read() {
      showDialog(
          context: context,
          builder: (c) {
            String data = '';
            return SimpleDialog(
              contentPadding: const EdgeInsets.all(16),
              title: const Text("请粘贴表单数据："),
              children: [
                SizedBox(
                  width: 800,
                  child: Column(
                    children: [
                      TextField(onChanged: (String s) => data = s),
                      h8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (data.isNotEmpty) {
                                item.value = List.from(jsonDecode(data))
                                    .map((e) => FieldDataGroup.fromJson(e))
                                    .toList();
                                selectedItem.value = null;
                              }
                              Navigator.of(context).pop();
                            },
                            child: const Text("导入"),
                          ),
                          w8,
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("取消"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
    }

    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      width: 800,
      height: double.infinity,
      child: Column(
        children: [
          ContentHeader(
            save: save,
            read: read,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DragTarget<FieldDataGroup>(
                builder: (
                  BuildContext context,
                  List<Object?> candidateData,
                  List<dynamic> rejectedData,
                ) {
                  offSet.value = (context.findRenderObject() as RenderBox?)
                      ?.localToGlobal(Offset.zero);
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    controller: controller,
                    itemCount: item.value.length,
                    itemBuilder: (_, i) => listItem(i, item.value[i]),
                  );
                },
                // todo 添加节流函数优化调用
                onMove: onMove,
                onLeave: onLeave,
                onAccept: onAccept,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContentHeader extends StatelessWidget {
  final VoidCallback save;
  final VoidCallback read;

  const ContentHeader({Key? key, required this.save, required this.read})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "编辑供应商字段",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: save, child: const Text("保存")),
              w8,
              ElevatedButton(onPressed: read, child: const Text("读取")),
            ],
          ),
        ],
      ),
    );
  }
}
