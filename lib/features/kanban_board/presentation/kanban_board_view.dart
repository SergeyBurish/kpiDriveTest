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
  final BoardViewController _boardViewController = BoardViewController();

  KanbanBoardView({
    super.key,
    required this.cards,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BoardView(
          lists: _cardsToLists(cards),
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
      index: mapEntry.key.indicatorToMoId,
      items: mapEntry.value.map((RowEntity rowEntity) => 
        _rowEntityToBoardItem(rowEntity)
      ).toList(),
      onStartDragList: (int? listIndex) {
        print('onStartDragList: $listIndex');
      },
      onDropList: (int? listIndex, int? oldListIndex) {  
        print('onDropList: $listIndex, $oldListIndex');     
      },
    );

  BoardItem _rowEntityToBoardItem(RowEntity rowEntity) => 
    BoardItem(
      index: rowEntity.indicatorToMoId,
      item: Card(
        color: Colors.green, // TODO: theme
        child: Padding(
          padding: const EdgeInsets.all(Dm.s8),
          child: Text(rowEntity.name),
        ),
      ),
      onStartDragItem: (int? listIndex, int? itemIndex, BoardItemState state) {
        print('onStartDragItem: $listIndex, $itemIndex');
      },
      onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex, int? oldItemIndex, BoardItemState state) {
        print('onDropItem: $listIndex, $itemIndex $oldListIndex, $oldItemIndex');
      }
    );
}
