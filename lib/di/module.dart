import 'package:injectable/injectable.dart';

import '../features/kanban_board/data/data_sources/remote_data_source.dart';
import '../features/kanban_board/data/repository/kanban_board_repository.dart';
import '../features/kanban_board/domain/repository/kanban_board_repository.dart';
import '../features/kanban_board/domain/usecase/kanban_board_usecase.dart';

@module
abstract class Module {
  @lazySingleton
  KanbanBoardDataSource kanbanBoardDataSource() => KanbanBoardDataSourceImp();

  @lazySingleton
  KanbanBoardRepository kanbanBoardRepository(KanbanBoardDataSource remoteDataSource) =>
      KanbanBoardRepositoryImp(remoteDataSource: remoteDataSource);

  @lazySingleton
  KanbanBoardUsecase kanbanBoardUsecase(KanbanBoardRepository repository) =>
      KanbanBoardUsecaseImp(repository: repository);
}