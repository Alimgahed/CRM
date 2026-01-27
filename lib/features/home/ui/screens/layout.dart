import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/calender/screens/ui/Calender.dart';
import 'package:crm/features/clients/ui/screens/ClientsScreen.dart';
import 'package:crm/features/home/logic/cubit/layout_cubit.dart';
import 'package:crm/features/home/ui/screens/home.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/more/ui/screens/More.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/layout_widget.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = const [Home(), ClientsScreen(), Calendar(), MoreScreen()];
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<LayoutCubit, int>(
      builder: (context, index) {
        return Scaffold(
          backgroundColor: isDark ? darkColor : Colors.white,
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: _BottomNavBar(
            width: width,
            isDark: isDark,
            labels: appLocalizations,
            currentIndex: index,
          ),

          body: screens[index],
        );
      },
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final double width;
  final bool isDark;
  final AppLocalizations labels;
  final int currentIndex;

  const _BottomNavBar({
    required this.width,
    required this.isDark,
    required this.labels,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LayoutCubit>();

    return SizedBox(
      width: width,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(width, 80),
            painter: BNBCustomPainter(isDark: isDark),
          ),
          const Center(heightFactor: 0.6, child: CenterFAB()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavBarItem(
                icon: Icons.home,
                label: labels.home,
                isSelected: currentIndex == 0,
                onTap: () => cubit.change(0),
              ),
              BottomNavBarItem(
                icon: Icons.people,
                label: labels.clients,
                isSelected: currentIndex == 1,
                onTap: () => cubit.change(1),
              ),
              const SizedBox(width: 80),
              BottomNavBarItem(
                icon: Icons.calendar_month,
                label: labels.calendar,
                isSelected: currentIndex == 2,
                onTap: () => cubit.change(2),
              ),
              BottomNavBarItem(
                icon: Icons.more_horiz,
                label: labels.more,
                isSelected: currentIndex == 3,
                onTap: () => cubit.change(3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =======================
// Custom Painter for Bottom Navigation Bar
// =======================
class BNBCustomPainter extends CustomPainter {
  final bool isDark;

  BNBCustomPainter({this.isDark = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark ? darkColor : Colors.white
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

    canvas.drawShadow(path, Colors.black, isDark ? 8 : 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant BNBCustomPainter oldDelegate) =>
      oldDelegate.isDark != isDark;
}
