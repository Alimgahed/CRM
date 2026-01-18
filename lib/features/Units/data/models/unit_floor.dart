import 'package:json_annotation/json_annotation.dart';

part 'unit_floor.g.dart';

@JsonSerializable(explicitToJson: true)
class UnitFloor {
  @JsonKey(name: 'floor_id')
  final String floorId;

  @JsonKey(name: 'unit_id')
  final String unitId;

  final int floor;

  @JsonKey(name: 'is_active')
  final bool isActive;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  UnitFloor({
    required this.floorId,
    required this.unitId,
    required this.floor,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UnitFloor.fromJson(Map<String, dynamic> json) =>
      _$UnitFloorFromJson(json);

  Map<String, dynamic> toJson() => _$UnitFloorToJson(this);
}
