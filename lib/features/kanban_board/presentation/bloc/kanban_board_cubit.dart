import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/data_entity.dart';
import '../../domain/usecase/kanban_board_usecase.dart';

part 'kanban_board_cubit.g.dart';
part 'kanban_board_state.dart';

class KanbanBoardCubit extends Cubit<KanbanBoardState> {
  final KanbanBoardUsecase kanbanBoardUsecase;
  KanbanBoardCubit({required this.kanbanBoardUsecase})
      : super(KanbanBoardState.initial()) {
    _onLoad();
  }

  void _onLoad () async {
    emit(state.copyWith.status(KanbanBoardStatus.inProgress));

    final output = await kanbanBoardUsecase.getMoIndicators();
    output.fold(
      ifLeft: (_) => emit(state.copyWith.status(KanbanBoardStatus.error)),
      ifRight: (DataEntity dataEntity) {
        emit(state.copyWith(
          status: KanbanBoardStatus.success,
          dataEntity: dataEntity,
        ));
      }
    );
  }
}
