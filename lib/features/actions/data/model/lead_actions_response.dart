import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lead_actions_response.g.dart';

@JsonSerializable()
class LeadActionsResponse {
  final String? message;
  final List<LeadActionModel>? data;

  LeadActionsResponse({this.message, this.data});

  factory LeadActionsResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadActionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeadActionsResponseToJson(this);
}
