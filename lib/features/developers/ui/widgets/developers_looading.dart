import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class AllDeveloperShimmerWidget extends StatelessWidget {
  const AllDeveloperShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey.shade300;
    final highlightColor = Colors.grey.shade100;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
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
                  child: Container(height: 45, width: 45, color: Colors.red.shade200),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
