import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/theming/theme.dart';
import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesPerformanceStages extends StatelessWidget {
  final AgentActionStatisticsResponse data;

  const SalesPerformanceStages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 8, left: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sales Performance Stages Card
          _buildStagesCard(context: context, isDark: isDark),
          const SizedBox(height: 16),

          // Performance Chart
          _buildPerformanceChart(
            context: context,
            monthlyStats: data.data.lastMonthlyStats,
            sortedMonths: data.data.lastMonthlyStats.keys.toList()..sort(),
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildStagesCard({
    required BuildContext context,
    required bool isDark,
  }) {
    // Get the latest month data
    final monthlyStats = data.data.lastMonthlyStats;
    final sortedMonths = monthlyStats.keys.toList()..sort();
    final latestMonth = sortedMonths.isNotEmpty ? sortedMonths.last : '';
    final latestStats = latestMonth.isNotEmpty
        ? data.data.lastMonthlyStats[latestMonth]
        : null;

    if (latestStats == null) {
      return const SizedBox.shrink();
    }

    // Calculate total clients for percentage calculations

    final stages = [
      StageItem(
        title: "العملاء الجدد".tr,
        titleEn: "New Clients",
        count: data.data.lastMonthlyStats.values.first.noNewClients,
        percentage: data.data.lastMonthlyStats.values.first.conversionRate,
      ),
      StageItem(
        title: "عملاء تم التواصل معهم".tr,
        titleEn: "Contacted Clients",
        count: 0,
        percentage: 0.0,
      ),
      StageItem(
        title: "عملاء تم تحديد إجتماع معهم".tr,
        titleEn: "Scheduled Meetings",
        count: 0,
        percentage: 0.0,
      ),
      StageItem(
        title: "عملاء إرسل إليهم عروض".tr,
        titleEn: "Sent Offers",
        count: 0,
        percentage: 0.0,
      ),
      StageItem(
        title: "صفقات مغلقة".tr,
        titleEn: "Closed Deals",
        count: data.data.lastMonthlyStats.values.first.noNewDeals,
        percentage: data.data.lastMonthlyStats.values.first.conversionRate,
      ),
    ];

    return Container(
      padding: EdgeInsets.all(context.width < 600 ? 12 : 20),
      decoration: isDark
          ? AppDecorations.darkContainer
          : AppDecorations.lightContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "مراحل أداء المبيعات".tr,
            style: TextStyles.size16(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : primaryTextColor,
            ),
          ),
          const SizedBox(height: 24),
          ...stages.map(
            (stage) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _SalesStageItem(stage: stage, isDark: isDark),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(
                  color: isDark ? Colors.white24 : Colors.black26,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "عرض التفاصيل".tr,
                style: TextStyles.size14(
                  color: isDark ? Colors.white : primaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceChart({
    required BuildContext context,
    required Map<String, dynamic> monthlyStats,
    required List<String> sortedMonths,
    required bool isDark,
  }) {
    // Calculate max Y value from data
    double maxDeals = 0;
    double maxClients = 0;

    for (var month in sortedMonths) {
      final stats = monthlyStats[month];
      if (stats.noNewDeals > maxDeals) maxDeals = stats.noNewDeals.toDouble();
      if (stats.noNewClients > maxClients)
        maxClients = stats.noNewClients.toDouble();
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: isDark
          ? AppDecorations.darkContainer
          : AppDecorations.lightContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            children: [
              _buildLegendItem(
                "الصفقات المغلقة".tr,
                const Color(0xFFFF6B6B),
                isDark,
              ),
              _buildLegendItem(
                "العملاء المحتملين".tr,
                const Color(0xFF4ECDC4),
                isDark,
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Chart
          SizedBox(
            height: 300,
            child: _buildLineChart(
              monthlyStats: monthlyStats,
              sortedMonths: sortedMonths,
              isDark: isDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart({
    required Map<String, dynamic> monthlyStats,
    required List<String> sortedMonths,
    required bool isDark,
  }) {
    if (sortedMonths.isEmpty) {
      return Center(
        child: Text(
          "No data available",
          style: TextStyles.size14(
            color: isDark ? Colors.white70 : primaryTextColor,
          ),
        ),
      );
    }

    double maxDeals = 0;
    double maxClients = 0;

    for (final month in sortedMonths) {
      final stats = monthlyStats[month];
      if (stats.noNewDeals > maxDeals) maxDeals = stats.noNewDeals.toDouble();
      if (stats.noNewClients > maxClients) {
        maxClients = stats.noNewClients.toDouble();
      }
    }

    final maxY = (maxDeals > maxClients ? maxDeals : maxClients) * 1.2;
    final yInterval = maxY > 5 ? (maxY / 5).ceilToDouble() : 1.0;

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: yInterval,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: isDark ? Colors.white10 : Colors.black12,
              strokeWidth: 1,
              dashArray: [5, 5],
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: isDark ? Colors.white10 : Colors.black12,
              strokeWidth: 1,
              dashArray: [5, 5],
            );
          },
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              interval: yInterval,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyles.size14(
                    color: isDark ? Colors.white60 : primaryTextColor,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: (sortedMonths.length - 1)
                  .toDouble(), // ensures only start and end
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                // Only show first and last labels
                if (index == 0 || index == sortedMonths.length - 1) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      sortedMonths[index],
                      style: TextStyles.size14(
                        color: isDark ? Colors.white60 : primaryTextColor,
                      ),
                    ),
                  );
                }
                return const SizedBox(); // hide all other labels
              },
            ),
          ),

          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: (sortedMonths.length - 1).toDouble(),
        minY: 0,
        maxY: maxY,
        lineBarsData: [
          // Closed Deals Line (Orange/Red)
          LineChartBarData(
            spots: sortedMonths.asMap().entries.map((entry) {
              final month = entry.value;
              final stats = monthlyStats[month];
              return FlSpot(entry.key.toDouble(), stats.noNewDeals.toDouble());
            }).toList(),
            isCurved: true,
            color: const Color(0xFFFF6B6B),
            barWidth: 2.5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: const Color(0xFFFF6B6B),
                  strokeWidth: 2,
                  strokeColor: isDark ? darkColor : Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(show: false),
          ),
          // Potential Clients Line (Cyan/Blue)
          LineChartBarData(
            spots: sortedMonths.asMap().entries.map((entry) {
              final month = entry.value;
              final stats = monthlyStats[month];
              return FlSpot(
                entry.key.toDouble(),
                stats.noNewClients.toDouble(),
              );
            }).toList(),
            isCurved: true,
            color: const Color(0xFF4ECDC4),
            barWidth: 2.5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: const Color(0xFF4ECDC4),
                  strokeWidth: 2,
                  strokeColor: isDark ? darkColor : Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) =>
                isDark ? Colors.black87 : Colors.white,
            tooltipBorderRadius: BorderRadius.circular(8),
            tooltipPadding: const EdgeInsets.all(8),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                final month = sortedMonths[spot.x.toInt()];
                return LineTooltipItem(
                  '$month\n${spot.y.toInt()}',
                  TextStyles.size14(
                    color: spot.bar.color!,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  // Widget _buildTab(String title, bool isActive, bool isDark) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  //     decoration: BoxDecoration(
  //       color: isActive
  //           ? (isDark ? appColor.withOpacity(0.2) : appColor.withOpacity(0.1))
  //           : Colors.transparent,
  //       border: Border(
  //         bottom: BorderSide(
  //           color: isActive ? appColor : Colors.transparent,
  //           width: 2,
  //         ),
  //       ),
  //     ),
  //     child: Text(
  //       title,
  //       style: TextStyles.size12(
  //         fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
  //         color: isActive
  //             ? appColor
  //             : (isDark ? Colors.white70 : primaryTextColor),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildLegendItem(String label, Color color, bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyles.size14(
            color: isDark ? Colors.white70 : primaryTextColor,
          ),
        ),
      ],
    );
  }
}

/// Single Stage Widget
class _SalesStageItem extends StatelessWidget {
  final StageItem stage;
  final bool isDark;

  const _SalesStageItem({required this.stage, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final progressValue = (stage.percentage).clamp(0.0, 1.0);
    final percentageColor = stage.percentage >= 1.0
        ? const Color(0xFF4ECDC4)
        : (stage.percentage > 0 ? successColor : Colors.grey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                stage.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.size14(
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : primaryTextColor,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: isDark ? darkFieldColor : fieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${(progressValue * 100).toStringAsFixed(0)}%',
                style: TextStyles.size14(
                  fontWeight: FontWeight.bold,
                  color: percentageColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progressValue,
                  minHeight: 7,
                  backgroundColor: isDark ? darkFieldColor : radioColor,
                  valueColor: AlwaysStoppedAnimation<Color>(percentageColor),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              stage.count.toString(),
              style: TextStyles.size12(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : primaryTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Stage Item model
class StageItem {
  final String title;
  final String titleEn;
  final int count;
  final double percentage;

  StageItem({
    required this.title,
    required this.titleEn,
    required this.count,
    required this.percentage,
  });
}
