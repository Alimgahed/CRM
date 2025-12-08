import 'package:json_annotation/json_annotation.dart';

part 'project_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectResponse {
  @JsonKey(name: "ID")
  int? id;

  @JsonKey(name: "COMPANY_ID")
  int? companyId;

  @JsonKey(name: "DEVELOPMENT_COMPANY_ID")
  int? developmentCompanyId;

  @JsonKey(name: "PROJECT_NAME")
  String? projectName;

  @JsonKey(name: "PROJECT_NAME_EN")
  String? projectNameEn;

  @JsonKey(name: "DESCRIPTION")
  String? description;

  @JsonKey(name: "DESCRIPTION_EN")
  String? descriptionEn;

  @JsonKey(name: "CITY_ID")
  int? cityId;

  @JsonKey(name: "LICENSE_NO")
  int? licenseNo;

  @JsonKey(name: "LICENSE_DATE")
  DateTime? licenseDate;

  @JsonKey(name: "END_DATE")
  DateTime? endDate;

  @JsonKey(name: "NO_UNITS")
  int? noUnits;

  @JsonKey(name: "NO_BUILDINGS")
  int? noBuildings;

  @JsonKey(name: "TOTAL_AREA")
  dynamic totalArea;

  @JsonKey(name: "IS_ACTIVE")
  bool? isActive;

  @JsonKey(name: "LAT")
  dynamic lat;

  @JsonKey(name: "LNG")
  dynamic lng;

  @JsonKey(name: "PROJECT_CONDITION_ID")
  int? projectConditionId;

  @JsonKey(name: "PROJECT_IMAGES")
  List<ProjectImageSS>? projectImages;

  @JsonKey(name: "PROJECT_CAMPAIGNS")
  List<ProjectCampaign>? projectCampaigns;

  @JsonKey(name: "PROJECT_UNIT_TYPE_PRICES")
  List<ProjectUnitTypePrices>? projectUnitTypePrices;

  @JsonKey(name: "ATTACHMENTS")
  List<ProjectAttachment>? attachments;

  @JsonKey(name: "YOUTUBE_VIDEOS")
  List<ProjectVideo>? youtubeVideos;

  @JsonKey(name: "PROJECT_UNITS")
  List<ProjectUnit>? projectUnits;

  @JsonKey(name: "COMMISION")
  dynamic commision;

  @JsonKey(name: "COMPANY_INCENTIVE")
  dynamic companyIncentive;

  @JsonKey(name: "SEQ_NO")
  int? seqNo;

  @JsonKey(name: "EDARY_PRICE_FROM")
  dynamic edaryPriceFrom;

  @JsonKey(name: "EDARY_PRICE_TO")
  dynamic edaryPriceTo;

  @JsonKey(name: "EDARY_INSTALLMENT_PLAN")
  dynamic edaryInstallmentPlan;

  @JsonKey(name: "SAKANY_PRICE_FROM")
  dynamic sakanyPriceFrom;

  @JsonKey(name: "SAKANY_PRICE_TO")
  dynamic sakanyPriceTo;

  @JsonKey(name: "SAKANY_INSTALLMENT_PLAN")
  String? sakanyInstallmentPlan;

  @JsonKey(name: "MEDICAL_PRICE_FROM")
  double? medicalPriceFrom;

  @JsonKey(name: "MEDICAL_PRICE_TO")
  double? medicalPriceTo;

  @JsonKey(name: "MEDICAL_INSTALLMENT_PLAN")
  String? medicalInstallmentPlan;

  @JsonKey(name: "COMMERCIAL_PRICE_FROM")
  double? commercialPriceFrom;

  @JsonKey(name: "COMMERCIAL_PRICE_TO")
  double? commercialPriceTo;

  @JsonKey(name: "COMMERCIAL_INSTALLMENT_PLAN")
  String? commercialInstallmentPlan;

  @JsonKey(name: "UPDATE")
  String? update;

  @JsonKey(name: "UPDATED_USER")
  String? updateUser;

  ProjectResponse();

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}

@JsonSerializable()
class ProjectImageSS {
  @JsonKey(name: "PROJECT_ID")
  int? projectId;

  @JsonKey(name: "IMAGE_URL")
  String? imageUrl;

  @JsonKey(name: "IMAGE_BASE")
  String? imageBase;

  @JsonKey(name: "IMAGE_BYTES")
  List<int>? imageBytes;

  @JsonKey(name: "TYPE_ID")
  int? typeId;

  @JsonKey(name: "SHOW_TO_AGENTS")
  bool? showToAgents;

  @JsonKey(name: "DOWNLOAD_LINK")
  String? downloadLink;

  ProjectImageSS();

  factory ProjectImageSS.fromJson(Map<String, dynamic> json) =>
      _$ProjectImageSSFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectImageSSToJson(this);
}

@JsonSerializable()
class ProjectCampaign {
  @JsonKey(name: "ID")
  int? id;

  @JsonKey(name: "PROJECT_ID")
  int? projectId;

  @JsonKey(name: "TEXT")
  String? text;

  @JsonKey(name: "STAMP_DATE")
  DateTime? stampDate;

  @JsonKey(name: "STAMP_USER")
  String? stampUser;

  @JsonKey(name: "UPDATED_USER")
  String? updatedUser;

  @JsonKey(name: "UPDATED_AT")
  DateTime? updatedAt;

  @JsonKey(name: "SHOW_TO_AGENT")
  bool? showToAgent;

  ProjectCampaign();

  factory ProjectCampaign.fromJson(Map<String, dynamic> json) =>
      _$ProjectCampaignFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectCampaignToJson(this);
}

@JsonSerializable()
class ProjectAttachment {
  @JsonKey(name: "ID")
  int? id;

  @JsonKey(name: "PROJECT_ID")
  int? projectId;

  @JsonKey(name: "FILE_NAME")
  String? fileName;

  @JsonKey(name: "DATA")
  List<int>? data;

  @JsonKey(name: "DATA_BASE")
  String? dataBase;

  @JsonKey(name: "DATA_TYPE")
  int? dataType;

  @JsonKey(name: "URL")
  String? url;

  @JsonKey(name: "PATH")
  String? path;

  ProjectAttachment();

  factory ProjectAttachment.fromJson(Map<String, dynamic> json) =>
      _$ProjectAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectAttachmentToJson(this);
}

@JsonSerializable()
class ProjectUnitTypePrices {
  @JsonKey(name: "PROJECT_ID")
  int? projectId;

  @JsonKey(name: "UNIT_TYPE")
  int? unitType;

  @JsonKey(name: "START_PRICE")
  double? startPrice;

  @JsonKey(name: "END_PRICE")
  double? endPrice;

  ProjectUnitTypePrices();

  factory ProjectUnitTypePrices.fromJson(Map<String, dynamic> json) =>
      _$ProjectUnitTypePricesFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectUnitTypePricesToJson(this);
}

@JsonSerializable()
class ProjectVideo {
  @JsonKey(name: "ID")
  int? id;

  @JsonKey(name: "PROJECT_ID")
  int? projectId;

  @JsonKey(name: "LINK")
  String? link;

  ProjectVideo();

  factory ProjectVideo.fromJson(Map<String, dynamic> json) =>
      _$ProjectVideoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectVideoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProjectUnit {
  @JsonKey(name: "ID")
  int? id;

  @JsonKey(name: "PROJECT_ID")
  int? projectId;

  @JsonKey(name: "UNIT_CODE")
  String? unitCode;

  @JsonKey(name: "UNIT_TYPE")
  int? unitType;

  @JsonKey(name: "PRICE")
  dynamic price;

  @JsonKey(name: "DISCOUNT_PERCENTAGE")
  dynamic discountPercentage;

  @JsonKey(name: "SOLD")
  bool? sold;

  @JsonKey(name: "AREA")
  dynamic area;

  @JsonKey(name: "NOTES")
  String? notes;

  @JsonKey(name: "ADDITIONAL_DESCRIPTION")
  String? additionalDescription;

  @JsonKey(name: "NO_ROOMS")
  int? noRooms;

  @JsonKey(name: "NO_BATHROOMS")
  int? noBathrooms;

  @JsonKey(name: "NO_KITCHENS")
  int? noKitchens;

  @JsonKey(name: "OUTDOOR_AREA")
  dynamic outdoorArea;

  @JsonKey(name: "NO_FLOORS")
  int? noFloors;

  @JsonKey(name: "UNIT_IMAGES")
  List<ProjectUnitImage>? unitImages;

  @JsonKey(name: "TITLE")
  String? title;

  @JsonKey(name: "ADDRESS")
  String? address;

  ProjectUnit();

  factory ProjectUnit.fromJson(Map<String, dynamic> json) =>
      _$ProjectUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectUnitToJson(this);
}

@JsonSerializable()
class ProjectUnitImage {
  @JsonKey(name: "IMAGE_URL")
  String? imageUrl;

  @JsonKey(name: "TYPE_ID")
  int? typeId;

  @JsonKey(name: "UNIT_ID")
  int? unitId;

  ProjectUnitImage();

  factory ProjectUnitImage.fromJson(Map<String, dynamic> json) =>
      _$ProjectUnitImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectUnitImageToJson(this);
}
