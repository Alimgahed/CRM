// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    ProjectResponse()
      ..id = (json['ID'] as num?)?.toInt()
      ..companyId = (json['COMPANY_ID'] as num?)?.toInt()
      ..developmentCompanyId = (json['DEVELOPMENT_COMPANY_ID'] as num?)?.toInt()
      ..projectName = json['PROJECT_NAME'] as String?
      ..projectNameEn = json['PROJECT_NAME_EN'] as String?
      ..description = json['DESCRIPTION'] as String?
      ..descriptionEn = json['DESCRIPTION_EN'] as String?
      ..cityId = (json['CITY_ID'] as num?)?.toInt()
      ..licenseNo = (json['LICENSE_NO'] as num?)?.toInt()
      ..licenseDate = json['LICENSE_DATE'] == null
          ? null
          : DateTime.parse(json['LICENSE_DATE'] as String)
      ..endDate = json['END_DATE'] == null
          ? null
          : DateTime.parse(json['END_DATE'] as String)
      ..noUnits = (json['NO_UNITS'] as num?)?.toInt()
      ..noBuildings = (json['NO_BUILDINGS'] as num?)?.toInt()
      ..totalArea = json['TOTAL_AREA']
      ..isActive = json['IS_ACTIVE'] as bool?
      ..lat = json['LAT']
      ..lng = json['LNG']
      ..projectConditionId = (json['PROJECT_CONDITION_ID'] as num?)?.toInt()
      ..projectImages = (json['PROJECT_IMAGES'] as List<dynamic>?)
          ?.map((e) => ProjectImageSS.fromJson(e as Map<String, dynamic>))
          .toList()
      ..projectCampaigns = (json['PROJECT_CAMPAIGNS'] as List<dynamic>?)
          ?.map((e) => ProjectCampaign.fromJson(e as Map<String, dynamic>))
          .toList()
      ..projectUnitTypePrices = (json['PROJECT_UNIT_TYPE_PRICES']
              as List<dynamic>?)
          ?.map(
              (e) => ProjectUnitTypePrices.fromJson(e as Map<String, dynamic>))
          .toList()
      ..attachments = (json['ATTACHMENTS'] as List<dynamic>?)
          ?.map((e) => ProjectAttachment.fromJson(e as Map<String, dynamic>))
          .toList()
      ..youtubeVideos = (json['YOUTUBE_VIDEOS'] as List<dynamic>?)
          ?.map((e) => ProjectVideo.fromJson(e as Map<String, dynamic>))
          .toList()
      ..projectUnits = (json['PROJECT_UNITS'] as List<dynamic>?)
          ?.map((e) => ProjectUnit.fromJson(e as Map<String, dynamic>))
          .toList()
      ..commision = json['COMMISION']
      ..companyIncentive = json['COMPANY_INCENTIVE']
      ..seqNo = (json['SEQ_NO'] as num?)?.toInt()
      ..edaryPriceFrom = json['EDARY_PRICE_FROM']
      ..edaryPriceTo = json['EDARY_PRICE_TO']
      ..edaryInstallmentPlan = json['EDARY_INSTALLMENT_PLAN']
      ..sakanyPriceFrom = json['SAKANY_PRICE_FROM']
      ..sakanyPriceTo = json['SAKANY_PRICE_TO']
      ..sakanyInstallmentPlan = json['SAKANY_INSTALLMENT_PLAN'] as String?
      ..medicalPriceFrom = (json['MEDICAL_PRICE_FROM'] as num?)?.toDouble()
      ..medicalPriceTo = (json['MEDICAL_PRICE_TO'] as num?)?.toDouble()
      ..medicalInstallmentPlan = json['MEDICAL_INSTALLMENT_PLAN'] as String?
      ..commercialPriceFrom =
          (json['COMMERCIAL_PRICE_FROM'] as num?)?.toDouble()
      ..commercialPriceTo = (json['COMMERCIAL_PRICE_TO'] as num?)?.toDouble()
      ..commercialInstallmentPlan =
          json['COMMERCIAL_INSTALLMENT_PLAN'] as String?
      ..update = json['UPDATE'] as String?
      ..updateUser = json['UPDATED_USER'] as String?;

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'COMPANY_ID': instance.companyId,
      'DEVELOPMENT_COMPANY_ID': instance.developmentCompanyId,
      'PROJECT_NAME': instance.projectName,
      'PROJECT_NAME_EN': instance.projectNameEn,
      'DESCRIPTION': instance.description,
      'DESCRIPTION_EN': instance.descriptionEn,
      'CITY_ID': instance.cityId,
      'LICENSE_NO': instance.licenseNo,
      'LICENSE_DATE': instance.licenseDate?.toIso8601String(),
      'END_DATE': instance.endDate?.toIso8601String(),
      'NO_UNITS': instance.noUnits,
      'NO_BUILDINGS': instance.noBuildings,
      'TOTAL_AREA': instance.totalArea,
      'IS_ACTIVE': instance.isActive,
      'LAT': instance.lat,
      'LNG': instance.lng,
      'PROJECT_CONDITION_ID': instance.projectConditionId,
      'PROJECT_IMAGES': instance.projectImages?.map((e) => e.toJson()).toList(),
      'PROJECT_CAMPAIGNS':
          instance.projectCampaigns?.map((e) => e.toJson()).toList(),
      'PROJECT_UNIT_TYPE_PRICES':
          instance.projectUnitTypePrices?.map((e) => e.toJson()).toList(),
      'ATTACHMENTS': instance.attachments?.map((e) => e.toJson()).toList(),
      'YOUTUBE_VIDEOS': instance.youtubeVideos?.map((e) => e.toJson()).toList(),
      'PROJECT_UNITS': instance.projectUnits?.map((e) => e.toJson()).toList(),
      'COMMISION': instance.commision,
      'COMPANY_INCENTIVE': instance.companyIncentive,
      'SEQ_NO': instance.seqNo,
      'EDARY_PRICE_FROM': instance.edaryPriceFrom,
      'EDARY_PRICE_TO': instance.edaryPriceTo,
      'EDARY_INSTALLMENT_PLAN': instance.edaryInstallmentPlan,
      'SAKANY_PRICE_FROM': instance.sakanyPriceFrom,
      'SAKANY_PRICE_TO': instance.sakanyPriceTo,
      'SAKANY_INSTALLMENT_PLAN': instance.sakanyInstallmentPlan,
      'MEDICAL_PRICE_FROM': instance.medicalPriceFrom,
      'MEDICAL_PRICE_TO': instance.medicalPriceTo,
      'MEDICAL_INSTALLMENT_PLAN': instance.medicalInstallmentPlan,
      'COMMERCIAL_PRICE_FROM': instance.commercialPriceFrom,
      'COMMERCIAL_PRICE_TO': instance.commercialPriceTo,
      'COMMERCIAL_INSTALLMENT_PLAN': instance.commercialInstallmentPlan,
      'UPDATE': instance.update,
      'UPDATED_USER': instance.updateUser,
    };

ProjectImageSS _$ProjectImageSSFromJson(Map<String, dynamic> json) =>
    ProjectImageSS()
      ..projectId = (json['PROJECT_ID'] as num?)?.toInt()
      ..imageUrl = json['IMAGE_URL'] as String?
      ..imageBase = json['IMAGE_BASE'] as String?
      ..imageBytes = (json['IMAGE_BYTES'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..typeId = (json['TYPE_ID'] as num?)?.toInt()
      ..showToAgents = json['SHOW_TO_AGENTS'] as bool?
      ..downloadLink = json['DOWNLOAD_LINK'] as String?;

Map<String, dynamic> _$ProjectImageSSToJson(ProjectImageSS instance) =>
    <String, dynamic>{
      'PROJECT_ID': instance.projectId,
      'IMAGE_URL': instance.imageUrl,
      'IMAGE_BASE': instance.imageBase,
      'IMAGE_BYTES': instance.imageBytes,
      'TYPE_ID': instance.typeId,
      'SHOW_TO_AGENTS': instance.showToAgents,
      'DOWNLOAD_LINK': instance.downloadLink,
    };

ProjectCampaign _$ProjectCampaignFromJson(Map<String, dynamic> json) =>
    ProjectCampaign()
      ..id = (json['ID'] as num?)?.toInt()
      ..projectId = (json['PROJECT_ID'] as num?)?.toInt()
      ..text = json['TEXT'] as String?
      ..stampDate = json['STAMP_DATE'] == null
          ? null
          : DateTime.parse(json['STAMP_DATE'] as String)
      ..stampUser = json['STAMP_USER'] as String?
      ..updatedUser = json['UPDATED_USER'] as String?
      ..updatedAt = json['UPDATED_AT'] == null
          ? null
          : DateTime.parse(json['UPDATED_AT'] as String)
      ..showToAgent = json['SHOW_TO_AGENT'] as bool?;

Map<String, dynamic> _$ProjectCampaignToJson(ProjectCampaign instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PROJECT_ID': instance.projectId,
      'TEXT': instance.text,
      'STAMP_DATE': instance.stampDate?.toIso8601String(),
      'STAMP_USER': instance.stampUser,
      'UPDATED_USER': instance.updatedUser,
      'UPDATED_AT': instance.updatedAt?.toIso8601String(),
      'SHOW_TO_AGENT': instance.showToAgent,
    };

ProjectAttachment _$ProjectAttachmentFromJson(Map<String, dynamic> json) =>
    ProjectAttachment()
      ..id = (json['ID'] as num?)?.toInt()
      ..projectId = (json['PROJECT_ID'] as num?)?.toInt()
      ..fileName = json['FILE_NAME'] as String?
      ..data = (json['DATA'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..dataBase = json['DATA_BASE'] as String?
      ..dataType = (json['DATA_TYPE'] as num?)?.toInt()
      ..url = json['URL'] as String?
      ..path = json['PATH'] as String?;

Map<String, dynamic> _$ProjectAttachmentToJson(ProjectAttachment instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PROJECT_ID': instance.projectId,
      'FILE_NAME': instance.fileName,
      'DATA': instance.data,
      'DATA_BASE': instance.dataBase,
      'DATA_TYPE': instance.dataType,
      'URL': instance.url,
      'PATH': instance.path,
    };

ProjectUnitTypePrices _$ProjectUnitTypePricesFromJson(
        Map<String, dynamic> json) =>
    ProjectUnitTypePrices()
      ..projectId = (json['PROJECT_ID'] as num?)?.toInt()
      ..unitType = (json['UNIT_TYPE'] as num?)?.toInt()
      ..startPrice = (json['START_PRICE'] as num?)?.toDouble()
      ..endPrice = (json['END_PRICE'] as num?)?.toDouble();

Map<String, dynamic> _$ProjectUnitTypePricesToJson(
        ProjectUnitTypePrices instance) =>
    <String, dynamic>{
      'PROJECT_ID': instance.projectId,
      'UNIT_TYPE': instance.unitType,
      'START_PRICE': instance.startPrice,
      'END_PRICE': instance.endPrice,
    };

ProjectVideo _$ProjectVideoFromJson(Map<String, dynamic> json) => ProjectVideo()
  ..id = (json['ID'] as num?)?.toInt()
  ..projectId = (json['PROJECT_ID'] as num?)?.toInt()
  ..link = json['LINK'] as String?;

Map<String, dynamic> _$ProjectVideoToJson(ProjectVideo instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PROJECT_ID': instance.projectId,
      'LINK': instance.link,
    };

ProjectUnit _$ProjectUnitFromJson(Map<String, dynamic> json) => ProjectUnit()
  ..id = (json['ID'] as num?)?.toInt()
  ..projectId = (json['PROJECT_ID'] as num?)?.toInt()
  ..unitCode = json['UNIT_CODE'] as String?
  ..unitType = (json['UNIT_TYPE'] as num?)?.toInt()
  ..price = json['PRICE']
  ..discountPercentage = json['DISCOUNT_PERCENTAGE']
  ..sold = json['SOLD'] as bool?
  ..area = json['AREA']
  ..notes = json['NOTES'] as String?
  ..additionalDescription = json['ADDITIONAL_DESCRIPTION'] as String?
  ..noRooms = (json['NO_ROOMS'] as num?)?.toInt()
  ..noBathrooms = (json['NO_BATHROOMS'] as num?)?.toInt()
  ..noKitchens = (json['NO_KITCHENS'] as num?)?.toInt()
  ..outdoorArea = json['OUTDOOR_AREA']
  ..noFloors = (json['NO_FLOORS'] as num?)?.toInt()
  ..unitImages = (json['UNIT_IMAGES'] as List<dynamic>?)
      ?.map((e) => ProjectUnitImage.fromJson(e as Map<String, dynamic>))
      .toList()
  ..title = json['TITLE'] as String?
  ..address = json['ADDRESS'] as String?;

Map<String, dynamic> _$ProjectUnitToJson(ProjectUnit instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'PROJECT_ID': instance.projectId,
      'UNIT_CODE': instance.unitCode,
      'UNIT_TYPE': instance.unitType,
      'PRICE': instance.price,
      'DISCOUNT_PERCENTAGE': instance.discountPercentage,
      'SOLD': instance.sold,
      'AREA': instance.area,
      'NOTES': instance.notes,
      'ADDITIONAL_DESCRIPTION': instance.additionalDescription,
      'NO_ROOMS': instance.noRooms,
      'NO_BATHROOMS': instance.noBathrooms,
      'NO_KITCHENS': instance.noKitchens,
      'OUTDOOR_AREA': instance.outdoorArea,
      'NO_FLOORS': instance.noFloors,
      'UNIT_IMAGES': instance.unitImages?.map((e) => e.toJson()).toList(),
      'TITLE': instance.title,
      'ADDRESS': instance.address,
    };

ProjectUnitImage _$ProjectUnitImageFromJson(Map<String, dynamic> json) =>
    ProjectUnitImage()
      ..imageUrl = json['IMAGE_URL'] as String?
      ..typeId = (json['TYPE_ID'] as num?)?.toInt()
      ..unitId = (json['UNIT_ID'] as num?)?.toInt();

Map<String, dynamic> _$ProjectUnitImageToJson(ProjectUnitImage instance) =>
    <String, dynamic>{
      'IMAGE_URL': instance.imageUrl,
      'TYPE_ID': instance.typeId,
      'UNIT_ID': instance.unitId,
    };
