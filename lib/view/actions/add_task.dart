import 'package:crm/controller/actions/add_task.dart';
import 'package:crm/gloable/Reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final AddTaskController controller = Get.put(
      AddTaskController(),
      permanent: false, // ensures controller is removed when not used
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32),
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.task_alt),
                    const SizedBox(width: 8),
                    Text(
                      'Create New Task'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 8),
                    Text(
                      "Creation date".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(DateTime.now().toString().split(' ')[0]),
                  ],
                ),

                const SizedBox(height: 16),

                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Task Priority'.tr,
                    labelText: 'Select Priority'.tr,
                    value: controller.taskPriority.value,
                    items: [
                      DropdownMenuItem(value: 'low', child: Text('Low'.tr)),
                      DropdownMenuItem(
                        value: 'medium',
                        child: Text('Medium'.tr),
                      ),
                      DropdownMenuItem(value: 'high', child: Text('High'.tr)),
                    ],
                    onChanged: (val) {
                      controller.taskPriority.value = val;
                    },
                  ),
                ),

                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Assigned to'.tr,
                  labelText: 'Assigned to'.tr,
                  controller: controller.assignedToController,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Expiration Date'.tr,
                  labelText: 'Write Expiration Date'.tr,
                  controller: controller.expirationDateController,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Task Description'.tr,
                  labelText: 'Write Task Description'.tr,
                  controller: controller.taskDescriptionController,
                ),
                const SizedBox(height: 16),

                CustomButton(
                  text: "Save".tr,
                  onPressed: () {
                    controller.saveTask();
                  },
                ),
              ],
            ),
          ),
        ),

        const FloatingCloseButton(),
      ],
    );
  }
}
