import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:crm/Core/theming/colors.dart';

// ============= Main Shimmer Loading Screen =============
class ClientsListShimmer extends StatelessWidget {
  final int itemCount;

  const ClientsListShimmer({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ClientCardShimmer();
      },
    );
  }
}

// ============= Individual Card Shimmer =============
class ClientCardShimmer extends StatelessWidget {
  const ClientCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? darkFieldColor : Colors.grey[300]!;
    final highlightColor = isDark ? darkColor2 : Colors.grey[100]!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : Colors.white,
        border: Border.all(color: isDark ? Colors.white : divColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row (Name + More Icon)
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Phone Row
            Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 120,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Date Row
            Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 100,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Tags Row (Project, Source, Status)
            Row(
              children: [
                // Project Tag
                Container(
                  height: 28,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),

                // Source Tag
                Container(
                  height: 28,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Spacer(),

                // Status Tag
                Container(
                  height: 28,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Buttons Row
            Row(
              children: [
                // Details Button
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Call Button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 10),

                // WhatsApp Button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
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

// ============= Alternative: Simple Shimmer (Lighter Version) =============
class SimpleClientCardShimmer extends StatelessWidget {
  const SimpleClientCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : Colors.white,
        border: Border.all(color: isDark ? Colors.white : divColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
        baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShimmerBox(width: double.infinity, height: 16),
            const SizedBox(height: 12),
            _buildShimmerBox(width: 150, height: 14),
            const SizedBox(height: 8),
            _buildShimmerBox(width: 120, height: 14),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildShimmerBox(width: 80, height: 28),
                const SizedBox(width: 10),
                _buildShimmerBox(width: 90, height: 28),
                const Spacer(),
                _buildShimmerBox(width: 70, height: 28),
              ],
            ),
            const SizedBox(height: 12),
            _buildShimmerBox(width: double.infinity, height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerBox({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
