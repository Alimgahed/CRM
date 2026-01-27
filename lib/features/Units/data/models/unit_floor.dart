import 'package:json_annotation/json_annotation.dart';

part 'unit_floor.g.dart';

@JsonSerializable(explicitToJson: true)
class UnitFloor {
  @JsonKey(name: 'floor_id')
  final int? floorId;

  @JsonKey(name: 'unit_id')
  final int? unitId;

  final int? floor;

  @JsonKey(name: 'is_active')
  final bool? isActive;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  UnitFloor({
    this.floorId,
    this.unitId,
    this.floor,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory UnitFloor.fromJson(Map<String, dynamic> json) =>
      _$UnitFloorFromJson(json);

  Map<String, dynamic> toJson() => _$UnitFloorToJson(this);
}
