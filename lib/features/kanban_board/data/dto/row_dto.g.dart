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
  parentName: json['parent_name'] as String?,
);

Map<String, dynamic> _$RowDtoToJson(RowDto instance) => <String, dynamic>{
  'name': instance.name,
  'order': instance.order,
  'indicator_to_mo_id': instance.indicatorToMoId,
  'parent_id': instance.parentId,
  'parent_name': instance.parentName,
};
