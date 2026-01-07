import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildHeader(BuildContext context, String userName) {
  return Column(
    children: [
      _buildUserInfo(userName),
      const SizedBox(height: 16),
      _buildSearchBar(),
    ],
  );
}

Widget _buildUserInfo(String userName) {
  return Row(
    children: [
      const CircleAvatar(backgroundColor: Colors.white, radius: 28),
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30),
          Text(
            "Welcome".tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const Spacer(),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: 26,
        ),
      ),
    ],
  );
}

Widget _buildSearchBar() {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Search".tr,
        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        border: InputBorder.none,
      ),
    ),
  );
}
