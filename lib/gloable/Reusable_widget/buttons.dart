import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Example color

class FloatingCloseButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final double elevation;
  final bool mini;

  const FloatingCloseButton({
    super.key,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.elevation = 4,
    this.mini = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,

            shape: BoxShape.circle,
          ),

          child: Icon(Icons.close, color: iconColor),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final Gradient? gradient;
    final Padding? padding;

  final Color? backgroundColor;
  final Color textColor;
  final Color bordercolor;

  const CustomButton({
    super.key,
    this.bordercolor = appColor,
    required this.text,
    required this.onPressed,
    this.height = 54,
    this.padding,
    this.borderRadius = 10,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    this.gradient,
    this.backgroundColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      
      decoration: BoxDecoration(
        color: backgroundColor ?? appColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: bordercolor),
        // boxShadow: const [
        //   BoxShadow(
        //     offset: Offset(0, 10),
        //     blurRadius: 50,
        //     color: Color(0xffEEEEEE),
        //   ),
        // ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                height: 1.65,
                letterSpacing: 0,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const ActionButton({super.key, required this.icon, required this.onTap, this.color = appColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: color),
      ),
    );
  }
}


/// A reusable PopupMenuButton widget that supports any number of items
