import 'package:json_annotation/json_annotation.dart';
part 'yearly_state.g.dart';

@JsonSerializable()
class YearlyStats {
  @JsonKey(name: 'no_new_clients')
  final int noNewClients;

  @JsonKey(name: 'no_new_deals')
  final int noNewDeals;

  @JsonKey(name: 'total_sales')
  final int totalSales;

  @JsonKey(name: 'conversion_rate')
  final double conversionRate;

  YearlyStats({
    required this.noNewClients,
    required this.noNewDeals,
    required this.totalSales,
    required this.conversionRate,
  });

  factory YearlyStats.fromJson(Map<String, dynamic> json) =>
      _$YearlyStatsFromJson(json);

  Map<String, dynamic> toJson() => _$YearlyStatsToJson(this);
}
