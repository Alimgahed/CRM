import 'package:json_annotation/json_annotation.dart';

part 'owners_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Owner {
  @JsonKey(name: 'owner_id')
  final String? ownerId;

  @JsonKey(name: 'full_name')
  final String? fullName;

  final String? fullNameEn;
  final String? email;
  final String? phone;

  @JsonKey(name: 'scound_phone')
  final String? secondPhone;

  @JsonKey(defaultValue: false)
  final bool? isDeleted;

  final String? createdAt;

  final String? updatedAt;

  @JsonKey(name: 'company_id')
  final String? companyId;

  Owner({
    this.ownerId,
    this.fullName,
    this.fullNameEn,
    this.email,
    this.phone,
    this.secondPhone,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
