// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadActionModel _$LeadActionModelFromJson(Map<String, dynamic> json) =>
    LeadActionModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      companyActionId: (json['company_action_id'] as num?)?.toInt(),
      actionType: (json['action_type'] as num?)?.toInt(),
      isAnswered: json['is_answered'] as bool?,
      actionDate: json['action_date'] as String?,
      nextFollow: (json['next_follow'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      unitPrice: (json['unit_price'] as num?)?.toInt(),
      rentalDuration: (json['rental_duration'] as num?)?.toInt(),
      rentalCost: (json['rental_cost'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      cancelReason: json['cancel_reason'] as String?,
      meetingType: (json['meeting_type'] as num?)?.toInt(),
      meetingLocation: (json['meeting_location'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UsersModel.fromJson(json['user'] as Map<String, dynamic>),
      isDeleted: json['is_deleted'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      companyId: (json['company_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LeadActionModelToJson(LeadActionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'lead_id': instance.leadId,
      'company_action_id': instance.companyActionId,
      'action_type': instance.actionType,
      'is_answered': instance.isAnswered,
      'action_date': instance.actionDate,
      'next_follow': instance.nextFollow,
      'unit_id': instance.unitId,
      'unit_price': instance.unitPrice,
      'rental_duration': instance.rentalDuration,
      'rental_cost': instance.rentalCost,
      'notes': instance.notes,
      'cancel_reason': instance.cancelReason,
      'meeting_type': instance.meetingType,
      'meeting_location': instance.meetingLocation,
      'user': instance.user,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'company_id': instance.companyId,
    };
