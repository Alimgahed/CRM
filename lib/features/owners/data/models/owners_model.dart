import 'package:json_annotation/json_annotation.dart';

part 'owners_model.g.dart';
@JsonSerializable()
class Owner {
  final String ownerId;
  final String fullName;
  final String? fullNameEn;
  final String? email;
  final String? phone;
  final String? scoundPhone;
  final bool isDeleted;
  final String createdAt;
  final String? updatedAt;
  final String companyId;

  Owner({
    required this.ownerId,
    required this.fullName,
    this.fullNameEn,
    this.email,
    this.phone,
    this.scoundPhone,
    required this.isDeleted,
    required this.createdAt,
    this.updatedAt,
    required this.companyId,
  });

  factory Owner.fromJson(Map<String, dynamic> json) =>
      _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
