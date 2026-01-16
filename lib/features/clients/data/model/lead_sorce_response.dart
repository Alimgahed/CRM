import 'package:crm/features/clients/data/model/lead_source.dart';
import 'package:json_annotation/json_annotation.dart';
part 'lead_sorce_response.g.dart';

@JsonSerializable()
class LeadSourceResponse {
  final List<LeadSource> data;
  final int total;
  final int page;
  @JsonKey(name: 'page_size')
  final int pageSize;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  LeadSourceResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  factory LeadSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadSourceResponseFromJson(json);
}
