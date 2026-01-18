import 'package:crm/features/Units/data/models/unit_floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Unit {
  @JsonKey(name: 'unit_id')
  final String? unitId;

  @JsonKey(name: 'unit_name')
  final String? unitName;

  @JsonKey(name: 'unit_type')
  final int? unitType;

  @JsonKey(name: 'has_elevator')
  final bool? hasElevator;

  @JsonKey(name: 'total_area')
  final int? totalArea;

  @JsonKey(name: 'total_price')
  final int? totalPrice;

  @JsonKey(name: 'meter_price')
  final int? meterPrice;

  @JsonKey(name: 'building_area')
  final int? buildingArea;

  final String? description;

  @JsonKey(name: 'sell_purpose')
  final String? sellPurpose;

  final String? countery;
  final String? governate;
  final String? city;
  final String? district;
  final String? street;

  @JsonKey(name: 'map_url')
  final String? mapUrl;

  final int? bedrooms;
  final int? bathrooms;

  @JsonKey(name: 'no_of_tempeletes')
  final int? noOfTempeletes;

  final int? floors;
  final String? view;
  final String? finshing;
  final int? status;

  @JsonKey(name: 'is_standalone')
  final bool? isStandalone;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'company_id')
  final String? companyId;

  @JsonKey(name: 'owner_id')
  final String? ownerId;

  @JsonKey(name: 'unit_floors')
  final List<UnitFloor>? unitFloors;

  const Unit({
    this.unitId,
    this.unitName,
    this.unitType,
    this.hasElevator,
    this.totalArea,
    this.totalPrice,
    this.meterPrice,
    this.buildingArea,
    this.description,
    this.sellPurpose,
    this.countery,
    this.governate,
    this.city,
    this.district,
    this.street,
    this.mapUrl,
    this.bedrooms,
    this.bathrooms,
    this.noOfTempeletes,
    this.floors,
    this.view,
    this.finshing,
    this.status,
    this.isStandalone,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.ownerId,
    this.unitFloors,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
