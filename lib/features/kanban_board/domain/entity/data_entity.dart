import 'row_entity.dart';

class DataEntity {
  final int page;
  final int rowsCount;

  final List<RowEntity> rows;

  DataEntity({
    required this.page,
    required this.rowsCount,
    required this.rows,
  });
}