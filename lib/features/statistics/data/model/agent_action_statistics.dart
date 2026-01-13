import 'package:crm/features/statistics/data/model/lead_model.dart';
import 'package:crm/features/statistics/data/model/monthly_state.dart';
import 'package:crm/features/statistics/data/model/yearly_state.dart';
import 'package:json_annotation/json_annotation.dart';
part 'agent_action_statistics.g.dart';

@JsonSerializable()
class AgentActionStatisticsData {
  @JsonKey(name: 'conversion_rate')
  final double conversionRate;

  @JsonKey(name: 'new_clients')
  final int newClients;

  @JsonKey(name: 'new_deals')
  final int newDeals;

  @JsonKey(name: 'total_sales')
  final int totalSales;

  @JsonKey(name: 'last_monthly_stats')
  final Map<String, MonthlyStats> lastMonthlyStats;

  @JsonKey(name: 'last_five_years_stats')
  final Map<String, YearlyStats> lastFiveYearsStats;

  @JsonKey(name: 'last_ten_leads')
  final List<Lead> lastTenLeads;

  AgentActionStatisticsData({
    required this.conversionRate,
    required this.newClients,
    required this.newDeals,
    required this.totalSales,
    required this.lastMonthlyStats,
    required this.lastFiveYearsStats,
    required this.lastTenLeads,
  });

  factory AgentActionStatisticsData.fromJson(Map<String, dynamic> json) =>
      _$AgentActionStatisticsDataFromJson(json);

  Map<String, dynamic> toJson() => _$AgentActionStatisticsDataToJson(this);
}
