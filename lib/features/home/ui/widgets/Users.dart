import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/fields.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 8, left: 8, bottom: 0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? darkColor : containerColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.4 : 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "المستخدمين".tr,
              style: TextStyles.size16(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : primaryTextColor,
              ),
            ),
            const SizedBox(height: 12),

            const UsersWidget(
              name: "احمد محمد علي",
              job: "مدير مبيعات",
              statues: "نشط",
              color: successColor,
            ),
            const UsersWidget(
              name: "أحمد علي",
              job: "مطور",
              statues: "نشط",
              color: successColor,
            ),
            const UsersWidget(
              name: "مصطفي خالد علي",
              job: "مهندس",
              statues: "نشط",
              color: successColor,
            ),
            const UsersWidget(
              name: "احمد محمد علي",
              job: "مطور",
              statues: "غير نشط",
              color: warningColor,
            ),

            const SizedBox(height: 12),
            Center(
              child: Text(
                "Show All".tr,
                style: TextStyles.size14(
                  fontWeight: FontWeight.w500,
                  color: buttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsersWidget extends StatelessWidget {
  final String name;
  final String job;
  final String statues;
  final Color color;

  const UsersWidget({
    super.key,
    required this.name,
    required this.job,
    required this.statues,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark ? darkColor2 : fieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isDark ? darkFieldColor : radioColor,
            child: const Icon(Icons.person, size: 28, color: appColor),
          ),
          const SizedBox(width: 10),

          /// Name + job
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.size14(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : primaryTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  job.tr,
                  style: TextStyles.size12(color: secondaryTextColor),
                ),
              ],
            ),
          ),

          /// Status chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              statues.tr,
              style: TextStyles.size12(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),

          /// Menu
          GlobalPopupMenu(
            items: [
              PopupMenuItemModel(
                title: 'تعديل'.tr,
                icon: Icons.edit,
                iconColor: isDark ? secondaryTextColor : primaryTextColor,
                onTap: () => Get.snackbar('Edit', 'Editing user...'),
              ),
              PopupMenuItemModel(
                title: 'حذف'.tr,
                icon: Icons.delete,
                iconColor: warningColor,
                onTap: () {
                  Get.defaultDialog(
                    title: 'تأكيد'.tr,
                    middleText: 'هل تريد حذف هذا المستخدم؟'.tr,
                    textConfirm: 'حذف'.tr,
                    textCancel: 'إلغاء'.tr,
                    confirmTextColor: Colors.white,
                    backgroundColor: isDark ? darkColor : Colors.white,
                    titleStyle: TextStyles.size16(
                      color: isDark ? Colors.white : primaryTextColor,
                    ),
                    middleTextStyle: TextStyles.size14(
                      color: secondaryTextColor,
                    ),
                    onConfirm: () {
                      Get.back();
                      Get.snackbar('تم'.tr, 'تم حذف المستخدم'.tr);
                    },
                  );
                },
              ),
              PopupMenuItemModel(
                title: 'مشاركة'.tr,
                icon: Icons.share,
                iconColor: appColor,
                onTap: () => Get.snackbar('Share', 'Shared user info'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
