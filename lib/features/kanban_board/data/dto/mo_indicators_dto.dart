import 'package:json_annotation/json_annotation.dart';

import 'data_dto.dart';

part 'mo_indicators_dto.g.dart';

@JsonSerializable()
class MoIndicatorsDto {
  @JsonKey(name: 'DATA')
  final DataDto data;

  MoIndicatorsDto({
    required this.data,
  });

  factory MoIndicatorsDto.fromJson(Map<String, dynamic> json) => _$MoIndicatorsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MoIndicatorsDtoToJson(this);
}
