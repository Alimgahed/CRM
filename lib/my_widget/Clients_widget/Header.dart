import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Clients/Clients_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsHeader extends StatelessWidget {
  const ClientsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: appColor,
      padding: const EdgeInsets.all(8.0),
      child: const Column(
        children: [
          SizedBox(height: 40),
          ClientsTitleRow(),
          SizedBox(height: 8),
          ClientsSearchBar(),
        ],
      ),
    );
  }
}
class ClientsTitleRow extends StatelessWidget {
  const ClientsTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Clients".tr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            // Add client action
          },
          icon: const Icon(Icons.add_box_rounded, color: Colors.white),
        ),
      ],
    );
  }
}
class ClientsSearchBar extends StatelessWidget {
  const ClientsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClientsController>();

    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.search, color: secondaryTextColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: "Search about client".tr,
                hintStyle: TextStyle(
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Icon(Icons.filter_list, color: secondaryTextColor, size: 20),
        ],
      ),
    );
  }
}