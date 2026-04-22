import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/row_entity.dart';

part 'row_dto.g.dart'; 

@JsonSerializable()
class RowDto extends RowEntity {
  @override
  String get name;

  @override
  int? get order;

  @override
  @JsonKey(name: 'indicator_to_mo_id')
  int? get indicatorToMoId;

  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;


  RowDto({
    required super.name, 
    super.order, 
    super.indicatorToMoId, 
    super.parentId
  });

  factory RowDto.fromJson(Map<String, dynamic> json) => _$RowDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RowDtoToJson(this);
}