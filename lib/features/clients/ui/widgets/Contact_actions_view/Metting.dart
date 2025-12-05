import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/clients/logic/Contact_actions/Mettinng.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MettingController(), tag: 'meeting_controller');

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Answered Switch
          Row(
            children: [
              Text(
                "Attendance".tr,
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
          CustomDropdownFormField(
            text: 'Meeting Type'.tr,
            labelText: 'Meeting Type'.tr,
            items: [
              DropdownMenuItem(value: 0, child: Text("Online".tr)),
              DropdownMenuItem(value: 1, child: Text("Offline".tr)),
              DropdownMenuItem(value: 2, child: Text("Zoom".tr)),
            ],
          ),
          const SizedBox(height: 16),

          CustomTextFormField(
            controller: controller.actionDateController,
            text: 'Meeting location'.tr,
            labelText: 'Meeting location'.tr,
          ),
          const SizedBox(height: 10),

          // Comment field
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
