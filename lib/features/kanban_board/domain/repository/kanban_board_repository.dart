import 'package:dart_either/dart_either.dart';

import '../entity/data_entity.dart';

abstract interface class KanbanBoardRepository{
    Future<Either<Exception, DataEntity>> getMoIndicators();
}
