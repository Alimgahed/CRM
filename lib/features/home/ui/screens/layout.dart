import 'package:crm/features/calender/screens/ui/Calender.dart';
import 'package:crm/features/clients/ui/screens/ClientsScreen.dart';
import 'package:crm/features/home/logic/cubit/layout_cubit.dart';
import 'package:crm/features/home/logic/cubit/layout_states.dart';
import 'package:crm/features/home/ui/screens/home.dart';
import 'package:crm/features/home/ui/widgets/layout_widget.dart';
import 'package:crm/features/more/ui/screens/More.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final cubit = context.read<LayoutCubit>();

    // Provide screens here (works only once)
    cubit.setScreens([
      Home(),
      ClientsScreen(),
      Calendar(),
      MoreScreen(),
    ]);

    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: SizedBox(
            width: width,
            height: 80,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomPaint(
                  size: Size(width, 80),
                  painter: BNBCustomPainter(),
                ),

                Center(heightFactor: 0.6, child: CenterFAB()),

                SizedBox(
                  width: width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BottomNavBarItem(
                              icon: Icons.home_outlined,
                              label: 'Home'.tr,
                              isSelected: cubit.currentIndex == 0,
                              onTap: () => cubit.change(0),
                            ),
                            BottomNavBarItem(
                              icon: Icons.people_outline,
                              label: 'Clients'.tr,
                              isSelected: cubit.currentIndex == 1,
                              onTap: () => cubit.change(1),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 80),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BottomNavBarItem(
                              icon: Icons.calendar_month_outlined,
                              label: 'Calendar'.tr,
                              isSelected: cubit.currentIndex == 2,
                              onTap: () => cubit.change(2),
                            ),
                            BottomNavBarItem(
                              icon: Icons.more_horiz_outlined,
                              label: 'More'.tr,
                              isSelected: cubit.currentIndex == 3,
                              onTap: () => cubit.change(3),
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

          body: cubit.screens[cubit.currentIndex],
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
