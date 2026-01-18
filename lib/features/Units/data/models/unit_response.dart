import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'unit_response.g.dart';

@JsonSerializable()
class UnitResponse {
  final int? count;
  final List<Unit> data;
  final int? total;
  final int? page;

  @JsonKey(name: 'page_size')
  final int? pageSize;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  UnitResponse({
    required this.count,
    required this.data,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  factory UnitResponse.fromJson(Map<String, dynamic> json) =>
      _$UnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitResponseToJson(this);
}
