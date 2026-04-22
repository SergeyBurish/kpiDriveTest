import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kanban_board/kanban_board.dart';

import '../../../core/dm.dart';


class KanbanGroupItem extends KanbanBoardGroupItem {
  final String itemId;
  final String title;

  KanbanGroupItem({
    required this.itemId,
    required this.title,
  });

  @override
  String get id => itemId;
  
}

List<KanbanBoardGroup<String,KanbanGroupItem>> kanbanGroups = List.generate(
  10,
  (index) => KanbanBoardGroup(
    id: "group_$index",
    name: 'group'.tr(args: ['$index']),
    items: List.generate(
      math.Random().nextInt(10),
      (itemIndex) => KanbanGroupItem(
        itemId: "group_item_$itemIndex",
        title: "Item $itemIndex",
      ),
    ),
  ),
);

class KanbanBoardView extends StatelessWidget {
  final int rowsCount;

  final _controller = KanbanBoardController();

  KanbanBoardView({
    super.key,
    required this.rowsCount,
  });

  @override
  Widget build(BuildContext context) {
    return KanbanBoard(
      controller: _controller,
      groups: kanbanGroups,
      groupItemBuilder: groupItemBuilder,
      onGroupItemMove:
          (oldGroupIndex, oldItemIndex, newGroupIndex, newItemIndex) {},
      onGroupMove: (oldGroupIndex, newGroupIndex) {},
    );
  }
}


Widget groupItemBuilder(context, groupId, itemIndex) {
  final groupItem = kanbanGroups
      .firstWhere((element) => element.id == groupId)
      .items[itemIndex];
  return Container(
    padding: const EdgeInsets.all(Dm.s10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dm.s8),
    ),
    child: Text(groupItem.title),
  );
}