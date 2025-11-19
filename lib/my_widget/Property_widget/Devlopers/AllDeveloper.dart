import 'package:crm/constant/colors.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:crm/my_widget/Property_widget/Gloable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Alldeveloper_widget extends StatelessWidget {
  const Alldeveloper_widget({super.key});

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
              child: const Center(
                child: Icon(Icons.engineering_outlined, size: 60),
              ),
            ),

            const SizedBox(height: 10),

            // Title
            Text(
              'طلعت مصطفى - Talaat Moustafa',
              style: titleStyle.copyWith(color: textColor),
            ),

            const SizedBox(height: 10),

            // Location row
            Row(
              children: [
                Icon(Icons.calendar_month_outlined, size: 15, color: textColor),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '١٢/١٠/٢٠٠٥ تاريخ الانشاء',
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
                infoChip(Icons.location_city_outlined, '١٢ مشروع', textColor),
                const SizedBox(width: 10),
                infoChip(Icons.person_outline, 'محمد عبدالعزيز', textColor),
                const SizedBox(width: 10),
                infoChip(Icons.call_outlined, '0123456789', textColor),
              ],
            ),
            Center(
              child: CustomButton(
                height: 40,
                text: 'Edit'.tr,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
