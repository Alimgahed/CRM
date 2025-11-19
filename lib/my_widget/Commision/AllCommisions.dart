import 'package:crm/constant/colors.dart';
import 'package:crm/my_widget/Property_widget/Gloable_widget.dart';
import 'package:flutter/material.dart';

class AllCommisionsWidget extends StatelessWidget {
  const AllCommisionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(12), // better spacing performance
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Row(
              children: const [
                Text("علي محمد احمد"),
                Spacer(),
                Icon(Icons.more_horiz, color: Colors.black),
              ],
            ),

            const SizedBox(height: 12),

            /// Email + Phone Row
            Row(
              children: [
                infoChip(
                  Icons.person_outline_outlined,
                  'Sales',
                  secondaryTextColor,
                ),
                const SizedBox(width: 10),
                infoChip(Icons.business_sharp, '12 مشروع', secondaryTextColor),
                const SizedBox(width: 10),
                infoChip(
                  Icons.monetization_on_outlined,
                  '٢٥٠٠٠٠٠ جنيه',
                  secondaryTextColor,
                ),
              ],
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
