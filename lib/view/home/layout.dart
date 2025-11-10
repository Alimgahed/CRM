import 'package:crm/controller/layout.dart/layout.dart';
import 'package:crm/my_widget/layout_widget.dart/layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return GetBuilder<LayoutController>(
      init: LayoutController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: SizedBox(
            width: width,
            height: 80,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Background custom painter
                CustomPaint(size: Size(width, 80), painter: BNBCustomPainter()),

                // Center FAB
                Center(heightFactor: 0.6, child: CenterFAB()),

                // Bottom Nav Items
                SizedBox(
                  width: width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side icons
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BottomNavBarItem(
                              icon: Icons.home_outlined,
                              label: 'Home'.tr,
                              isSelected: controller.currentIndex == 0,
                              onTap: () => controller.change(0),
                            ),
                            BottomNavBarItem(
                              icon: Icons.people_outline,
                              label: 'Clients'.tr,
                              isSelected: controller.currentIndex == 1,
                              onTap: () => controller.change(1),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 80), // Space for center FAB
                      // Right side icons
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BottomNavBarItem(
                              icon: Icons.calendar_month_outlined,
                              label: 'Calendar'.tr,
                              isSelected: controller.currentIndex == 2,
                              onTap: () => controller.change(2),
                            ),
                            BottomNavBarItem(
                              icon: Icons.more_horiz_outlined,
                              label: 'More'.tr,
                              isSelected: controller.currentIndex == 3,
                              onTap: () => controller.change(3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: controller.screens[controller.currentIndex],
        );
      },
    );
  }
}

// =======================
// Custom Painter for Bottom Navigation Bar
// =======================
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 20)
      ..quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0)
      ..quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20)
      ..arcToPoint(
        Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20),
        clockwise: false,
      )
      ..quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0)
      ..quadraticBezierTo(size.width * 0.80, 0, size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
