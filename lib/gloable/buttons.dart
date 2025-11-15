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
  final Color? backgroundColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 54,
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
        border: backgroundColor == appColor
            ? null
            : Border.all(color: appColor),
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

/// A reusable PopupMenuButton widget that supports any number of items
