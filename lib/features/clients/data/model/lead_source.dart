import 'package:json_annotation/json_annotation.dart';
part 'lead_source.g.dart';

@JsonSerializable()
class LeadSource {
  final int? id;

  @JsonKey(name: 'source_name')
  final String sourceName;

  final String description;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final String createdAt;

  LeadSource({
    this.id,
    required this.sourceName,
    required this.description,
    required this.isDeleted,
    required this.createdAt,
  });

  factory LeadSource.fromJson(Map<String, dynamic> json) =>
      _$LeadSourceFromJson(json);

  Map<String, dynamic> toJson() => _$LeadSourceToJson(this);
}
