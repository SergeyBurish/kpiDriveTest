// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowDto _$RowDtoFromJson(Map<String, dynamic> json) => RowDto(
  name: json['name'] as String,
  order: (json['order'] as num?)?.toInt(),
  indicatorToMoId: (json['indicator_to_mo_id'] as num?)?.toInt(),
  parentId: (json['parent_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$RowDtoToJson(RowDto instance) => <String, dynamic>{
  'name': instance.name,
  'order': instance.order,
  'indicator_to_mo_id': instance.indicatorToMoId,
  'parent_id': instance.parentId,
};
