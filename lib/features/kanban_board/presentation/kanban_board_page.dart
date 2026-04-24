import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dm.dart';
import '../../../core/theme/app_theme.dart';
import 'bloc/kanban_board_cubit.dart';
import 'kanban_board_view.dart';

class KanbanBoardPage extends StatelessWidget {
  const KanbanBoardPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showErrorDialog(BuildContext context, String message) {
    final textStyles = context.textStyles;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'error'.tr(),
          style: textStyles.appBarText,
        ),
        backgroundColor: context.colorScheme.dialogBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dm.s12),
          side: BorderSide(color: context.colorScheme.borderColor),
        ),
        content: Text(
          message,
          style: textStyles.bodyText,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: context.buttonStyles.dialogButton,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KanbanBoardCubit>();
    return BlocConsumer<KanbanBoardCubit, KanbanBoardState>(
      listenWhen: (previous, current) => 
          previous.status.runtimeType != current.status.runtimeType,
      listener: (context, state) {
        if (state.isSuccess) {
          _showSnackBar(context, 'successfully_updated'.tr());
        }
        if (state.isError && state.statusDescriptionIsNotEmpty) {
          _showErrorDialog(context, state.status.description ?? '');
        }
      },
      builder: (context, state) =>
        Scaffold(
          appBar: AppBar(
            title: Text(
              'kanban_board'.tr(),
              style: context.textStyles.appBarText,
            ),
            backgroundColor: context.colorScheme.appBackground,
          ),
          body: KanbanBoardView(
            cards: state.cards,
            isLoading: state.isLoading,
            onListChange: ({cardId, listId}) => cubit.onParentChange(cardId: cardId, parentId: listId),
            onOrderChange: ({cardId, order}) => cubit.onOrderChange(cardId: cardId, order: order),
          ),
          backgroundColor: context.colorScheme.appBackground,
        ),
    );
  }
}
