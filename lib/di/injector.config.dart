// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/kanban_board/data/data_sources/remote_data_source.dart'
    as _i683;
import '../features/kanban_board/domain/repository/kanban_board_repository.dart'
    as _i758;
import '../features/kanban_board/domain/usecase/kanban_board_usecase.dart'
    as _i110;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final module = _$Module();
    gh.lazySingleton<_i683.KanbanBoardDataSource>(
      () => module.kanbanBoardDataSource(),
    );
    gh.lazySingleton<_i758.KanbanBoardRepository>(
      () => module.kanbanBoardRepository(gh<_i683.KanbanBoardDataSource>()),
    );
    gh.lazySingleton<_i110.KanbanBoardUsecase>(
      () => module.kanbanBoardUsecase(gh<_i758.KanbanBoardRepository>()),
    );
    return this;
  }
}

class _$Module extends _i946.Module {}
