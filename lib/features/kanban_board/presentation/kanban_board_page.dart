import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../domain/entity/data_entity.dart';
import 'bloc/kanban_board_cubit.dart';
import 'kanban_board_view.dart';

class KanbanBoardPage extends StatelessWidget {
  const KanbanBoardPage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final DataEntity? dataEntity = context.watch<KanbanBoardCubit>().state.dataEntity;
    return BlocListener<KanbanBoardCubit, KanbanBoardState>(
      listenWhen: (previous, current) => previous.success != current.success,
      listener: (context, state) {
        if (state.success) {
          _showSnackBar(context, 'successfully_updated'.tr());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'kanban_board'.tr(),
            style: context.textStyles.appBarText,
          ),
          backgroundColor: context.colorScheme.appBarBackground,
        ),
        body: KanbanBoardView(
          rowsCount: dataEntity?.rowsCount ?? 0,
        ),
      ),
    );
  }
}
