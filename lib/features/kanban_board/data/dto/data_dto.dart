import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/data_entity.dart';
import 'row_dto.dart';

part 'data_dto.g.dart'; 

@JsonSerializable()
class DataDto {
  final int page;

  @JsonKey(name: 'rows_count')
  final int rowsCount;

  final List<RowDto> rows;

  DataDto({
    required this.page,
    required this.rowsCount,
    required this.rows,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) => _$DataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DataDtoToJson(this);
}

extension DataDtoMapper on DataDto {
  DataEntity get toDataEntity {
    return DataEntity(
      page: page,
      rowsCount: rowsCount, 
      rows: rows,
    );
  }
}