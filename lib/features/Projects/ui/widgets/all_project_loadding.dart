import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllProjectShimmer extends StatelessWidget {
  const AllProjectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? darkColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Shimmer.fromColors(
              baseColor: isDark ? darkFieldColor : Colors.grey.shade300,
              highlightColor: isDark ? darkFieldColor : Colors.grey.shade100,
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  color: isDark ? darkFieldColor : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // TITLE
            Shimmer.fromColors(
              baseColor: isDark ? darkFieldColor : Colors.grey.shade300,
              highlightColor: isDark ? darkFieldColor : Colors.grey.shade100,
              child: Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? darkFieldColor : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // DESCRIPTION/LOCATION
            Shimmer.fromColors(
              baseColor: isDark ? darkFieldColor : Colors.grey.shade300,
              highlightColor: isDark ? darkFieldColor : Colors.grey.shade100,
              child: Container(
                height: 15,
                width: 150,
                decoration: BoxDecoration(
                  color: isDark ? darkFieldColor : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // PRICE + AREA + COMPANY CHIPS
            Row(
              children: List.generate(
                3,
                (_) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Shimmer.fromColors(
                    baseColor: isDark ? darkFieldColor : Colors.grey.shade300,
                    highlightColor: isDark
                        ? darkFieldColor
                        : Colors.grey.shade100,
                    child: Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                        color: isDark ? darkFieldColor : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
