import 'package:crm/features/owners/data/models/owners_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'owner_respone.g.dart';

@JsonSerializable()
class OwnerResponse {
  final List<Owner> data;
  final int total;
  final int page;

  @JsonKey(name: 'page_size')
  final int pageSize;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  OwnerResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  factory OwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$OwnerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerResponseToJson(this);
}
