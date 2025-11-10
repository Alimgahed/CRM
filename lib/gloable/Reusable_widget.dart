import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Positioned(
      top: 0, // above container
      left: 0,
      right: 0,
      child: Center(
        child: FloatingActionButton(
          mini: mini,
          backgroundColor: backgroundColor,
          elevation: elevation,
          onPressed: () {
            Get.back();
          },
          child: Icon(Icons.close, color: iconColor),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String labelText;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final bool? readOnly;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final bool allowOnlyDigits;
  final bool useValidator;
  final bool obscureText;
  final String? text;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.text,
    this.hintText,
    required this.labelText,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.readOnly,
    this.iconData,
    this.validator,
    this.allowOnlyDigits = false,
    this.useValidator = true,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4, left: 4),
          child: Text(
            text ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              height: 1.5,
              letterSpacing: 0,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: inputFieldColor, // Gray background
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: controller,
            onTap: onTap,
            readOnly: readOnly ?? false,
            obscureText: obscureText,
            keyboardType: allowOnlyDigits
                ? TextInputType.number
                : TextInputType.text,
            inputFormatters: allowOnlyDigits
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                  ]
                : null,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              hintText: hintText,
              prefixIcon: iconData != null
                  ? Icon(iconData, color: appColor)
                  : null,
              border: InputBorder.none, // Remove default border
            ),
            validator: useValidator
                ? validator ??
                      (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty".tr;
                        }
                        return null;
                      }
                : null,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
          ),
        ),
      ],
    );
  }
}

// gray background

class CustomDropdownFormField<T> extends StatelessWidget {
  final String labelText;
  final String? text;
  final String? hintText;
  final IconData? iconData;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool useValidator;
  final bool readOnly;

  const CustomDropdownFormField({
    super.key,
    required this.labelText,
    required this.items,
    this.text,
    this.hintText,
    this.iconData,
    this.value,
    this.onChanged,
    this.validator,
    this.useValidator = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null && text!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: inputFieldColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<T>(
            initialValue: value,
            items: items,
            onChanged: readOnly ? null : onChanged,
            validator: useValidator
                ? validator ??
                      (val) {
                        if (val == null) return "This field cannot be empty".tr;
                        return null;
                      }
                : null,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              hintText: hintText,
              prefixIcon: iconData != null
                  ? Icon(iconData, color: appColor)
                  : null,
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 16, color: Colors.black),
            dropdownColor: Colors.white,
          ),
        ),
      ],
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
        color: appColor,
        borderRadius: BorderRadius.circular(borderRadius),
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
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                height: 1.65,
                letterSpacing: 0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A reusable PopupMenuButton widget that supports any number of items
class GlobalPopupMenu extends StatelessWidget {
  /// List of menu items
  final List<PopupMenuItemModel> items;

  /// Icon of the button (default is more_vert)
  final Icon? icon;

  const GlobalPopupMenu({super.key, required this.items, this.icon});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: icon ?? const Icon(Icons.more_vert_rounded),
      onSelected: (index) {
        if (index >= 0 && index < items.length) {
          items[index].onTap?.call();
        }
      },
      itemBuilder: (context) => List.generate(
        items.length,
        (index) => PopupMenuItem(
          value: index,
          child: Row(
            children: [
              if (items[index].icon != null) ...[
                Icon(items[index].icon, color: items[index].iconColor),
                const SizedBox(width: 8),
              ],
              Text(items[index].title),
            ],
          ),
        ),
      ),
    );
  }
}

/// Model class for a single popup menu item
class PopupMenuItemModel {
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  PopupMenuItemModel({
    required this.title,
    this.icon,
    this.iconColor,
    this.onTap,
  });
}
