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
// lib/features/home/logic/cubit/dialog_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogCubit extends Cubit<int> {
  DialogCubit() : super(-1);

  void selectIndex(int index) => emit(index);

  void reset() => emit(-1);
}
// =======================
// Model: Dialog Item
// =======================

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
// Widget: Custom Bottom Sheet Dialog
// =======================

class CustomBottomSheetDialog extends StatelessWidget {
  final List<DialogItem> items;

  const CustomBottomSheetDialog({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => DialogCubit(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const FloatingCloseButton(),

            Container(
              margin: const EdgeInsets.only(top: 10), // space for FAB
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: items.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final item = entry.value;
                  return BlocBuilder<DialogCubit, int>(
                    builder: (context, selectedIndex) {
                      return Container(
                        height: 56,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isDark ? Colors.grey.shade700 : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          // Highlight selected item
                          color: selectedIndex == idx
                              ? appColor.withOpacity(0.05)
                              : null,
                        ),
                        child: InkWell(
                          onTap: () {
                            context.read<DialogCubit>().selectIndex(idx);
                            Navigator.pop(context); // Close this sheet
                            item.onTap();
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Icon(item.icon, color: appColor),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item.text,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CenterFAB extends StatelessWidget {
  const CenterFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) => CustomBottomSheetDialog(
            items: [
              DialogItem(
                icon: Icons.task_alt,
                text: 'Create New Task'.tr,
                onTap: () {
                  // Open AddTask as bottom sheet
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const AddTask(),
                  );
                },
              ),

              DialogItem(
                icon: Icons.person_add,
                text: 'Create New Client'.tr,
                onTap: () {
                  // Open AddClient as bottom sheet
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => FractionallySizedBox(
                      heightFactor: 0.8,
                      child: const AddClient(),
                    ),
                  );
                },
              ),
              DialogItem(
                icon: Icons.business_sharp,
                text: 'Add New Project'.tr,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        FileUploadScreen(text: "Upload Project Details".tr),
                  );
                },
              ),
              DialogItem(
                icon: Icons.apartment,
                text: 'Add New Property'.tr,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        FileUploadScreen(text: "Upload Property Details".tr),
                  );
                },
              ),
              DialogItem(
                icon: Icons.engineering,
                text: 'Add New Developer'.tr,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        FileUploadScreen(text: "Upload Developer Details".tr),
                  );
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
            width: 6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.4 : 0.1),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isSelected
        ? appColor
        : (isDark ? Colors.grey.shade400 : Colors.grey);

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
