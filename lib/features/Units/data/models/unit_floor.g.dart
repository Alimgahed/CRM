// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitFloor _$UnitFloorFromJson(Map<String, dynamic> json) => UnitFloor(
  floorId: (json['floor_id'] as num?)?.toInt(),
  unitId: (json['unit_id'] as num?)?.toInt(),
  floor: (json['floor'] as num?)?.toInt(),
  isActive: json['is_active'] as bool?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UnitFloorToJson(UnitFloor instance) => <String, dynamic>{
  'floor_id': instance.floorId,
  'unit_id': instance.unitId,
  'floor': instance.floor,
  'is_active': instance.isActive,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
