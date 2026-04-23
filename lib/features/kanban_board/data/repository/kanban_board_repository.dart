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
  
  @override
  Future<Either<Exception, void>> onParentChange({required int cardId, required int parentId}) async {
    try {
      await remoteDataSource.onParentChange(cardId: cardId, parentId: parentId);
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, void>> onOrderChange({required int cardId, required int order}) async {
    try {
      await remoteDataSource.onOrderChange(cardId: cardId, order: order);
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}