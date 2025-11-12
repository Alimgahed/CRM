import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Clients/Clients_controller.dart';
import 'package:crm/gloable/Reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ==================== SEARCH BAR WIDGET ====================

// ==================== FILTER SECTION WIDGET ====================
class ClientsFilterSection extends StatelessWidget {
  const ClientsFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              FilterButton(index: 0, icon: Icons.now_widgets_outlined),
              const SizedBox(width: 8),
              FilterButton(index: 1, label: "All Clients".tr),
              const SizedBox(width: 8),
              FilterButton(index: 2, label: "My Clients".tr),
              const SizedBox(width: 8),
              FilterButton(index: 3, label: "New Clients".tr),
              const SizedBox(width: 8),
              FilterButton(index: 4, label: "Deferred Clients".tr),
              const SizedBox(width: 8),
              FilterButton(index: 5, label: "Follow up".tr),
              const SizedBox(width: 8),
              FilterButton(index: 6, label: "Rent".tr),
              const SizedBox(width: 8),
              FilterButton(index: 7, label: "Comment".tr),
              const SizedBox(width: 8),
              FilterButton(index: 8, label: "Reservation".tr),
              const SizedBox(width: 8),
              FilterButton(index: 9, label: "Interest".tr),
              const SizedBox(width: 8),
              FilterButton(index: 10, label: "Archive".tr),
              const SizedBox(width: 8),
              FilterButton(index: 11, label: "Meeting".tr),
              const SizedBox(width: 8),
              FilterButton(index: 12, label: "Follow after Meeting".tr),
              const SizedBox(width: 8),
              FilterButton(index: 13, label: "Meeting Schedule".tr),
              const SizedBox(width: 8),
              FilterButton(index: 14, label: "Sold".tr),
              const SizedBox(width: 8),
              FilterButton(index: 15, label: "New".tr),
              const SizedBox(width: 8),
              FilterButton(index: 16, label: "Cancel".tr),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final int index;
  final IconData? icon;
  final String? label;

  const FilterButton({super.key, required this.index, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientsController>();

    return Obx(() {
      final isSelected = controller.selectedFilter.value == index;

      return InkWell(
        onTap: () {
          controller.selectedFilter.value = index;

          if (controller.selectedFilter.value == 0) {
            Get.bottomSheet(
              FractionallySizedBox(
                heightFactor: 0.9,
                child: const allClientFiliter(),
              ),
              isScrollControlled: true, // Makes it full height if needed
              backgroundColor: Colors.transparent,
            );
          }
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? appColor : Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Center(
            child: icon != null
                ? Icon(
                    icon,
                    color: isSelected ? Colors.white : secondaryTextColor,
                    size: 20,
                  )
                : Text(
                    label!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : secondaryTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      height: 1,
                    ),
                  ),
          ),
        ),
      );
    });
  }
}

// ignore: camel_case_types
class allClientFiliter extends StatelessWidget {
  const allClientFiliter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.now_widgets_outlined),
                      const SizedBox(width: 8),
                      Text(
                        "Table of Contents".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  FilterButton(index: 1, label: "All Clients".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 2, label: "My Clients".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 3, label: "New Clients".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 4, label: "Deferred Clients".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 5, label: "Follow up".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 6, label: "Rent".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 7, label: "Comment".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 8, label: "Reservation".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 9, label: "Interest".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 10, label: "Archive".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 11, label: "Meeting".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 12, label: "Follow after Meeting".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 13, label: "Meeting Schedule".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 14, label: "Sold".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 15, label: "New".tr),
                  const SizedBox(height: 8),
                  FilterButton(index: 16, label: "Cancel".tr),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
