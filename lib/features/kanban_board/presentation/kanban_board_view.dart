import 'package:flutter/material.dart';
import 'package:flutter_boardview/board_item.dart';
import 'package:flutter_boardview/board_list.dart';
import 'package:flutter_boardview/boardview.dart';
import 'package:flutter_boardview/boardview_controller.dart';

import '../../../core/dm.dart';
import '../../../core/typedefs.dart';
import '../domain/entity/row_entity.dart';


class KanbanBoardView extends StatelessWidget {
  final MapCards cards;
  final bool isLoading;
  final void Function({int? cardId, int? order}) onOrderChange;
  final void Function({int? cardId, int? listId}) onListChange;

  final BoardViewController _boardViewController = BoardViewController();
  late final List<BoardList> _lists = _cardsToLists(cards);

  KanbanBoardView({
    super.key,
    required this.cards,
    required this.isLoading,
    required this.onOrderChange,
    required this.onListChange,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BoardView(
          lists: _lists,
          boardViewController: _boardViewController,
          dragDelay: 50,
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

  List<BoardList> _cardsToLists(MapCards cards) => 
      cards.entries.map((MapEntry<RowEntity, Set<RowEntity>> mapEntry) => 
          _mapEntryToBoardList(mapEntry)
      ).toList();

  BoardList _mapEntryToBoardList(MapEntry<RowEntity, Set<RowEntity>> mapEntry) => 
    BoardList(
      key: ValueKey<int?>(mapEntry.key.indicatorToMoId), // keep id in key instead of index field
      backgroundColor: Colors.blueGrey, // TODO: theme
      header: [
        Expanded(
          child: Text(
            mapEntry.key.name,
            maxLines: 3,
          ),
        ),
        Text('${mapEntry.key.order}')
      ],
      items: mapEntry.value.map((RowEntity rowEntity) => 
        _rowEntityToBoardItem(rowEntity)
      ).toList(),
    );

  BoardItem _rowEntityToBoardItem(RowEntity rowEntity) => 
    BoardItem(
      index: rowEntity.indicatorToMoId,  // keep id in index field (it works in BoardItem)
      item: Card(
        color: Colors.green, // TODO: theme
        child: Padding(
          padding: const EdgeInsets.all(Dm.s8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  rowEntity.name,
                  maxLines: 3,
                ),
              ),
              Text('${rowEntity.order}')
            ],
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
