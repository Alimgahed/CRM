import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllDeveloperShimmerWidget extends StatelessWidget {
  const AllDeveloperShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseColor = isDark ? Colors.grey.shade800 : Colors.grey.shade300;
    final highlightColor = isDark ? Colors.grey.shade700 : Colors.grey.shade100;
    final containerColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final shadowColor = isDark ? Colors.black26 : Colors.grey.shade200;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company logo placeholder
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Company name placeholder
            Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Container(
                height: 20,
                width: double.infinity,
                color: baseColor,
              ),
            ),
            const SizedBox(height: 10),

            // Sales info placeholder
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(height: 20, width: 100, color: baseColor),
                ),
                const SizedBox(width: 10),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(height: 20, width: 60, color: baseColor),
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Accountant info placeholder
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(height: 20, width: 100, color: baseColor),
                ),
                const SizedBox(width: 10),
                Container(height: 20, width: 60, color: baseColor),
              ],
            ),
            const SizedBox(height: 10),

            // Buttons placeholder
            Row(
              children: [
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highlightColor,
                    child: Container(height: 45, color: baseColor),
                  ),
                ),
                const SizedBox(width: 10),
                Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    height: 45,
                    width: 45,
                    color: isDark ? Colors.red.shade900 : Colors.red.shade200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
