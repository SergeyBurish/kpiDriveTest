import 'package:equatable/equatable.dart';

class RowEntity extends Equatable{
  final String name;
  final int? order;
  final int? indicatorToMoId;
  final int? parentId;
  final String? parentName;

  const RowEntity({
    required this.name,
    this.order,
    this.indicatorToMoId,
    this.parentId,
    this.parentName,
  });
  
  @override
  List<Object?> get props => [name, indicatorToMoId];

  bool get hasNoParent => parentId == null || (parentName?.isEmpty ?? true);
  bool get isNotEmpty => indicatorToMoId != null && name.isNotEmpty;
}