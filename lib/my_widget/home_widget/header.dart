
  import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Top colored section
        Container(
          color: appColor,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: _buildUserInfo(),
            ),
          ),
        ),
        
        // Search container positioned to overlap
        Positioned(
          left: 16,
          right: 16,
          bottom: -24,
          child: _buildSearchBar(),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 28,
          // Add user image here if available
          // backgroundImage: NetworkImage(controller.userImage),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Welcome".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "عبد الرحمن ذكي",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            // Handle notification tap
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
            size: 26,
          ),
          tooltip: 'Notifications',
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
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[600],
            size: 22,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        onChanged: (value) {
          // Handle search
        },
      ),
    );
  }
