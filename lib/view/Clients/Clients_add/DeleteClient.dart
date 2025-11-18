import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Clients/Client_more/AddChanceController.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteClient extends StatelessWidget {
  const DeleteClient({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Addchancecontroller(), permanent: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                Row(
                  children: [
                    const Icon(Icons.delete_outline, color: warningColor),
                    const SizedBox(width: 8),
                    Text(
                      'Remove Client Data?'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade200,
                  child: Center(
                    child: const Icon(
                      Icons.warning_amber_outlined,
                      size: 30,
                      color: Color(0xFFB25E09),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Are you sure you have deleted this customer's data from the system?"
                      .tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 20),

                CustomButton(
                  text: "Save".tr,
                  onPressed: () {},
                  backgroundColor: warningColor,
                  bordercolor: warningColor,
                ),
              ],
            ),
          ),

          // Floating Close Button (reusable)
        ],
      ),
    );
  }
}
