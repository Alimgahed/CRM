import 'package:json_annotation/json_annotation.dart';
part 'monthly_state.g.dart';

@JsonSerializable()
class MonthlyStats {
  @JsonKey(name: 'no_new_clients')
  final int noNewClients;

  @JsonKey(name: 'no_new_deals')
  final int noNewDeals;

  @JsonKey(name: 'total_sales')
  final int totalSales;

  @JsonKey(name: 'conversion_rate')
  final double conversionRate;

  MonthlyStats({
    required this.noNewClients,
    required this.noNewDeals,
    required this.totalSales,
    required this.conversionRate,
  });

  factory MonthlyStats.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatsFromJson(json);

  Map<String, dynamic> toJson() => _$MonthlyStatsToJson(this);
}
