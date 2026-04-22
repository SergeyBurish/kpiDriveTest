import 'package:dart_either/dart_either.dart';

import '../entity/data_entity.dart';
import '../repository/kanban_board_repository.dart';

abstract interface class KanbanBoardUsecase{
    Future<Either<Exception, DataEntity>> getMoIndicators();
}

class KanbanBoardUsecaseImp implements KanbanBoardUsecase{
  final KanbanBoardRepository repository;

  KanbanBoardUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, DataEntity>> getMoIndicators() => 
      repository.getMoIndicators();
}
