import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Contact_actions/Cancel.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelScreen extends StatelessWidget {
  const CancelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CancelController(), tag: 'Cancel_controller');

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

                  // Active
                  activeTrackColor: appColor,
                  activeThumbColor: Colors.white,

                  // Inactive
                  inactiveTrackColor: Colors.white,
                  inactiveThumbColor: appColor,

                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                  // Border only when off
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

          CustomDropdownFormField<String>(
            items: ['Option 1', 'Option 2', 'Option 3']
                .map(
                  (option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ),
                )
                .toList(),
            text: 'Cancel Reason'.tr,
            labelText: 'Write Cancel Reason here'.tr,
          ),
          const SizedBox(height: 16),

          CustomTextFormField(
            controller: controller.commentController,
            text: 'Comment'.tr,
            labelText: 'Write your comment here'.tr,
          ),
          const SizedBox(height: 24),

          // Save button
          Center(
            child: CustomButton(text: "Save Action".tr, onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
