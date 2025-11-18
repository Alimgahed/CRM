import 'package:crm/constant/colors.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:crm/view/Projects/ProjectDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllprojectWidget extends StatelessWidget {
  const AllprojectWidget({super.key});
  static const TextStyle _titleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
    letterSpacing: -1,
  );

  static const TextStyle _smallStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 1.5,
  );

  // Reusable icon + text widget
  Widget _infoChip(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 5),
          Text(text, style: _smallStyle.copyWith(color: color)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = secondaryTextColor;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Icon(Icons.business_sharp, size: 60)),
            ),

            const SizedBox(height: 10),

            // Title
            Text(
              'مارفل بالمز - Marvel Palms',
              style: _titleStyle.copyWith(color: textColor),
            ),

            const SizedBox(height: 10),

            // Location row
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 15, color: textColor),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'كمبوند مارفل بالمز – التجمع الخامس، القاهرة الجديدة',
                    style: _smallStyle.copyWith(color: textColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Info chips
            Row(
              children: [
                _infoChip(
                  Icons.monetization_on_outlined,
                  '1.2 - 6.3 مليون',
                  textColor,
                ),
                const SizedBox(width: 10),
                _infoChip(
                  Icons.architecture_outlined,
                  '60م² - 120م²',
                  textColor,
                ),
                const SizedBox(width: 10),
                _infoChip(Icons.business, 'أمكان', textColor),
              ],
            ),
            Center(
              child: CustomButton(
                height: 40,
                text: 'عرض التفاصيل',
                onPressed: () {
                  Get.to(() => ProjectDetailsScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
