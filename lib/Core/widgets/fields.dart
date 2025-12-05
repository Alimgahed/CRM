import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/controller/Features/Country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final bool readOnly;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool useValidator;
  final bool obscureText;
  final String? text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final int? maxLines;
  final int? maxLength;
  final bool enableTogglePassword;

  // Phone specific
  final bool isPhoneField;
  final VoidCallback? onSelectCountry;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.readOnly = false,
    this.iconData,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.useValidator = true,
    this.obscureText = false,
    this.text,
    this.prefixWidget,
    this.suffixWidget,
    this.maxLines = 1,
    this.maxLength,
    this.enableTogglePassword = false,
    this.isPhoneField = false,
    this.onSelectCountry,
  });

  @override
  Widget build(BuildContext context) {
    // Reactive password toggle
    final isObscured = obscureText.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label above field
        if (text != null && text!.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(text!,
                style: TextStyles.size16(fontWeight: FontWeight.w400)),
          ),
        if (text != null && text!.isNotEmpty) SizedBox(height: 10.h),

        Container(
          padding: EdgeInsets.all(8.0.h),
          decoration: BoxDecoration(
            color: inputFieldColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Obx(
            () => TextFormField(
              controller: controller,
              onTap: onTap,
              readOnly: readOnly,
              obscureText: isObscured.value,
              keyboardType: keyboardType ??
                  (isPhoneField ? TextInputType.phone : TextInputType.text),
              inputFormatters: inputFormatters ??
                  (isPhoneField
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : null),
              maxLines: obscureText ? 1 : maxLines,
              maxLength: maxLength,
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                border: InputBorder.none,
                counterText: maxLength != null ? null : '',

                // Prefix
                prefixIcon: _buildPrefixWidget(),

                // Suffix
                suffixIcon: _buildSuffixWidget(isObscured),
              ),
              validator: useValidator ? _getValidator() : null,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
            ),
          ),
        ),
      ],
    );
  }

  /// Prefix widget
  Widget? _buildPrefixWidget() {
    if (prefixWidget != null) return prefixWidget;

    if (isPhoneField && onSelectCountry != null) {
      final countryController = Get.find<CountryController>();
      return countryController.prefixWidget(onSelectCountry!);
    }

    if (iconData != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: appColor),
          const SizedBox(width: 8),
          Container(height: 24, width: 1, color: Colors.grey.shade300),
        ],
      );
    }

    return null;
  }

  /// Suffix widget (password toggle)
  Widget? _buildSuffixWidget(RxBool isObscured) {
    if (suffixWidget != null) return suffixWidget;

    if (enableTogglePassword && obscureText) {
      return IconButton(
        icon: Icon(
          isObscured.value ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: () => isObscured.toggle(),
      );
    }

    return null;
  }

  /// Validator
  String? Function(String?)? _getValidator() {
    return validator ??
        (value) {
          if (value == null || value.isEmpty) {
            return "This field cannot be empty";
          }
          return null;
        };
  }

  // ================================
  // FACTORY METHODS
  // ================================
  static CustomTextFormField password({
    Key? key,
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    String? Function(String?)? validator,
    Function(String)? onChanged,
  }) {
    return CustomTextFormField(
      key: key,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      text: labelAboveField,
      iconData: Icons.lock_outline,
      obscureText: true,
      enableTogglePassword: true,
      validator: validator,
      onChanged: onChanged,
    );
  }

  static CustomTextFormField phone({
    Key? key,
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    required VoidCallback onSelectCountry,
    String? Function(String?)? validator,
    Function(String)? onChanged,
  }) {
    return CustomTextFormField(
      key: key,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      text: labelAboveField,
      isPhoneField: true,
      onSelectCountry: onSelectCountry,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: validator,
      onChanged: onChanged,
    );
  }

  static CustomTextFormField email({
    Key? key,
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    String? Function(String?)? validator,
    Function(String)? onChanged,
  }) {
    return CustomTextFormField(
      key: key,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      text: labelAboveField,
      iconData: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

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
              prefixIcon:
                  iconData != null ? Icon(iconData, color: appColor) : null,
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
