part of 'kanban_board_cubit.dart';

enum KanbanBoardStatus {
  idle,
  inProgress,
  success,
  error,
}

@CopyWith(constructor: '_')
class KanbanBoardState {
  final KanbanBoardStatus status;
  final DataEntity? dataEntity;

  KanbanBoardState._({
    required this.status,
    required this.dataEntity,
  });

  KanbanBoardState.initial() :
    status = KanbanBoardStatus.idle,
    dataEntity = null;

  bool get success => status == KanbanBoardStatus.success;
}
