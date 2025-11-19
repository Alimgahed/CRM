import 'package:crm/controller/actions/add_client.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:crm/gloable/Reusable_widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddClient extends StatelessWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddClientController(), permanent: false);

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
                    const Icon(Icons.person_add),
                    const SizedBox(width: 8),
                    Text(
                      'Create New Client'.tr,
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
                  text: 'Full Name'.tr,
                  labelText: 'Enter Client Name Here'.tr,
                  controller: controller.clientNameController,
                ),
                const SizedBox(height: 10),

                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Project Name'.tr,
                    labelText: 'Select Project Name'.tr,
                    value: controller.taskPriority.value.isEmpty
                        ? null
                        : controller.taskPriority.value,
                    items: const [
                      DropdownMenuItem(value: 'low', child: Text('Low')),
                      DropdownMenuItem(value: 'medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'high', child: Text('High')),
                    ],
                    onChanged: (val) =>
                        controller.taskPriority.value = val ?? '',
                  ),
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Phone'.tr,
                  labelText: 'Enter Phone Number'.tr,
                  controller: controller.assignedToController,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Other Phone'.tr,
                  labelText: 'Write Other Phone Number'.tr,
                  controller: controller.expirationDateController,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'Job'.tr,
                  labelText: 'Write Job'.tr,
                  controller: controller.taskDescriptionController,
                ),
                const SizedBox(height: 10),

                CustomTextFormField(
                  text: 'E-Mail'.tr,
                  labelText: 'Write E-Mail'.tr,
                  controller: controller.emailController,
                ),
                const SizedBox(height: 10),

                // Channel Dropdown
                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Channel'.tr,
                    labelText: 'Select Channel'.tr,
                    value: controller.channel.value.isEmpty
                        ? null
                        : controller.channel.value,
                    items: const [
                      DropdownMenuItem(
                        value: 'social',
                        child: Text('Social Media'),
                      ),
                      DropdownMenuItem(
                        value: 'referral',
                        child: Text('Referral'),
                      ),
                    ],
                    onChanged: (val) => controller.channel.value = val ?? '',
                  ),
                ),
                const SizedBox(height: 10),

                // Preferred Contact
                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Preferred method of contact'.tr,
                    labelText: 'Select Preferred method of contact'.tr,
                    value: controller.preferredMethod.value.isEmpty
                        ? null
                        : controller.preferredMethod.value,
                    items: const [
                      DropdownMenuItem(value: 'email', child: Text('E-Mail')),
                      DropdownMenuItem(value: 'phone', child: Text('Phone')),
                    ],
                    onChanged: (val) =>
                        controller.preferredMethod.value = val ?? '',
                  ),
                ),
                const SizedBox(height: 10),

                // Client Status
                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Client Status'.tr,
                    labelText: 'Select Client Status'.tr,
                    value: controller.clientStatus.value.isEmpty
                        ? null
                        : controller.clientStatus.value,
                    items: const [
                      DropdownMenuItem(value: 'active', child: Text('Active')),
                      DropdownMenuItem(
                        value: 'inactive',
                        child: Text('Inactive'),
                      ),
                    ],
                    onChanged: (val) =>
                        controller.clientStatus.value = val ?? '',
                  ),
                ),

                const SizedBox(height: 20),

                CustomButton(text: "Save".tr, onPressed: controller.saveTask),
              ],
            ),
          ),

          // Floating Close Button (reusable)
        ],
      ),
    );
  }
}
