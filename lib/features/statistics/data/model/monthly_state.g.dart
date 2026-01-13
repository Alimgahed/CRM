// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlyStats _$MonthlyStatsFromJson(Map<String, dynamic> json) => MonthlyStats(
  noNewClients: (json['no_new_clients'] as num).toInt(),
  noNewDeals: (json['no_new_deals'] as num).toInt(),
  totalSales: (json['total_sales'] as num).toInt(),
  conversionRate: (json['conversion_rate'] as num).toDouble(),
);

Map<String, dynamic> _$MonthlyStatsToJson(MonthlyStats instance) =>
    <String, dynamic>{
      'no_new_clients': instance.noNewClients,
      'no_new_deals': instance.noNewDeals,
      'total_sales': instance.totalSales,
      'conversion_rate': instance.conversionRate,
    };
