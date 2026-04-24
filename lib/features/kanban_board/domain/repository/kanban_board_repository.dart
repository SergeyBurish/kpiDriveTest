import 'package:dart_either/dart_either.dart';

import '../entity/data_entity.dart';

abstract interface class KanbanBoardRepository{
  Future<Either<Exception, DataEntity>> getMoIndicators();
  Future<Either<Exception, void>> onParentChange({
    required int cardId,
    required int parentId,
  });
  Future<Either<Exception, void>> onOrderChange({
    required int cardId,
    required int order,
  });
}
