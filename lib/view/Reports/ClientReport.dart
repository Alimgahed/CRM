import 'package:crm/my_widget/home_widget/totals.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clientreport extends StatelessWidget {
  Clientreport({super.key});

  final List<Map<String, dynamic>> stats = const [
    {'number': 673, 'label': 'العملاء الجدد'},
    {'number': 486, 'label': 'تم التواصل'},
    {'number': 183, 'label': 'مهندسيم'},
    {'number': 72, 'label': 'قيد الاتخاذ'},
    {'number': 72, 'label': 'تم إلغى'},
  ];

  final List<Map<String, dynamic>> social = const [
    {'number': 673, 'label': 'Facebook'},
    {'number': 486, 'label': 'WhatsApp'},
    {'number': 183, 'label': 'Instagram'},
  ];

  final List<Map<String, dynamic>> monthlyData = const [
    {'month': 'Jan', 'value': 50},
    {'month': 'Feb', 'value': 80},
    {'month': 'Mar', 'value': 30},
    {'month': 'Apr', 'value': 90},
    {'month': 'May', 'value': 70},
    {'month': 'Jun', 'value': 100},
  ];

  List<int> get sortedValues =>
      stats.map((e) => e['number'] as int).toList()..sort();

  final List<Color> socialColors = const [
    Color(0xFF5B93FF),
    Color.fromARGB(218, 252, 235, 83),
    Color(0xFFFF5C93),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تقرير العملاء')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Total Cards Row 1
            Row(
              children: [
                Expanded(
                  child: TotalCard(
                    title: "Total Clients".tr,
                    amount: "40",
                    ratio: 0.15,
                    date: "منذ الشهر السابق",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TotalCard(
                    title: "conversion rate".tr,
                    amount: "18",
                    ratio: 0.10,
                    date: "منذ الشهر السابق",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Total Cards Row 2
            Row(
              children: [
                Expanded(
                  child: TotalCard(
                    title: "Active Clients".tr,
                    amount: "45",
                    ratio: 0.20,
                    date: "منذ الشهر السابق",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TotalCard(
                    title: "Non-following Clients".tr,
                    amount: "\$25,000",
                    ratio: 0.12,
                    date: "منذ الشهر السابق",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Customer Journey Chart
            _buildChartContainer(
              title: 'مراحل رحلة العميل',
              child: Column(
                children: [
                  _buildStatsRow(),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 200,
                    child: LineChartSample5(
                      values: sortedValues,
                      colors: const [
                        Color(0xFF1E86D6),
                        Color(0xFF176AC9),
                        Color(0xFF1E86D6),
                        Color(0xFF00AEEF),
                        Color(0xFF00EBEF),
                      ],
                      indicatorStrokeColor: const Color(0xFF0C52A3),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Bar Chart
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Social Sources Pie Chart
            _buildChartContainer(
              title: 'مصادر العملاء',
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 4,
                        centerSpaceRadius: 40,
                        sections: List.generate(social.length, (i) {
                          return PieChartSectionData(
                            value: social[i]['number'].toDouble(),
                            title: social[i]['number'].toString(),
                            color: socialColors[i],
                            radius: 50,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSocialLegend(),
                ],
              ),
            ),
            const SizedBox(height: 16),

            _buildChartContainer(
              title: 'أداء فريق المبيعات',
              child: SizedBox(height: 200, child: _buildBarChart()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY:
            monthlyData
                .map((e) => e['value'] as int)
                .reduce((a, b) => a > b ? a : b)
                .toDouble() +
            20,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                int index = value.toInt();
                if (index >= 0 && index < monthlyData.length) {
                  return Text(monthlyData[index]['month']);
                }
                return const Text('');
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(monthlyData.length, (i) {
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: (monthlyData[i]['value'] as int).toDouble(),
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

  Widget _buildChartContainer({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: stats.map((stat) {
        final color = [
          const Color(0xFF00EBEF),
          const Color(0xFF00AEEF),
          const Color(0xFF1E86D6),
          const Color(0xFF176AC9),
          const Color(0xFF1E86D6),
        ][stats.indexOf(stat)];
        return _buildStatColumn(
          stat['number'].toString(),
          stat['label'],
          color,
        );
      }).toList(),
    );
  }

  Widget _buildStatColumn(String number, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 18,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          number,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSocialLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(social.length, (i) {
        return Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: socialColors[i],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            Text(social[i]['label']),
            const SizedBox(width: 8),
          ],
        );
      }),
    );
  }
}

// LINE CHART
class LineChartSample5 extends StatelessWidget {
  final List<int> values;
  final List<Color> colors;
  final Color indicatorStrokeColor;

  const LineChartSample5({
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
    final transparentColors = colors.map((c) => c.withOpacity(0.3)).toList();
    final stops = List.generate(colors.length, (i) => i / (colors.length - 1));

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: false),
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
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
        extraLinesData: ExtraLinesData(
          extraLinesOnTop: true,
          verticalLines: List.generate(spots.length, (i) {
            final t = i / (spots.length - 1);
            final color = _lerpGradient(colors, t).withOpacity(0.8);
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

  Color _lerpGradient(List<Color> colors, double t) {
    for (int i = 0; i < colors.length - 1; i++) {
      double start = i / (colors.length - 1);
      double end = (i + 1) / (colors.length - 1);
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
