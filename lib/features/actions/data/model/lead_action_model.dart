import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'lead_action_model.g.dart';

@JsonSerializable()
class LeadActionModel {
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'lead_id')
  final int? leadId;

  @JsonKey(name: 'company_action_id')
  final int? companyActionId;

  @JsonKey(name: 'action_type')
  final int? actionType;

  @JsonKey(name: 'is_answered')
  final bool? isAnswered;

  @JsonKey(name: 'action_date')
  final DateTime? actionDate;

  @JsonKey(name: 'next_follow')
  final int? nextFollow;

  @JsonKey(name: 'unit_id')
  final int? unitId;

  @JsonKey(name: 'unit_price')
  final int? unitPrice;

  @JsonKey(name: 'rental_duration')
  final int? rentalDuration;

  @JsonKey(name: 'rental_cost')
  final int? rentalCost;

  final String? notes;

  @JsonKey(name: 'cancel_reason')
  final String? cancelReason;

  @JsonKey(name: 'meeting_type')
  final int? meetingType;

  @JsonKey(name: 'meeting_location')
  final int? meetingLocation;

  final UsersModel? user;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'company_id')
  final int? companyId;

  LeadActionModel({
    this.id,
    this.userId,
    this.leadId,
    this.companyActionId,
    this.actionType,
    this.isAnswered,
    this.actionDate,
    this.nextFollow,
    this.unitId,
    this.unitPrice,
    this.rentalDuration,
    this.rentalCost,
    this.notes,
    this.cancelReason,
    this.meetingType,
    this.meetingLocation,
    this.user,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
  });

  factory LeadActionModel.fromJson(Map<String, dynamic> json) =>
      _$LeadActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeadActionModelToJson(this);
}
