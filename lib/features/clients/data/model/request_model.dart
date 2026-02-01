import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {
  final int id;
  @JsonKey(name: 'lead_id')
  final int leadId;
  @JsonKey(name: 'company_id')
  final int? companyId;
  final String? country;
  final String? governate;

  /// API sends NUMBER not string
  @JsonKey(name: 'area')
  final num? area;

  @JsonKey(name: 'unit_type')
  final String? unitType;

  @JsonKey(name: 'listing_type')
  final String? listingType;

  @JsonKey(name: 'market_type')
  final String? marketType;

  @JsonKey(name: 'selling_purpose')
  final String? sellingPurpose;

  @JsonKey(name: 'no_of_bedrooms')
  final int? noOfBedrooms;

  @JsonKey(name: 'no_of_bathrooms')
  final int? noOfBathrooms;

  @JsonKey(name: 'floor_number')
  final int? floorNumber;

  /// VERY BIG NUMBER → num
  @JsonKey(name: 'total_area')
  final num? totalArea;

  /// VERY BIG NUMBER → num
  final num? budget;

  @JsonKey(name: 'finishing_type')
  final String? finishingType;

  @JsonKey(name: 'has_parking')
  final bool? hasParking;

  @JsonKey(name: 'payment_type')
  final String? paymentType;

  final String? view;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  const RequestModel({
    required this.id,
    required this.leadId,
    this.companyId,
    this.country,
    this.governate,
    this.area,
    this.unitType,
    this.listingType,
    this.marketType,
    this.sellingPurpose,
    this.noOfBedrooms,
    this.noOfBathrooms,
    this.floorNumber,
    this.totalArea,
    this.budget,
    this.finishingType,
    this.hasParking,
    this.paymentType,
    this.view,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}

@JsonSerializable()
class RequestResponse {
  final List<RequestModel> data;
  final int total;
  final int page;
  @JsonKey(name: 'page_size')
  final int pageSize;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  const RequestResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  factory RequestResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestResponseToJson(this);
}
