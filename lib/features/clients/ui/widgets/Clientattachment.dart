import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crm/Core/theming/colors.dart';

class ClientAttachment extends StatelessWidget {
  const ClientAttachment({super.key});

  static const List<String> _attachments = [
    "عرض سعر عميل - امكان.pdf",
    "عقد اتفاق - عميل امكان.pdf",
    "فاتورة عميل - امكان.pdf",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _attachments.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) =>
            AttachmentTile(label: _attachments[index]),
      ),
    );
  }
}

class AttachmentTile extends StatelessWidget {
  final String label;

  const AttachmentTile({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.picture_as_pdf_outlined,
            size: 30,
            color: secondaryTextColor,
          ),
          const SizedBox(width: 10),

          /// ===== File Info =====
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                const Text(
                  "تم رفع الملف بنجاح",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    height: 1.5,
                    color: appColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          /// ===== Action Buttons =====
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.download, color: appColor),
            tooltip: "Download",
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            tooltip: "Delete",
          ),
        ],
      ),
    );
  }
}
  /// Dummy methods for actions (you can replace with your logic)
 
