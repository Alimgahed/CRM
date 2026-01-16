import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/clients/logic/all_clients/Clients_search.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/actions/ui/screens/actions/add_client.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ClientsHeader extends StatelessWidget {
  const ClientsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      color: isDark ? darkFieldColor : appColor,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const ClientsTitleRow(),
          const SizedBox(height: 8),
          SearchBarWidget(
            prefixIcon: Icons.search,
            suffixIcon: Icons.filter_list,
            onSuffixTap: () {
              Get.bottomSheet(
                const FractionallySizedBox(
                  heightFactor: 0.9,
                  child: ResultFilter(),
                ),
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
              );
            },
          ),
        ],
      ),
    );
  }
}

class ClientsTitleRow extends StatelessWidget {
  const ClientsTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return Row(
      children: [
        Text(
          appLocalizations.clients,
          style: TextStyle(
            color: isDark ? appColor : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.bottomSheet(
              const FractionallySizedBox(
                heightFactor: 0.88,
                child: AddClient(),
              ),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
            );
          },
          icon: Icon(
            Icons.add_box_rounded,
            color: isDark ? appColor : Colors.white,
          ),
        ),
      ],
    );
  }
}

class ResultFilter extends StatelessWidget {
  const ResultFilter({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller once
    final controller = Get.put(ResultFilterController());

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
                /// Header
                Row(
                  children: [
                    const Icon(Icons.filter_list, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Filter Results'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Start & End Date
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        text: 'Start date'.tr,
                        labelText: 'Enter Start Date Here'.tr,
                        controller: controller.startDateController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        text: 'End date'.tr,
                        labelText: 'Enter End Date Here'.tr,
                        controller: controller.endDateController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// Status Dropdown
                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Status'.tr,
                    labelText: 'All Statuses'.tr,
                    value: controller.status.value.isEmpty
                        ? null
                        : controller.status.value,
                    items: const [
                      DropdownMenuItem(value: 'low', child: Text('Low')),
                      DropdownMenuItem(value: 'medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'high', child: Text('High')),
                    ],
                    onChanged: (val) => controller.status.value = val ?? '',
                  ),
                ),
                const SizedBox(height: 10),

                /// Source Dropdown
                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Source'.tr,
                    labelText: 'All Sources'.tr,
                    value: controller.source.value.isEmpty
                        ? null
                        : controller.source.value,
                    items: const [
                      DropdownMenuItem(value: 'social', child: Text('Social')),
                      DropdownMenuItem(
                        value: 'referral',
                        child: Text('Referral'),
                      ),
                      DropdownMenuItem(value: 'direct', child: Text('Direct')),
                    ],
                    onChanged: (val) => controller.source.value = val ?? '',
                  ),
                ),
                const SizedBox(height: 10),

                /// Project Dropdown
                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Project'.tr,
                    labelText: 'All Projects'.tr,
                    value: controller.project.value.isEmpty
                        ? null
                        : controller.project.value,
                    items: const [
                      DropdownMenuItem(
                        value: 'project1',
                        child: Text('Project 1'),
                      ),
                      DropdownMenuItem(
                        value: 'project2',
                        child: Text('Project 2'),
                      ),
                      DropdownMenuItem(
                        value: 'project3',
                        child: Text('Project 3'),
                      ),
                    ],
                    onChanged: (val) => controller.project.value = val ?? '',
                  ),
                ),
                const SizedBox(height: 10),

                /// Developer Dropdown
                Obx(
                  () => CustomDropdownFormField<String>(
                    text: 'Developer'.tr,
                    labelText: 'All Developers'.tr,
                    value: controller.developer.value.isEmpty
                        ? null
                        : controller.developer.value,
                    items: const [
                      DropdownMenuItem(
                        value: 'dev1',
                        child: Text('Developer 1'),
                      ),
                      DropdownMenuItem(
                        value: 'dev2',
                        child: Text('Developer 2'),
                      ),
                      DropdownMenuItem(
                        value: 'dev3',
                        child: Text('Developer 3'),
                      ),
                    ],
                    onChanged: (val) => controller.developer.value = val ?? '',
                  ),
                ),

                const SizedBox(height: 20),

                /// Buttons
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Confirm".tr,
                        onPressed: controller.applyFilters,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomButton(
                        backgroundColor: Colors.white,
                        textColor: appColor,
                        text: "Reset".tr,
                        onPressed: controller.resetFilters,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
