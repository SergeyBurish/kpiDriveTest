import '../features/kanban_board/domain/usecase/kanban_board_usecase.dart';
import 'injector.dart';

class Locator {
  static KanbanBoardUsecase get kanbanBoardUsecase => getIt<KanbanBoardUsecase>();
}