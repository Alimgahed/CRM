import 'package:crm/constant/colors.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:crm/my_widget/Property_widget/Gloable_widget.dart';
import 'package:crm/view/Units/UnitDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitsWidget extends StatelessWidget {
  const UnitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(Icons.business_sharp, size: 60),
                  ),
                ),

                const SizedBox(height: 10),

                // Title
                Text(
                  'وحدة A-305',
                  style: titleStyle.copyWith(color: secondaryTextColor),
                ),

                const SizedBox(height: 10),

                // Location row
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: secondaryTextColor,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'كمبوند مارفل بالمز – التجمع الخامس، القاهرة الجديدة',
                        style: smallStyle.copyWith(color: secondaryTextColor),
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
                      secondaryTextColor,
                    ),
                    const SizedBox(width: 10),
                    infoChip(
                      Icons.architecture_outlined,
                      '60م² - 120م²',
                      secondaryTextColor,
                    ),
                    const SizedBox(width: 10),
                    infoChip(
                      Icons.person_outlined,
                      'علي احمد ياسر',
                      secondaryTextColor,
                    ),
                  ],
                ),
                Center(
                  child: CustomButton(
                    height: 40,
                    text: 'عرض التفاصيل',
                    onPressed: () {
                      Get.to(() => UnitDetailsScreen());
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 20,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("معروض للبيع", style: smallStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
