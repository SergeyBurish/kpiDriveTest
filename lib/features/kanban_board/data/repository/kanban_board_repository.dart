import 'package:dart_either/dart_either.dart';

import '../../domain/entity/data_entity.dart';
import '../../domain/repository/kanban_board_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../dto/data_dto.dart';
import '../dto/mo_indicators_dto.dart';

class KanbanBoardRepositoryImp implements KanbanBoardRepository{
  final KanbanBoardDataSource remoteDataSource;

  KanbanBoardRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Exception, DataEntity>> getMoIndicators() async {
    try {
      MoIndicatorsDto? response = await remoteDataSource.getMoIndicators();
      if (response == null) {
        return Left(Exception(''));
      }
      return Right(response.data.toDataEntity);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}