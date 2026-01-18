// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
  unitId: json['unit_id'] as String?,
  unitName: json['unit_name'] as String?,
  unitType: (json['unit_type'] as num?)?.toInt(),
  hasElevator: json['has_elevator'] as bool?,
  totalArea: (json['total_area'] as num?)?.toInt(),
  totalPrice: (json['total_price'] as num?)?.toInt(),
  meterPrice: (json['meter_price'] as num?)?.toInt(),
  buildingArea: (json['building_area'] as num?)?.toInt(),
  description: json['description'] as String?,
  sellPurpose: json['sell_purpose'] as String?,
  countery: json['countery'] as String?,
  governate: json['governate'] as String?,
  city: json['city'] as String?,
  district: json['district'] as String?,
  street: json['street'] as String?,
  mapUrl: json['map_url'] as String?,
  bedrooms: (json['bedrooms'] as num?)?.toInt(),
  bathrooms: (json['bathrooms'] as num?)?.toInt(),
  noOfTempeletes: (json['no_of_tempeletes'] as num?)?.toInt(),
  floors: (json['floors'] as num?)?.toInt(),
  view: json['view'] as String?,
  finshing: json['finshing'] as String?,
  status: (json['status'] as num?)?.toInt(),
  isStandalone: json['is_standalone'] as bool?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  companyId: json['company_id'] as String?,
  ownerId: json['owner_id'] as String?,
  unitFloors: (json['unit_floors'] as List<dynamic>?)
      ?.map((e) => UnitFloor.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
  'unit_id': instance.unitId,
  'unit_name': instance.unitName,
  'unit_type': instance.unitType,
  'has_elevator': instance.hasElevator,
  'total_area': instance.totalArea,
  'total_price': instance.totalPrice,
  'meter_price': instance.meterPrice,
  'building_area': instance.buildingArea,
  'description': instance.description,
  'sell_purpose': instance.sellPurpose,
  'countery': instance.countery,
  'governate': instance.governate,
  'city': instance.city,
  'district': instance.district,
  'street': instance.street,
  'map_url': instance.mapUrl,
  'bedrooms': instance.bedrooms,
  'bathrooms': instance.bathrooms,
  'no_of_tempeletes': instance.noOfTempeletes,
  'floors': instance.floors,
  'view': instance.view,
  'finshing': instance.finshing,
  'status': instance.status,
  'is_standalone': instance.isStandalone,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'company_id': instance.companyId,
  'owner_id': instance.ownerId,
  'unit_floors': instance.unitFloors?.map((e) => e.toJson()).toList(),
};
