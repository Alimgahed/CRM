import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/actions/ui/screens/actions/add_client.dart';
import 'package:crm/features/actions/ui/screens/actions/add_project.dart';
import 'package:crm/features/tasks/ui/screens/add_task.dart';
import 'package:crm/features/users/ui/screens/add_user.dart';
import 'package:crm/features/home/data/model/model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogCubit extends Cubit<int> {
  DialogCubit() : super(-1);

  void selectIndex(int index) => emit(index);

  void reset() => emit(-1);
}

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
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? darkColor : Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  return BlocBuilder<DialogCubit, int>(
                    builder: (context, selectedIndex) {
                      final isSelected = selectedIndex == index;
                      return InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          context.read<DialogCubit>().selectIndex(index);
                          Navigator.pop(context);
                          item.onTap();
                        },
                        child: Container(
                          height: 56,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? appColor.withOpacity(0.08)
                                : (isDark ? darkColor2 : containerColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(item.icon, color: appColor),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  item.text.tr,
                                  style: TextStyles.size14(
                                    color: isDark
                                        ? Colors.white
                                        : primaryTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// Center FAB
/// =======================
class CenterFAB extends StatelessWidget {
  const CenterFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => CustomBottomSheetDialog(
            items: [
              DialogItem(
                icon: Icons.task_alt,
                text: appLocalizations.addTask,
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => FractionallySizedBox(
                    heightFactor: 0.8,
                    child: const AddTask(),
                  ),
                ),
              ),
              DialogItem(
                icon: Icons.person_add,
                text: appLocalizations.createNewClient,
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => FractionallySizedBox(
                    heightFactor: 0.8,
                    child: const AddClient(),
                  ),
                ),
              ),
              DialogItem(
                icon: Icons.person_add,
                text: appLocalizations.addNewUser,
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => FractionallySizedBox(
                    heightFactor: 0.8,
                    child: const AddUser(),
                  ),
                ),
              ),
              DialogItem(
                icon: Icons.business,
                text: appLocalizations.addProject,
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) =>
                      FileUploadScreen(text: "Upload Project Details".tr),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isDark ? darkColor2 : Colors.white,
            width: 6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.4 : 0.1),
              blurRadius: 8,
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 28,
          backgroundColor: appColor,
          child: Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}

/// =======================
/// Bottom Navigation Item
/// =======================
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
        : (isDark ? secondaryTextColor : Colors.grey);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(
              label.tr,
              style: TextStyles.size12(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
