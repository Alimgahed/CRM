import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          InfoRowText(label: 'Status'.tr, value: 'New'.tr),
          const SizedBox(height: 10),
          InfoRowText(label: 'Project Name'.tr, value: 'امكان'.tr),
          const SizedBox(height: 10),
          InfoRowText(label: 'Job'.tr, value: 'مهندس'.tr),
          const SizedBox(height: 10),
          InfoRowText(label: "E-Mail".tr, value: 'ali@yahoo.com'.tr),
          const SizedBox(height: 10),
          InfoRowText(label: 'Channel'.tr, value: 'فيسبوك'.tr),
          const SizedBox(height: 10),
          InfoRowText(
            label: 'اسم مندوب المبيعات'.tr,
            value: 'احمد محمد علي'.tr,
          ),
          const SizedBox(height: 10),
          InfoRowText(label: 'Channel'.tr, value: 'فيسبوك'.tr),
          const SizedBox(height: 10),
          InfoRowText(
            label: "Creation date".tr,
            value: "10 / 16 / 25, 2:34 PM".tr,
          ),
          const SizedBox(height: 10),
          InfoRowText(label: 'Budget'.tr, value: "5,000,000 جنيه مصري".tr),
        ],
      ),
    );
  }
}

class InfoRowText extends StatelessWidget {
  final String label;
  final String value;

  const InfoRowText({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Label
        Expanded(
          child: Text(
            label.tr,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: secondaryTextColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // Value
        Expanded(
          child: Text(
            value.tr,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
