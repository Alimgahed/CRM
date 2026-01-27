// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentActionStatisticsResponse _$AgentActionStatisticsResponseFromJson(
  Map<String, dynamic> json,
) => AgentActionStatisticsResponse(
  message: json['message'] as String?,
  data: AgentActionStatisticsData.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AgentActionStatisticsResponseToJson(
  AgentActionStatisticsResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};
