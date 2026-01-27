import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'unit_floor.dart';

part 'unit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Unit {
  final int? id;

  @JsonKey(name: 'unit_name')
  final String? unitName;

  @JsonKey(name: 'unit_name_en')
  final String? unitNameEn;

  @JsonKey(name: 'unit_number')
  final int? unitNumber;

  @JsonKey(name: 'unit_type')
  final int? unitType;

  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'dev_company_id')
  final int? devCompanyId;

  @JsonKey(name: 'dev_company_name')
  final String? devCompanyName;

  @JsonKey(name: 'owner_id')
  final int? ownerId;

  @JsonKey(name: 'owner_name')
  final String? ownerName;

  final String? description;

  @JsonKey(name: 'sell_purpose')
  final String? sellPurpose;

  final String? country;
  final String? governate;
  final String? city;
  final String? district;
  final String? street;

  @JsonKey(name: 'buiding_number')
  final int? buildingNumber;

  @JsonKey(name: 'building_area')
  final int? buildingArea;

  @JsonKey(name: 'total_area')
  final int? totalArea;

  @JsonKey(name: 'total_price')
  final int? totalPrice;

  @JsonKey(name: 'total_rent')
  final int? totalRent;

  @JsonKey(name: 'meter_price')
  final int? meterPrice;

  final int? bedrooms;
  final int? bathrooms;

  @JsonKey(name: 'no_of_tempeletes')
  final int? noOfTempeletes;

  /// API sends this as STRING
  final String? floors;

  final String? view;
  final String? finshing;

  @JsonKey(name: 'has_elevator')
  final bool? hasElevator;

  @JsonKey(name: 'is_standalone')
  final bool? isStandalone;

  final int? status;

  @JsonKey(name: 'map_url')
  final String? mapUrl;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  /// Relations (nullable if not sent)
  @JsonKey(name: 'unit_floors')
  final List<UnitFloor>? unitFloors;

  @JsonKey(name: 'unit_features')
  final List<UnitFeature>? unitFeatures;

  @JsonKey(name: 'attachments')
  final List<Attachment>? attachments;

  const Unit({
    this.id,
    this.unitName,
    this.unitNameEn,
    this.unitNumber,
    this.unitType,
    this.companyId,
    this.devCompanyId,
    this.devCompanyName,
    this.ownerId,
    this.ownerName,
    this.description,
    this.sellPurpose,
    this.country,
    this.governate,
    this.city,
    this.district,
    this.street,
    this.buildingNumber,
    this.buildingArea,
    this.totalArea,
    this.totalPrice,
    this.totalRent,
    this.meterPrice,
    this.bedrooms,
    this.bathrooms,
    this.noOfTempeletes,
    this.floors,
    this.view,
    this.finshing,
    this.hasElevator,
    this.isStandalone,
    this.status,
    this.mapUrl,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.unitFloors,
    this.unitFeatures,
    this.attachments,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}

@JsonSerializable()
class UnitFeature {
  final int? id;

  @JsonKey(name: 'unit_id')
  final int? unitId;

  @JsonKey(name: 'company_id')
  final int? companyId;

  final String? feature;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const UnitFeature({
    this.id,
    this.unitId,
    this.companyId,
    this.feature,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory UnitFeature.fromJson(Map<String, dynamic> json) =>
      _$UnitFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$UnitFeatureToJson(this);
}
