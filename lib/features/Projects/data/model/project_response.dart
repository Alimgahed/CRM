import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectResponse {
  final List<Project> data;
  final int? total;
  final int? page;

  @JsonKey(name: 'page_size')
  final int? pageSize;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  ProjectResponse({
    required this.data,
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);
}
