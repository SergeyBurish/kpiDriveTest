import 'package:flutter/material.dart';
import 'package:flutter_boardview/board_item.dart';
import 'package:flutter_boardview/board_list.dart';
import 'package:flutter_boardview/boardview.dart';
import 'package:flutter_boardview/boardview_controller.dart';

import '../../../core/dm.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/typedefs.dart';
import '../domain/entity/row_entity.dart';


class KanbanBoardView extends StatelessWidget {
  final MapCards cards;
  final bool isLoading;
  final void Function({int? cardId, int? order}) onOrderChange;
  final void Function({int? cardId, int? listId}) onListChange;

  final BoardViewController _boardViewController = BoardViewController();
  List<BoardList> _lists = [];

  KanbanBoardView({
    super.key,
    required this.cards,
    required this.isLoading,
    required this.onOrderChange,
    required this.onListChange,
  });

  @override
  Widget build(BuildContext context) {
    _lists = _cardsToLists(cards, context);
    return Stack(
      children: [
        BoardView(
          lists: _lists,
          boardViewController: _boardViewController,
        ),
        if (isLoading)
          Container(
            color: Colors.black45,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  List<BoardList> _cardsToLists(MapCards cards, BuildContext context) => 
      cards.entries.map((MapEntry<RowEntity, Set<RowEntity>> mapEntry) => 
          _mapEntryToBoardList(mapEntry, context)
      ).toList();

  BoardList _mapEntryToBoardList(MapEntry<RowEntity, Set<RowEntity>> mapEntry, BuildContext context) => 
    BoardList(
      key: ValueKey<int?>(mapEntry.key.indicatorToMoId), // keep id in key instead of index field
      backgroundColor: context.colorScheme.columnBackground,
      header: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(Dm.s8),
            child: Text(
              mapEntry.key.name,
              style: context.textStyles.headerText,
              maxLines: 3,
            ),
          ),
        ),
      ],
      items: mapEntry.value.map((RowEntity rowEntity) => 
        _rowEntityToBoardItem(rowEntity, context)
      ).toList(),
    );

  BoardItem _rowEntityToBoardItem(RowEntity rowEntity, BuildContext context) => 
    BoardItem(
      index: rowEntity.indicatorToMoId,  // keep id in index field (it works in BoardItem)
      item: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dm.s2, vertical: Dm.s4),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.borderColor),
            borderRadius: BorderRadius.circular(Dm.s8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dm.s8),
            child: Text(
              rowEntity.name,
              style: context.textStyles.bodyText,
              maxLines: 3,
            ),
          ),
        ),
      ),
      onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex, int? oldItemIndex, BoardItemState state) {
        if (listIndex != null && oldListIndex != null && listIndex != oldListIndex) {
          int? listId = (_lists[listIndex].key as ValueKey<int?>).value;
          onListChange(cardId: rowEntity.indicatorToMoId, listId: listId);
        } else if (itemIndex != null && oldItemIndex != null && itemIndex != oldItemIndex) {
          onOrderChange(cardId: rowEntity.indicatorToMoId, order: itemIndex);
        }
      }
    );
}
