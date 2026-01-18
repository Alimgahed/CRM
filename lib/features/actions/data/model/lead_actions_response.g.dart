// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_actions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadActionsResponse _$LeadActionsResponseFromJson(Map<String, dynamic> json) =>
    LeadActionsResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LeadActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeadActionsResponseToJson(
  LeadActionsResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};
