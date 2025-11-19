import 'package:crm/controller/Clients/Client_more/RefferToController..dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferToAnotherAgent extends StatelessWidget {
  const ReferToAnotherAgent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ReferToAnotherAgentController(),
      permanent: false,
    );

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
                      'Refer to another Agent'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                CustomDropdownFormField<String>(
                  text: 'Job'.tr,
                  labelText: 'Job'.tr,

                  items: const [
                    DropdownMenuItem(value: 'low', child: Text('Low')),
                    DropdownMenuItem(value: 'medium', child: Text('Medium')),
                    DropdownMenuItem(value: 'high', child: Text('High')),
                  ],
                  onChanged: (val) => {},
                ),
                const SizedBox(height: 10),
                CustomDropdownFormField<String>(
                  text: 'Refer To'.tr,
                  labelText: 'Select Refer To'.tr,

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
                  text: 'Client Status'.tr,
                  labelText: 'Client Status'.tr,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    SizedBox(width: 10),
                    Text('Delete Records'.tr),
                  ],
                ),

                Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    SizedBox(width: 10),
                    Text('Same stage'.tr),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    SizedBox(width: 10),
                    Text('Duplicate and set as new'.tr),
                  ],
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
