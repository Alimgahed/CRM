import 'package:crm/constant/colors.dart';
import 'package:crm/gloable/Reusable_widget/fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, right: 8, left: 8.0, bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "المستخدمين".tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              UsersWidget(
                name: "احمد محمد علي".tr,
                job: "مدير مبيعات".tr,
                statues: "نشط".tr,
                color: Colors.green,
              ),
              const SizedBox(height: 8),
              UsersWidget(
                name: "أحمد علي".tr,
                job: "مطور".tr,
                statues: "نشط".tr,
                color: Color(0xFF4CAF50),
              ),
              const SizedBox(height: 8),
              UsersWidget(
                name: " مصطفي خالد علي".tr,
                job: "مهندس".tr,
                statues: "نشط".tr,
                color: Colors.green,
              ),
              const SizedBox(height: 12),
              UsersWidget(
                name: "احمد محمد علي".tr,
                job: "مطور".tr,
                statues: "غير نشط".tr,
                color: Colors.red,
              ),
              const SizedBox(height: 12),

               Center(
                child: Text(
                  "Show All".tr,
                  style: const TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    letterSpacing: -0.15,
                  ),
                ),
              ),
            ],
          ),
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.person, size: 30, color: appColor),
          ),
          const SizedBox(width: 10),

          // --- Text and Status ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  job,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                statues,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ),
          // --- More options icon ---
         GlobalPopupMenu(
  items: [
    PopupMenuItemModel(
      title: 'تعديل'.tr,
      icon: Icons.edit,
      iconColor: Colors.black54,
      onTap: () {
        Get.snackbar('Edit', 'Editing client...');
      },
    ),
    PopupMenuItemModel(
      title: 'حذف'.tr,
      icon: Icons.delete,
      iconColor: Colors.redAccent,
      onTap: () {
        Get.defaultDialog(
          title: 'تأكيد'.tr,
          middleText: 'هل تريد حذف هذا العميل؟'.tr,
          textConfirm: 'حذف'.tr,
          textCancel: 'إلغاء'.tr,
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
            Get.snackbar('تم'.tr, 'تم حذف العميل'.tr);
          },
        );
      },
    ),
    PopupMenuItemModel(
      title: 'مشاركة'.tr,
      icon: Icons.share,
      iconColor: Colors.blue,
      onTap: () {
        Get.snackbar('Share', 'Shared client info');
      },
    ),
  ],
),

        ],
      ),
    );
  }
}
