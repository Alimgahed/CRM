import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'add_action_model.g.dart';

@JsonSerializable()
class AddActionModel {
  final String? actionDate;
  final int? actionType;
  final String? cancelReason;
  final String? commentMessage;
  final int? actionActionId;
  final String? companyActionName;
  final int? actionId;
  final String? createdAt;
  final int? floorNumber;
  final int? id;
  final bool? isAnswered;
  final bool? isDeleted;
  final Lead? lead;
  final String? updatedAt;
  AddActionModel({
    this.actionDate,
    this.actionType,
    this.cancelReason,
    this.commentMessage,
    this.actionActionId,
    this.companyActionName,
    this.actionId,
    this.createdAt,
    this.floorNumber,
    this.id,
    this.isAnswered,
    this.isDeleted,
    this.lead,
    this.updatedAt,
  });
  factory AddActionModel.fromJson(Map<String, dynamic> json) =>
      _$AddActionModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddActionModelToJson(this);
}
