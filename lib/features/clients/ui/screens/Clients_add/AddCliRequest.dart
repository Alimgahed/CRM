import 'package:crm/features/clients/logic/Client_more/AddChanceController.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addclirequest extends StatelessWidget {
  const Addclirequest({super.key});

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
                      'Add Cli Request'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                CustomDropdownFormField<String>(
                  text: 'Project Name'.tr,
                  labelText: 'Select Project Name'.tr,

                  items: const [
                    DropdownMenuItem(value: 'low', child: Text('Low')),
                    DropdownMenuItem(value: 'medium', child: Text('Medium')),
                    DropdownMenuItem(value: 'high', child: Text('High')),
                  ],
                  onChanged: (val) => {},
                ),
                const SizedBox(height: 10),
                CustomDropdownFormField<String>(
                  text: 'Cli Type'.tr,
                  labelText: 'Select Cli Type'.tr,

                  items: const [
                    DropdownMenuItem(value: 'low', child: Text('Low')),
                    DropdownMenuItem(value: 'medium', child: Text('Medium')),
                    DropdownMenuItem(value: 'high', child: Text('High')),
                  ],
                  onChanged: (val) => {},
                ),

                CustomTextFormField(
                  text: 'To'.tr,
                  labelText: "Write the recipient's name".tr,
                  controller: controller.expecteddClosureDateController,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'CLI Request'.tr,
                  labelText: 'Enter CLI Request Here'.tr,
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
