// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_action_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentActionStatisticsData _$AgentActionStatisticsDataFromJson(
  Map<String, dynamic> json,
) => AgentActionStatisticsData(
  conversionRate: (json['conversion_rate'] as num).toDouble(),
  newClients: (json['new_clients'] as num).toInt(),
  newDeals: (json['new_deals'] as num).toInt(),
  totalSales: (json['total_sales'] as num).toInt(),
  lastMonthlyStats: (json['last_monthly_stats'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, MonthlyStats.fromJson(e as Map<String, dynamic>)),
  ),
  lastFiveYearsStats: (json['last_five_years_stats'] as Map<String, dynamic>)
      .map(
        (k, e) => MapEntry(k, YearlyStats.fromJson(e as Map<String, dynamic>)),
      ),
  lastTenLeads: (json['last_ten_leads'] as List<dynamic>)
      .map((e) => Lead.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AgentActionStatisticsDataToJson(
  AgentActionStatisticsData instance,
) => <String, dynamic>{
  'conversion_rate': instance.conversionRate,
  'new_clients': instance.newClients,
  'new_deals': instance.newDeals,
  'total_sales': instance.totalSales,
  'last_monthly_stats': instance.lastMonthlyStats,
  'last_five_years_stats': instance.lastFiveYearsStats,
  'last_ten_leads': instance.lastTenLeads,
};
