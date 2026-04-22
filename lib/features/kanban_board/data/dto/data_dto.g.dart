// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
  page: (json['page'] as num).toInt(),
  rowsCount: (json['rows_count'] as num).toInt(),
  rows: (json['rows'] as List<dynamic>)
      .map((e) => RowDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
  'page': instance.page,
  'rows_count': instance.rowsCount,
  'rows': instance.rows,
};
