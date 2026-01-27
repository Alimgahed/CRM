// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddActionModel _$AddActionModelFromJson(Map<String, dynamic> json) =>
    AddActionModel(
      actionDate: json['actionDate'] as String?,
      actionType: (json['actionType'] as num?)?.toInt(),
      cancelReason: json['cancelReason'] as String?,
      commentMessage: json['commentMessage'] as String?,
      actionActionId: (json['actionActionId'] as num?)?.toInt(),
      companyActionName: json['companyActionName'] as String?,
      actionId: (json['actionId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      floorNumber: (json['floorNumber'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      isAnswered: json['isAnswered'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      lead: json['lead'] == null
          ? null
          : Lead.fromJson(json['lead'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$AddActionModelToJson(AddActionModel instance) =>
    <String, dynamic>{
      'actionDate': instance.actionDate,
      'actionType': instance.actionType,
      'cancelReason': instance.cancelReason,
      'commentMessage': instance.commentMessage,
      'actionActionId': instance.actionActionId,
      'companyActionName': instance.companyActionName,
      'actionId': instance.actionId,
      'createdAt': instance.createdAt,
      'floorNumber': instance.floorNumber,
      'id': instance.id,
      'isAnswered': instance.isAnswered,
      'isDeleted': instance.isDeleted,
      'lead': instance.lead,
      'updatedAt': instance.updatedAt,
    };
