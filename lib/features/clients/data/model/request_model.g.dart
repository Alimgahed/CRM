// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
  id: (json['id'] as num).toInt(),
  leadId: (json['lead_id'] as num).toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  country: json['country'] as String?,
  governate: json['governate'] as String?,
  area: json['area'] as num?,
  unitType: json['unit_type'] as String?,
  listingType: json['listing_type'] as String?,
  marketType: json['market_type'] as String?,
  sellingPurpose: json['selling_purpose'] as String?,
  noOfBedrooms: (json['no_of_bedrooms'] as num?)?.toInt(),
  noOfBathrooms: (json['no_of_bathrooms'] as num?)?.toInt(),
  floorNumber: (json['floor_number'] as num?)?.toInt(),
  totalArea: json['total_area'] as num?,
  budget: json['budget'] as num?,
  finishingType: json['finishing_type'] as String?,
  hasParking: json['has_parking'] as bool?,
  paymentType: json['payment_type'] as String?,
  view: json['view'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  isDeleted: json['is_deleted'] as bool?,
);

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lead_id': instance.leadId,
      'company_id': instance.companyId,
      'country': instance.country,
      'governate': instance.governate,
      'area': instance.area,
      'unit_type': instance.unitType,
      'listing_type': instance.listingType,
      'market_type': instance.marketType,
      'selling_purpose': instance.sellingPurpose,
      'no_of_bedrooms': instance.noOfBedrooms,
      'no_of_bathrooms': instance.noOfBathrooms,
      'floor_number': instance.floorNumber,
      'total_area': instance.totalArea,
      'budget': instance.budget,
      'finishing_type': instance.finishingType,
      'has_parking': instance.hasParking,
      'payment_type': instance.paymentType,
      'view': instance.view,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
    };

RequestResponse _$RequestResponseFromJson(Map<String, dynamic> json) =>
    RequestResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$RequestResponseToJson(RequestResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_pages': instance.totalPages,
    };
