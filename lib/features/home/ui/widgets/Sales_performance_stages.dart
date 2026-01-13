import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/theming/theme.dart';
import 'package:crm/features/home/data/model/model.dart';
import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesPerformanceStages extends StatelessWidget {
  final AgentActionStatisticsResponse data;

  const SalesPerformanceStages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final loc = context.select(
      (LocaleCubit c) => AppLocalizations(c.currentLocale),
    );

    final monthlyStats = data.data.lastMonthlyStats;
    final sortedMonths = monthlyStats.keys.toList()..sort();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StagesCard(
            data: data,
            monthlyStats: monthlyStats,
            sortedMonths: sortedMonths,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _PerformanceChart(
            loc: loc,
            monthlyStats: monthlyStats,
            sortedMonths: sortedMonths,
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _StagesCard extends StatelessWidget {
  final AgentActionStatisticsResponse data;
  final Map<String, dynamic> monthlyStats;
  final List<String> sortedMonths;
  final bool isDark;

  const _StagesCard({
    required this.data,
    required this.monthlyStats,
    required this.sortedMonths,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    if (sortedMonths.isEmpty) return const SizedBox.shrink();

    final latestMonth = sortedMonths.last;
    final latestStats = monthlyStats[latestMonth];
    final loc = context.select(
      (LocaleCubit c) => AppLocalizations(c.currentLocale),
    );

    // Data mapped directly from the latestStats variable for accuracy
    final stages = [
      StageItem(
        title: loc.newClients,
        count: latestStats.noNewClients,
        percentage: latestStats.noNewClients / data.data.newClients,
      ),
      // Optimization: Static data or placeholder stages should be handled gracefully
      StageItem(title: "Contacted", count: 0, percentage: 0.0),
      StageItem(
        title: loc.deals,
        count: latestStats.noNewDeals,
        percentage: latestStats.noNewDeals / data.data.newDeals,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: isDark
          ? AppDecorations.darkContainer
          : AppDecorations.lightContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                loc.salesperformancestages, // Localization fix
                style: TextStyles.size16(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : primaryTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...stages.map(
            (stage) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _SalesStageItem(stage: stage, isDark: isDark),
            ),
          ),
          _buildDetailButton(isDark, loc),
        ],
      ),
    );
  }

  Widget _buildDetailButton(bool isDark, AppLocalizations loc) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: isDark ? Colors.white24 : Colors.black26),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          loc.viewall,
          style: TextStyles.size14(
            color: isDark ? Colors.white : primaryTextColor,
          ),
        ),
      ),
    );
  }
}

class _PerformanceChart extends StatelessWidget {
  final Map<String, dynamic> monthlyStats;
  final List<String> sortedMonths;
  final bool isDark;
  final AppLocalizations loc;

  const _PerformanceChart({
    required this.monthlyStats,
    required this.sortedMonths,
    required this.isDark,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    if (sortedMonths.isEmpty) return const SizedBox.shrink();

    // Logic for interval calculation moved to a helper for cleaner build
    final maxY = _calculateMaxY();
    final yInterval = maxY > 5 ? (maxY / 5).ceilToDouble() : 1.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: isDark
          ? AppDecorations.darkContainer
          : AppDecorations.lightContainer,
      child: Column(
        children: [
          _buildLegend(isDark),
          const SizedBox(height: 16),
          SizedBox(height: 300, child: LineChart(_chartData(maxY, yInterval))),
        ],
      ),
    );
  }

  double _calculateMaxY() {
    double max = 0;
    for (var month in sortedMonths) {
      final stats = monthlyStats[month];
      if (stats.noNewDeals > max) max = stats.noNewDeals.toDouble();
      if (stats.noNewClients > max) max = stats.noNewClients.toDouble();
    }
    return max * 1.2;
  }

  Widget _buildLegend(bool isDark) {
    return Wrap(
      spacing: 16,
      children: [
        _LegendItem(
          label: loc.deals,
          color: const Color(0xFFFF6B6B),
          isDark: isDark,
        ),
        _LegendItem(
          label: loc.clients,
          color: const Color(0xFF4ECDC4),
          isDark: isDark,
        ),
      ],
    );
  }

  LineChartData _chartData(double maxY, double yInterval) {
    return LineChartData(
      // ... gridData remains same
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: yInterval, // Prevents Y-axis decimals if not needed
            reservedSize: 35,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            // FORCE X-axis to only check whole number values
            interval: 1,
            getTitlesWidget: (value, meta) {
              // value is now guaranteed to be 0.0, 1.0, 2.0...
              final int index = value.toInt();

              // Only show labels for valid indices in your months list
              if (index >= 0 && index < sortedMonths.length) {
                // Logic to only show first and last to keep it clean
                if (index == 0 || index == sortedMonths.length - 1) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      sortedMonths[index],
                      style: TextStyle(
                        fontSize: 10,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      // CRITICAL: Explicitly set minX and maxX as integers
      minX: 0,
      maxX: (sortedMonths.length - 1).toDouble(),
      minY: 0,
      maxY: maxY,

      borderData: FlBorderData(show: false),
      lineBarsData: [
        _createLine(const Color(0xFFFF6B6B), (s) => s.noNewDeals.toDouble()),
        _createLine(const Color(0xFF4ECDC4), (s) => s.noNewClients.toDouble()),
      ],
    );
  }

  LineChartBarData _createLine(Color color, double Function(dynamic) getValue) {
    return LineChartBarData(
      spots: sortedMonths
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), getValue(monthlyStats[e.value])))
          .toList(),
      isCurved: true,
      color: color,
      barWidth: 3,
      dotData: const FlDotData(show: false),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final String label;
  final Color color;
  final bool isDark;

  const _LegendItem({
    required this.label,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
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
          style: TextStyles.size12(
            color: isDark ? Colors.white70 : primaryTextColor,
          ),
        ),
      ],
    );
  }
}

class _SalesStageItem extends StatelessWidget {
  final StageItem stage;
  final bool isDark;

  const _SalesStageItem({required this.stage, required this.isDark});

  @override
  Widget build(BuildContext context) {
    // Optimization: Clamp the value once to prevent layout errors if data is > 1.0
    final double progressValue = stage.percentage.clamp(0.0, 1.0);

    // Determine color based on progress thresholds
    final Color percentageColor = _getStageColor(stage.percentage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                stage.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.size14(
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : primaryTextColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            _PercentageLabel(
              value: progressValue,
              color: percentageColor,
              isDark: isDark,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _ProgressBar(
                value: progressValue,
                color: percentageColor,
                isDark: isDark,
              ),
            ),
            const SizedBox(width: 12),
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

  Color _getStageColor(double percentage) {
    if (percentage >= 1.0) return const Color(0xFF4ECDC4); // Completed
    if (percentage > 0.5) return successColor; // Healthy progress
    if (percentage > 0) return appColor; // Started
    return Colors.grey.withOpacity(0.5); // No progress
  }
}

/// Extracted internal components for better rebuild performance
class _PercentageLabel extends StatelessWidget {
  final double value;
  final Color color;
  final bool isDark;

  const _PercentageLabel({
    required this.value,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '${(value * 100).toStringAsFixed(0)}%',
        style: TextStyles.size12(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double value;
  final Color color;
  final bool isDark;

  const _ProgressBar({
    required this.value,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 8,
        backgroundColor: isDark ? darkFieldColor : Colors.grey.shade200,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
