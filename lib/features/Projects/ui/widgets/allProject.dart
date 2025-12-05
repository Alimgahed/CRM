import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/Projects/ui/screens/ProjectDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllprojectWidget extends StatelessWidget {
  const AllprojectWidget({super.key});


  // Reusable icon + text widget
 

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
              style: titleStyle.copyWith(color: textColor),
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
                    style: smallStyle.copyWith(color: textColor),
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
                infoChip(
                  Icons.monetization_on_outlined,
                  '1.2 - 6.3 مليون',
                  textColor,
                ),
                const SizedBox(width: 10),
                infoChip(
                  Icons.architecture_outlined,
                  '60م² - 120م²',
                  textColor,
                ),
                const SizedBox(width: 10),
                infoChip(Icons.business, 'أمكان', textColor),
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
