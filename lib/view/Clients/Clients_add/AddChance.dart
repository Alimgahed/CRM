import 'package:crm/controller/Clients/Client_more/AddChanceController.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addchance extends StatelessWidget {
  const Addchance({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const Icon(Icons.add_box_outlined),
                    const SizedBox(width: 8),
                    Text(
                      'Add Chance'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // --- Form Fields ---
                CustomTextFormField(
                  text: 'Expected Closure Date'.tr,
                  labelText: 'Enter Expected Closure Date Here'.tr,
                  controller: controller.expecteddClosureDateController,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Expacted Price'.tr,
                  labelText: 'Enter Expacted Price  Here'.tr,
                  controller: controller.expectedpriceController,
                ),
                const SizedBox(height: 20),

                CustomButton(text: "Save".tr, onPressed: () {}),
              ],
            ),
          ),

          // Floating Close Button (reusable)
        ],
      ),
    );
  }
}
