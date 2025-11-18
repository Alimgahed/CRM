import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
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
    this.labelText,
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
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.only(right: 4, left: 4),
          child: Text(
            text ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: inputFieldColor,
            borderRadius: BorderRadius.circular(12),
          ),

          // 🔥 Default height 48, expands automatically
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 40, // default height
              maxHeight: double.infinity, // allow growth
            ),

            child: TextFormField(
              controller: controller,
              onTap: onTap,
              readOnly: readOnly ?? false,
              obscureText: obscureText,

              minLines: 1,
              maxLines: obscureText ? 1 : null, // auto-expand if not password

              keyboardType: allowOnlyDigits
                  ? TextInputType.number
                  : TextInputType.multiline,

              inputFormatters: allowOnlyDigits
                  ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'))]
                  : null,

              style: const TextStyle(fontSize: 12),

              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                hintText: hintText,
                prefixIcon: iconData != null
                    ? Icon(iconData, color: appColor)
                    : null,
                border: InputBorder.none,
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
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
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
