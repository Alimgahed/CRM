import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesPerformanceStages extends StatelessWidget {
  const SalesPerformanceStages({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 0.0, right: 8, left: 8.0, bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sales Performance Stages".tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Salesperformance(
                title: "عملاء تم التواصل معهم".tr,
                amount: "40",
                ratio: 0.15,
                color: const Color(0xFFDB5837),
              ),
              const SizedBox(height: 12),
              Salesperformance(
                title: "عملاء تم تحديد اجتماع معهم".tr,
                amount: "18",
                ratio: 0.10,
                color: Colors.green,
              ),
              const SizedBox(height: 12),
              Salesperformance(
                title: "عملاء ارسل اليهم عروض".tr,
                amount: "40",
                ratio: 0.15,
                color: const Color(0xFFF5B040),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Salesperformance(
                  title: "Pending Deals".tr,
                  amount: "40",
                  ratio: 0.15,
                  color: const Color(0xFF2D384C),
                ),
              ),
              Center(
                child: Text(
                  "View Details".tr,
                  style: const TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    letterSpacing: -0.15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Salesperformance extends StatelessWidget {
  final String title;
  final String amount;
  final double ratio; // e.g. 0.75 for 75%
  final Color color;

  const Salesperformance({
    super.key,
    required this.title,
    required this.amount,
    required this.ratio,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final progressValue = ratio.abs().clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              amount,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.grey.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    '${(ratio.abs() * 100).toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.grey[400] : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // --- Progress Bar ---
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progressValue,
            minHeight: 20,
            backgroundColor: isDark
                ? Colors.grey.shade800
                : Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
