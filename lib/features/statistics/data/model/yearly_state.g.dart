// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yearly_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearlyStats _$YearlyStatsFromJson(Map<String, dynamic> json) => YearlyStats(
  noNewClients: (json['no_new_clients'] as num).toInt(),
  noNewDeals: (json['no_new_deals'] as num).toInt(),
  totalSales: (json['total_sales'] as num).toInt(),
  conversionRate: (json['conversion_rate'] as num).toDouble(),
);

Map<String, dynamic> _$YearlyStatsToJson(YearlyStats instance) =>
    <String, dynamic>{
      'no_new_clients': instance.noNewClients,
      'no_new_deals': instance.noNewDeals,
      'total_sales': instance.totalSales,
      'conversion_rate': instance.conversionRate,
    };
