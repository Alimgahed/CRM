import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Shared app gradient

class FloatingCloseButton extends StatelessWidget {
  final Color iconColor;
  final double elevation;

  const FloatingCloseButton({
    super.key,
    this.iconColor = Colors.white,
    this.elevation = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => context.pop(),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: appGradient, // backgroundColor = null
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: elevation,
              ),
            ],
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
  final Color? backgroundColor;
  final EdgeInsetsGeometry margin;
  final Gradient? gradient;
  final Color textColor;
  final Color bordercolor;

  const CustomButton({
    super.key,
    this.bordercolor = Colors.transparent,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
    this.height = 45,
    this.borderRadius = 10,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    this.gradient,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient ?? appGradient, // backgroundColor = null
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: bordercolor),
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
                fontSize: 16,
                height: 1.65,
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

  const ActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = appColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2), // gradient border
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),

          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white, // inner surface only
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}
