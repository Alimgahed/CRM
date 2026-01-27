// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
  id: (json['id'] as num?)?.toInt(),
  unitName: json['unit_name'] as String?,
  unitNameEn: json['unit_name_en'] as String?,
  unitNumber: (json['unit_number'] as num?)?.toInt(),
  unitType: (json['unit_type'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  devCompanyId: (json['dev_company_id'] as num?)?.toInt(),
  devCompanyName: json['dev_company_name'] as String?,
  ownerId: (json['owner_id'] as num?)?.toInt(),
  ownerName: json['owner_name'] as String?,
  description: json['description'] as String?,
  sellPurpose: json['sell_purpose'] as String?,
  country: json['country'] as String?,
  governate: json['governate'] as String?,
  city: json['city'] as String?,
  district: json['district'] as String?,
  street: json['street'] as String?,
  buildingNumber: (json['buiding_number'] as num?)?.toInt(),
  buildingArea: (json['building_area'] as num?)?.toInt(),
  totalArea: (json['total_area'] as num?)?.toInt(),
  totalPrice: (json['total_price'] as num?)?.toInt(),
  totalRent: (json['total_rent'] as num?)?.toInt(),
  meterPrice: (json['meter_price'] as num?)?.toInt(),
  bedrooms: (json['bedrooms'] as num?)?.toInt(),
  bathrooms: (json['bathrooms'] as num?)?.toInt(),
  noOfTempeletes: (json['no_of_tempeletes'] as num?)?.toInt(),
  floors: json['floors'] as String?,
  view: json['view'] as String?,
  finshing: json['finshing'] as String?,
  hasElevator: json['has_elevator'] as bool?,
  isStandalone: json['is_standalone'] as bool?,
  status: (json['status'] as num?)?.toInt(),
  mapUrl: json['map_url'] as String?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  unitFloors: (json['unit_floors'] as List<dynamic>?)
      ?.map((e) => UnitFloor.fromJson(e as Map<String, dynamic>))
      .toList(),
  unitFeatures: (json['unit_features'] as List<dynamic>?)
      ?.map((e) => UnitFeature.fromJson(e as Map<String, dynamic>))
      .toList(),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
  'id': instance.id,
  'unit_name': instance.unitName,
  'unit_name_en': instance.unitNameEn,
  'unit_number': instance.unitNumber,
  'unit_type': instance.unitType,
  'company_id': instance.companyId,
  'dev_company_id': instance.devCompanyId,
  'dev_company_name': instance.devCompanyName,
  'owner_id': instance.ownerId,
  'owner_name': instance.ownerName,
  'description': instance.description,
  'sell_purpose': instance.sellPurpose,
  'country': instance.country,
  'governate': instance.governate,
  'city': instance.city,
  'district': instance.district,
  'street': instance.street,
  'buiding_number': instance.buildingNumber,
  'building_area': instance.buildingArea,
  'total_area': instance.totalArea,
  'total_price': instance.totalPrice,
  'total_rent': instance.totalRent,
  'meter_price': instance.meterPrice,
  'bedrooms': instance.bedrooms,
  'bathrooms': instance.bathrooms,
  'no_of_tempeletes': instance.noOfTempeletes,
  'floors': instance.floors,
  'view': instance.view,
  'finshing': instance.finshing,
  'has_elevator': instance.hasElevator,
  'is_standalone': instance.isStandalone,
  'status': instance.status,
  'map_url': instance.mapUrl,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'unit_floors': instance.unitFloors?.map((e) => e.toJson()).toList(),
  'unit_features': instance.unitFeatures?.map((e) => e.toJson()).toList(),
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
};

UnitFeature _$UnitFeatureFromJson(Map<String, dynamic> json) => UnitFeature(
  id: (json['id'] as num?)?.toInt(),
  unitId: (json['unit_id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  feature: json['feature'] as String?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$UnitFeatureToJson(UnitFeature instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unit_id': instance.unitId,
      'company_id': instance.companyId,
      'feature': instance.feature,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
