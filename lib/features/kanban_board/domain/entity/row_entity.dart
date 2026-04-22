class RowEntity {
  final String name;
  final int? order;
  final int? indicatorToMoId;
  final int? parentId;

  RowEntity({
    required this.name,
    this.order,
    this.indicatorToMoId,
    this.parentId,
  });
}