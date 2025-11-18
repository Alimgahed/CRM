import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Contact_actions/Rent.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentScreen extends StatelessWidget {
  const RentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RentController(), tag: 'Rent_controller');

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
                  value: controller.attendance.value,
                  onChanged: controller.toggleAttendance,

                  // Active
                  activeTrackColor: appColor,
                  activeThumbColor: Colors.white,

                  // Inactive
                  inactiveTrackColor: Colors.white,
                  inactiveThumbColor: appColor,

                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                  // Border only when off
                  trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                    return controller.attendance.value
                        ? Colors.transparent
                        : appColor;
                  }),
                  trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
                    return controller.attendance.value ? 0 : 2;
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action Date field
          CustomTextFormField(
            controller: controller.actionDateController,
            text: 'Rent duration'.tr,
            labelText: 'Rent duration'.tr,
          ),
          const SizedBox(height: 16),

          // Comment field
          CustomTextFormField(
            controller: controller.commentController,
            text: 'Rent Cost'.tr,
            labelText: 'Write Rent Cost here'.tr,
          ),
          const SizedBox(height: 16),

          CustomTextFormField(
            controller: controller.commentController,
            text: 'Unit Code'.tr,
            labelText: 'Write Unit Code here'.tr,
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
