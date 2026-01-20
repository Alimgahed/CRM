import 'package:crm/features/developers/data/models/developers_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'developers_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CompaniesResponse {
  final List<DeveloperCompany> data;
  final int? total;
  final int? page;

  @JsonKey(name: 'page_size')
  final int? pageSize;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  CompaniesResponse({
    required this.data,
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
  });

  factory CompaniesResponse.fromJson(Map<String, dynamic> json) =>
      _$CompaniesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompaniesResponseToJson(this);
}
