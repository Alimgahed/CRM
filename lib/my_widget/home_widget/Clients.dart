import 'package:crm/constant/colors.dart';
import 'package:crm/gloable/Reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clients extends StatelessWidget {
  const Clients({super.key});

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
                "Clients".tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              ClientsWidget(
                name: "شركة النور للتجارة".tr,
                location: "الرياض".tr,
                statues: "جديد".tr,
                color: appColor,
              ),
              const SizedBox(height: 8),
              ClientsWidget(
                name: "أحمد علي".tr,
                location: "جدة".tr,
                statues: "مفلق".tr,
                color: Color(0xFF4CAF50),
              ),
              const SizedBox(height: 8),
              ClientsWidget(
                name: "مؤسسة الخليج".tr,
                location: "الدمام".tr,
                statues: "جديد".tr,
                color: appColor,
              ),
              const SizedBox(height: 12),
              ClientsWidget(
                name: "احمد محمد علي".tr,
                location: "شقة في الرياض".tr,
                statues: "مهتم",
                color: const Color.fromARGB(255, 232, 210, 10),
              ),
              const SizedBox(height: 12),

              const Center(
                child: Text(
                  "عرض الجميع ",
                  style: TextStyle(
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

class ClientsWidget extends StatelessWidget {
  final String name;
  final String location;
  final String statues;
  final Color color;

  const ClientsWidget({
    super.key,
    required this.name,
    required this.location,
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
          const Icon(
            Icons.contact_emergency_outlined,
            size: 30,
            color: appColor,
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
                  location,
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
          // --- More options dropdown (Edit / Delete in Arabic) ---
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
