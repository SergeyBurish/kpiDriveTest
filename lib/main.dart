import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'di/injector.dart';
import 'di/locator.dart';
import 'features/kanban_board/presentation/bloc/kanban_board_cubit.dart';
import 'features/kanban_board/presentation/kanban_board_page.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'l10n',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KanbanBoardCubit(kanbanBoardUsecase: Locator.kanbanBoardUsecase),
      child: MaterialApp(
        title: 'KpiDriveTest',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.createLightTheme(),
        home: const KanbanBoardPage(),
      ),
    );
  }
}
