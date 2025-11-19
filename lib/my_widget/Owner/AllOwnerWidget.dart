import 'package:crm/constant/Icons.dart';
import 'package:crm/constant/colors.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:crm/my_widget/Property_widget/Gloable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Allownerwidget extends StatelessWidget {
  const Allownerwidget({super.key});

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
                  Icons.email_outlined,
                  'ali@example.com',
                  secondaryTextColor,
                ),
                const SizedBox(width: 10),
                infoChip(
                  Icons.phone_outlined,
                  '01012345678',
                  secondaryTextColor,
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// Buttons Row
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 40,
                    text: "Show Details".tr,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 10),
                ActionButton(icon: Icons.call_outlined, onTap: () {}),
                const SizedBox(width: 10),
                ActionButton(icon: MyFlutterApp.whatsapp, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
