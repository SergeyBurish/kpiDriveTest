part of 'kanban_board_cubit.dart';

sealed class KanbanBoardStatus {
  final String? description;
  KanbanBoardStatus({this.description});
}
class Idle extends KanbanBoardStatus {}
class InProgress extends KanbanBoardStatus {}
class Success extends KanbanBoardStatus {}
class Error extends KanbanBoardStatus {
  Error({super.description});
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
    status = Idle(),
    cards = {};

  bool get isSuccess => status is Success;
  bool get isLoading => status is InProgress;
  bool get isError => status is Error;
  bool get statusDescriptionIsNotEmpty => status.description?.isNotEmpty ?? false;
}
