import 'package:json_annotation/json_annotation.dart';
import 'agent_action_statistics.dart';
part 'statistics_response.g.dart';

@JsonSerializable()
class AgentActionStatisticsResponse {
  final String? message;
  final AgentActionStatisticsData data;

  AgentActionStatisticsResponse({this.message, required this.data});

  factory AgentActionStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$AgentActionStatisticsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AgentActionStatisticsResponseToJson(this);
}
