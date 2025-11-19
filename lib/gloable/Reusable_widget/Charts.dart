import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const BarChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text("No data"));
    }

    final maxValue =
        data
            .map((e) => e['value'] as int)
            .reduce((a, b) => a > b ? a : b)
            .toDouble() +
        20;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),

          // Value labels above bars
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: (double value, TitleMeta meta) {
                int index = value.toInt();
                if (index >= 0 && index < data.length) {
                  return Text(
                    data[index]['value'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),

          // Month titles under bars
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                int index = value.toInt();
                if (index >= 0 && index < data.length) {
                  return Text(data[index]['month']);
                }
                return const Text('');
              },
            ),
          ),
        ),

        borderData: FlBorderData(show: false),

        barGroups: List.generate(data.length, (i) {
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: (data[i]['value'] as int).toDouble(),
                color: Colors.blueAccent,
                width: 20,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final List<Color> colors;
  final double centerSpaceRadius;
  final double sectionRadius;
  final double sectionsSpace;
  final String centerText; // Text below ratio
  final double? ratio; // Ratio value (0-1)

  const PieChartWidget({
    super.key,
    required this.data,
    required this.colors,
    this.centerSpaceRadius = 60,
    this.sectionRadius = 50,
    this.sectionsSpace = 4,
    this.centerText = '',
    this.ratio,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: sectionsSpace,
            centerSpaceRadius: centerSpaceRadius,
            sections: List.generate(data.length, (i) {
              return PieChartSectionData(
                value: (data[i]['number'] as num).toDouble(),
                title: data[i]['number'].toString(),
                color: colors[i],
                radius: sectionRadius,
                titleStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            }),
          ),
        ),
        if (ratio != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(ratio! * 100).toStringAsFixed(0)}%",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (centerText.isNotEmpty)
                Text(
                  centerText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class LineChartWidget extends StatelessWidget {
  final List<int> values;
  final List<Color> colors;
  final Color indicatorStrokeColor;

  const LineChartWidget({
    super.key,
    required this.values,
    required this.colors,
    this.indicatorStrokeColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final spots = List.generate(
      values.length,
      (i) => FlSpot(i.toDouble(), values[i].toDouble()),
    );

    final transparentColors = colors.map((c) => c.withOpacity(0.30)).toList();

    final stops = List.generate(colors.length, (i) => i / (colors.length - 1));

    return LineChart(
      LineChartData(
        minY: 0,
        titlesData: FlTitlesData(show: false),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),

        // LINE DATA
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            curveSmoothness: 0.42,
            barWidth: 4,

            gradient: LinearGradient(colors: colors, stops: stops),

            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: transparentColors, stops: stops),
            ),

            dotData: const FlDotData(show: false),
          ),
        ],

        // VERTICAL DASHED LINES
        extraLinesData: ExtraLinesData(
          extraLinesOnTop: true,
          verticalLines: List.generate(spots.length, (i) {
            final t = i / (spots.length - 1);
            final color = _lerpGradient(colors, t).withOpacity(0.80);

            return VerticalLine(
              x: spots[i].x,
              color: color,
              strokeWidth: 3,
              dashArray: [6, 4],
            );
          }),
        ),
      ),
    );
  }

  /// Interpolate gradient color
  Color _lerpGradient(List<Color> colors, double t) {
    for (int i = 0; i < colors.length - 1; i++) {
      final start = i / (colors.length - 1);
      final end = (i + 1) / (colors.length - 1);

      if (t >= start && t <= end) {
        return Color.lerp(
          colors[i],
          colors[i + 1],
          (t - start) / (end - start),
        )!;
      }
    }
    return colors.last;
  }
}
