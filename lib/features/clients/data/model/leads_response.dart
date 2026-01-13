import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leads_response.g.dart';

@JsonSerializable()
class LeadsResponse {
  final List<Lead> data;
  final int total;
  final int page;
  @JsonKey(name: 'page_size')
  final int pageSize;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  LeadsResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  factory LeadsResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LeadsResponseToJson(this);
}
