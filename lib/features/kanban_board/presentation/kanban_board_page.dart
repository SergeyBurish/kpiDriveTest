import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import 'bloc/kanban_board_cubit.dart';
import 'kanban_board_view.dart';

class KanbanBoardPage extends StatelessWidget {
  const KanbanBoardPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KanbanBoardCubit, KanbanBoardState>(
      listenWhen: (previous, current) => previous.isSuccess != current.isSuccess,
      listener: (context, state) {
        if (state.isSuccess) {
          _showSnackBar(context, 'successfully_updated'.tr());
        }
      },
      builder: (context, state) =>
        Scaffold(
          appBar: AppBar(
            title: Text(
              'kanban_board'.tr(),
              style: context.textStyles.appBarText,
            ),
            backgroundColor: context.colorScheme.appBarBackground,
          ),
          body: KanbanBoardView(
            cards: state.cards,
            isLoading: state.isLoading,
          ),
        ),
    );
  }
}
