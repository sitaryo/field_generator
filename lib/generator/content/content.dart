import 'package:field_generator/generator/content/item_row.dart';
import 'package:field_generator/generator/content/item_dragging.dart';
import 'package:field_generator/generator/content/item_preview.dart';
import 'package:field_generator/generator/content/move_layer.dart';
import 'package:field_generator/generator/model/field_data.dart';
import 'package:field_generator/generator/model/selected_indx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../model/field_data_group.dart';

class Content extends HookWidget {
  final ValueNotifier<List<FieldDataGroup>> item;
  final ValueNotifier<UniqueKey?> selectedIndexes;

  const Content({
    Key? key,
    required this.item,
    required this.selectedIndexes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offSet = useRef<Offset?>(null);
    final controller = useRef(ScrollController());

    onMove(DragTargetDetails<FieldDataGroup> detail) {
      final contentDy = offSet.value?.dy;
      final listDy = controller.value.offset;
      if (contentDy != null) {
        final dy = detail.offset.dy - contentDy + listDy;
        final index = (dy / 100).round();
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

    selectedIndexesChanged(key) => selectedIndexes.value = key;

    resetIndexesChanged() => selectedIndexes.value = null;

    listItem(int i, FieldDataGroup data) => LongPressDraggable<FieldDataGroup>(
          onDragStarted: resetIndexesChanged,
          data: FieldDataGroup.listItem(data.data, index: i),
          feedback: ItemDragging(group: data),
          child: data.dragging
              ? ItemPreview(group: data)
              : ItemRow(
                  group: data,
                  row: i,
                  selectIndexes: selectedIndexes.value,
                  onTap: selectedIndexesChanged,
                ),
        );

    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      width: 800,
      height: double.infinity,
      child: Column(
        children: [
          const ContentHeader(),
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
                    controller: controller.value,
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

class ContentHeader extends HookWidget {
  const ContentHeader({Key? key}) : super(key: key);

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
              ElevatedButton(onPressed: () {}, child: const Text("保存")),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("返回")),
            ],
          ),
        ],
      ),
    );
  }
}
