import 'package:json_annotation/json_annotation.dart';
part 'company_actions.g.dart';

@JsonSerializable()
class CompanyActionsModel {
  final int? id;
  @JsonKey(name: "action_type")
  final int? actionType;
  @JsonKey(name: "Name")
  final String? name;
  @JsonKey(name: "NameEn")
  final String? nameEn;
  final int? companyId;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  CompanyActionsModel({
    this.id,
    required this.actionType,
    required this.name,
    this.nameEn,
    this.companyId,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory CompanyActionsModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyActionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyActionsModelToJson(this);
}

@JsonSerializable()
class CompanyActionsResponse {
  final List<CompanyActionsModel>? data;
  CompanyActionsResponse({this.data});
  factory CompanyActionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyActionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyActionsResponseToJson(this);
}
