// =======================
// Model: Dialog Item
// =======================
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/actions/ui/screens/add_client.dart';
import 'package:crm/features/actions/ui/screens/add_project.dart';
import 'package:crm/features/actions/ui/screens/add_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DialogItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });
}

// =======================
// Controller: Dialog Selection
// =======================
class DialogController extends GetxController {
  var selectedIndex = (-1).obs;

  void selectIndex(int index) => selectedIndex.value = index;
}

// =======================
// Widget: Custom Bottom Sheet Dialog
// =======================

class CustomBottomSheetDialog extends StatelessWidget {
  final List<DialogItem> items;

  const CustomBottomSheetDialog({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DialogController(), permanent: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          // Bottom Sheet Container
          Container(
            margin: const EdgeInsets.only(top: 10), // space for FAB
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: items.asMap().entries.map((entry) {
                final idx = entry.key;
                final item = entry.value;
                return Container(
                  height: 56,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.selectIndex(idx);
                      Get.back(); // Close this sheet
                      item.onTap();
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(item.icon, color: appColor),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item.text,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Floating Close Button
        ],
      ),
    );
  }
}

class CenterFAB extends StatelessWidget {
  const CenterFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          CustomBottomSheetDialog(
            items: [
              DialogItem(
                icon: Icons.task_alt,
                text: 'Create New Task'.tr,
                onTap: () {
                  // Open AddTask as bottom sheet
                  Get.bottomSheet(
                    const AddTask(),
                    isScrollControlled: true, // Makes it full height if needed
                    backgroundColor: Colors.transparent,
                  );
                },
              ),

              DialogItem(
                icon: Icons.person_add, // New client
                text: 'Create New Client'.tr,
                onTap: () {
                  // Open AddClient as bottom sheet
                  Get.bottomSheet(
                    FractionallySizedBox(
                      heightFactor: 0.8, // 👈 controls height (80% of screen)
                      child: const AddClient(),
                    ),

                    isScrollControlled: true, // Makes it full height if needed
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
              DialogItem(
                icon: Icons.business_sharp, // Project
                text: 'Add New Project'.tr,
                onTap: () {
                  Get.bottomSheet(
                    FileUploadScreen(text: "Upload Project Details".tr),
                    isScrollControlled: true, // Makes it full height if needed
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
              DialogItem(
                icon: Icons.apartment, // Property
                text: 'Add New Property'.tr,
                onTap: () {
                  Get.bottomSheet(
                    FileUploadScreen(text: "Upload Property Details".tr),
                    isScrollControlled: true, // Makes it full height if needed
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
              DialogItem(
                icon: Icons.engineering, // Developer
                text: 'Add New Developer'.tr,
                onTap: () {
                  Get.bottomSheet(
                    FileUploadScreen(text: "Upload Developer Details".tr),
                    isScrollControlled: true, // Makes it full height if needed
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 28,
          backgroundColor: appColor,
          child: Icon(Icons.add_box_rounded, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}

// Example print callbacks

// =======================
// Bottom Navigation Item
// =======================
class BottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? appColor : Colors.grey;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
