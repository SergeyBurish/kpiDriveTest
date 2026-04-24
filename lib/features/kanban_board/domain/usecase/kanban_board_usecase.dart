import 'package:dart_either/dart_either.dart';

import '../../../../core/typedefs.dart';
import '../entity/data_entity.dart';
import '../entity/row_entity.dart';
import '../repository/kanban_board_repository.dart';

abstract interface class KanbanBoardUsecase{
  Future<Either<Exception, MapCards>> getCards();
  Future<Either<Exception, MapCards>> onParentChange({
    required int cardId,
    required int parentId,
  });
  Future<Either<Exception, MapCards>> onOrderChange({
    required int cardId,
    required int order,
  });
}

class KanbanBoardUsecaseImp implements KanbanBoardUsecase{
  final KanbanBoardRepository repository;

  KanbanBoardUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, MapCards>> getCards() async {
    final output = await repository.getMoIndicators();

    Exception? exception;
    MapCards cards = {};

    output.fold(
      ifLeft: (e) => {exception = e},
      ifRight: (DataEntity dataEntity) {
        cards = _rowsToMapcards(dataEntity.rows);
      }
    );
    
    if (exception != null) {
      return Left(exception!);
    }

    return Right(cards);
  }

  @override
  Future<Either<Exception, MapCards>> onParentChange({
    required int cardId,
    required int parentId,
  }) async {
    final output = await repository.onParentChange(cardId: cardId, parentId: parentId);

    if (output.isLeft) {
      return Left(Exception('fail to move card'));
    }

    return getCards();
  }

  @override
  Future<Either<Exception, MapCards>> onOrderChange({
    required int cardId,
    required int order,
  }) async {
    final output = await repository.onOrderChange(cardId: cardId, order: order + 1);

    if (output.isLeft) {
      return Left(Exception('fail to move card'));
    }

    return getCards();
  }

  MapCards _rowsToMapcards(List<RowEntity> rows) {
    MapCards cards = {};
    for (RowEntity row in rows) {
      if (row.hasNoParent && !cards.keys.contains(row)) {
        cards[row] = <RowEntity>{};
        continue;
      }

      RowEntity parent = cards.keys.firstWhere(
          (el) => el.indicatorToMoId == row.parentId, 
          orElse: () => const RowEntity(name: '') // empty RowEntity as 'not found' result
      );
      if (parent.isNotEmpty) {
        cards[parent]!.add(row);
      } else {
        parent = RowEntity(
          name: row.parentName!,
          indicatorToMoId: row.parentId,
        );
        cards[parent] = {row};
      }
    }
    return cards;
  }
}
