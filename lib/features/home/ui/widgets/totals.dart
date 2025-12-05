import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TotalsSection extends StatelessWidget {
  const TotalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, right: 8, left: 8.0, bottom: 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TotalCard(
                  title: "New Deals".tr,
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
                  title: "total sales".tr,
                  amount: "\$25,000",
                  ratio: 0.12,
                  date: "منذ الشهر السابق",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TotalCard extends StatelessWidget {
  final String title;
  final String amount;
  final double ratio;
  final String date;

  const TotalCard({
    super.key,
    required this.title,
    required this.amount,
    required this.ratio,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = ratio >= 0;
    final percentageColor = isPositive ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: percentageColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            // Make the container take only the size of its child
            constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // <-- Row only takes as much space as its children
              mainAxisAlignment: MainAxisAlignment
                  .center, // <-- center the children horizontally
              crossAxisAlignment:
                  CrossAxisAlignment.center, // <-- center vertically
              children: [
                Text(
                  '${(ratio.abs() * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: percentageColor,
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 12,
                  color: percentageColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Text(
            amount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            date,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontFamily: 'Alexandria',
              height: 1.5,
              letterSpacing: -0.15,
              color: Color(0xFF60707D),
            ),
          ),
        ],
      ),
    );
  }
}
