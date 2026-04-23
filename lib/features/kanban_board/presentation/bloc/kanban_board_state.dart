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
  final MapCards cards;

  KanbanBoardState._({
    required this.status,
    required this.cards,
  });

  KanbanBoardState.initial() :
    status = KanbanBoardStatus.idle,
    cards = {};

  bool get isSuccess => status == KanbanBoardStatus.success;
  bool get isLoading => status == KanbanBoardStatus.inProgress;
}
