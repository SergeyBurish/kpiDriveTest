import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/typedefs.dart';
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
    emit(state.copyWith.status(InProgress()));

    final output = await kanbanBoardUsecase.getCards();
    output.fold(
      ifLeft: (_) => emit(state.copyWith.status(Error(description: 'error_failed_load'.tr()))),
      ifRight: (cards) {
        emit(state.copyWith(
          status: Success(),
          cards: cards,
        ));
      }
    );
  }

  void onParentChange ({int? cardId, int? parentId}) async {
    if (cardId == null || parentId == null) {
      return;
    }

    emit(state.copyWith.status(InProgress()));

    if (cardId == parentId) {
      emit(state.copyWith.status(Error(description: 'error_move_into_itself'.tr())));
      return;
    }

    final output = await kanbanBoardUsecase.onParentChange(cardId: cardId, parentId: parentId);
    output.fold(
      ifLeft: (e) => emit(state.copyWith.status(Error(description: 'error_failed_move'.tr()))),
      ifRight: (cards) {
        emit(state.copyWith(
          status: Success(),
          cards: cards,
        ));
      }
    );
  }

  void onOrderChange ({int? cardId, int? order}) async {
    if (cardId == null || order == null) {
      return;
    }

    emit(state.copyWith.status(InProgress()));

    final output = await kanbanBoardUsecase.onOrderChange(cardId: cardId, order: order);
    output.fold(
      ifLeft: (e) => emit(state.copyWith.status(Error(description: 'error_failed_move'.tr()))),
      ifRight: (cards) {
        emit(state.copyWith(
          status: Success(),
          cards: cards,
        ));
      }
    );
  }
}
