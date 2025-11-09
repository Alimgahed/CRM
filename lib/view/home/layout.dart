// ignore_for_file: must_be_immutable

import 'package:crm/constant/colors.dart';
import 'package:crm/controller/layout.dart/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      init: LayoutController(),
      builder: (controller) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildCenterFloatingButton(controller),
          bottomNavigationBar: _buildBottomNavigationBar(controller),
          body: controller.screens[controller.currentIndex],
        );
      },
    );
  }

  Widget _buildCenterFloatingButton(LayoutController controller) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: (const Color.fromARGB(255, 199, 230, 255)),
          width: 6,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: appColor,
        child: IconButton(
          onPressed: () {
            // Add your action here
          },
          icon: const Icon(
            Icons.add_box_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(LayoutController controller) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 4,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side icons
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    controller,
                    Icons.home_outlined,
                    'Home'.tr,
                    0,
                  ),
                  _buildNavItem(
                    controller,
                    Icons.people_outline,
                    'Clients'.tr,
                    1,
                  ),
                ],
              ),
            ),
            
            // Center spacer for FAB
            const SizedBox(width: 80),
            
            // Right side icons
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    controller,
                    Icons.calendar_today_outlined,
                    'Calendar'.tr,
                    2,
                  ),
                  _buildNavItem(
                    controller,
                    Icons.more_horiz_outlined,
                    'More'.tr,
                    3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    LayoutController controller,
    IconData icon,
    String label,
    int index,
  ) {
    final isSelected = controller.currentIndex == index;
    final color = isSelected ? appColor : Colors.grey;

    return Expanded(
      child: InkWell(
        onTap: () => controller.change(index),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 24,
              ),
              const SizedBox(height: 2),
              Flexible(
                child: Text(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}