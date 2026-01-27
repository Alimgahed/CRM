// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_actions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadActionsResponse _$LeadActionsResponseFromJson(Map<String, dynamic> json) =>
    LeadActionsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LeadActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeadActionsResponseToJson(
  LeadActionsResponse instance,
) => <String, dynamic>{'data': instance.data};
