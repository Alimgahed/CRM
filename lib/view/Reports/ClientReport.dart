import 'package:crm/gloable/Reusable_widget/Charts.dart';
import 'package:crm/my_widget/home_widget/totals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clientreport extends StatelessWidget {
  const Clientreport({super.key});
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
                    child: LineChartWidget(
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
                    child: PieChartWidget(
                      ratio: .8,
                      centerText: 'من الفيسبوك',
                      data: social,
                      colors: [...socialColors],
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
              child: SizedBox(
                height: 200,
                child: BarChartWidget(
                  data: [
                    {"month": "Jan", "value": 120},
                    {"month": "Feb", "value": 150},
                    {"month": "Mar", "value": 90},
                  ],
                ),
              ),
            ),
          ],
        ),
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
