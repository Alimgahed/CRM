import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/clients/logic/Contact_actions/Call.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.put without permanent flag - will be cleaned up when deleted
    // Use fenix to automatically recreate if accessed after deletion
    final controller = Get.put(
      CallController(),
      tag: 'call_controller',
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Answered Switch
          Row(
            children: [
              Text(
                "Answered".tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 10),
              Obx(
                () => Switch(
                  value: controller.answered.value,
                  onChanged: controller.toggleAnswer,
                  activeTrackColor: appColor,
                  activeThumbColor: Colors.white,
                  inactiveTrackColor: Colors.white,
                  inactiveThumbColor: appColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                    return controller.answered.value
                        ? Colors.transparent
                        : appColor;
                  }),
                  trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
                    return controller.answered.value ? 0 : 2;
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action Date field
          CustomTextFormField(
            controller: controller.actionDateController,
            text: 'Action Date'.tr,
            labelText: 'Select action date'.tr,
          ),
          const SizedBox(height: 16),

          // Comment field
          CustomTextFormField(
            controller: controller.commentController,
            text: 'Comment'.tr,
            labelText: 'Write your comment here'.tr,
          ),
          const SizedBox(height: 24),

          // Save button
          Center(
            child: CustomButton(
              text: "Save Action".tr,
              onPressed:(){},
            ),
          ),
        ],
      ),
    );
  }
}