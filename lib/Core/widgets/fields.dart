import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/logic/Features/Country_code.dart';

/// ============================
/// CUSTOM TEXT FORM FIELD
/// ============================
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final bool readOnly;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool useValidator;
  final bool obscureText;
  final String? text; // label above field
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final int? maxLines;
  final int? maxLength;
  final bool enableTogglePassword;
  final bool isPhoneField;
  final VoidCallback? onSelectCountry;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.readOnly = false,
    this.iconData,
    this.validator,
    this.keyboardType,
    this.textInputAction,
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
    this.focusNode,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();

  /// -----------------------------
  /// Factory methods
  /// -----------------------------
  static CustomTextFormField password({
    Key? key,
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    Function(String)? onFieldSubmitted,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
  }) => CustomTextFormField(
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
    onFieldSubmitted: onFieldSubmitted,
    textInputAction: textInputAction ?? TextInputAction.done,
    focusNode: focusNode,
  );

  static CustomTextFormField phone({
    Key? key,
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    required VoidCallback onSelectCountry,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
  }) => CustomTextFormField(
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
    textInputAction: textInputAction ?? TextInputAction.next,
    focusNode: focusNode,
  );

  static CustomTextFormField email({
    Key? key,
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputAction? textInputAction,
    FocusNode? focusNode,
  }) => CustomTextFormField(
    key: key,
    controller: controller,
    labelText: labelText,
    hintText: hintText,
    text: labelAboveField,
    iconData: Icons.email_outlined,
    keyboardType: TextInputType.emailAddress,
    validator: validator,
    onChanged: onChanged,
    textInputAction: textInputAction ?? TextInputAction.next,
    focusNode: focusNode,
  );
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.text != null && widget.text!.isNotEmpty)
          _FieldLabel(text: widget.text!, isDark: isDark),
        if (widget.text != null && widget.text!.isNotEmpty)
          SizedBox(height: 10.h),
        _FieldContainer(
          isDark: isDark,
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            cursorColor: isDark ? darkColor : Colors.black,
            obscureText: _isObscured,
            keyboardType:
                widget.keyboardType ??
                (widget.isPhoneField
                    ? TextInputType.phone
                    : TextInputType.text),
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            maxLength: widget.maxLength,
            style: TextStyle(
              color: isDark ? darkText : Colors.black,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              fillColor: isDark ? darkFieldColor : fieldColor,
              labelText: widget.labelText,
              labelStyle: TextStyles.size12(
                color: isDark ? darkText : Colors.grey,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyles.size12(
                color: isDark ? darkText.withOpacity(0.7) : Colors.grey,
              ),
              border: InputBorder.none,
              counterText: widget.maxLength != null ? null : '',
              counterStyle: TextStyle(
                color: isDark ? darkTextSecondary : Colors.grey,
              ),
              prefixIcon: _buildPrefixWidget(isDark),
              suffixIcon: _buildSuffixWidget(isDark),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            validator: widget.useValidator ? _getValidator() : null,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
          ),
        ),
      ],
    );
  }

  Widget? _buildPrefixWidget(bool isDark) {
    if (widget.prefixWidget != null) return widget.prefixWidget;
    if (widget.isPhoneField && widget.onSelectCountry != null) {
      return _PhonePrefix(onSelectCountry: widget.onSelectCountry!);
    }
    if (widget.iconData != null) {
      return _IconPrefix(iconData: widget.iconData!, isDark: isDark);
    }
    return null;
  }

  Widget? _buildSuffixWidget(bool isDark) {
    if (widget.suffixWidget != null) return widget.suffixWidget;
    if (widget.enableTogglePassword && widget.obscureText) {
      return IconButton(
        icon: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color: isDark ? darkText : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
      );
    }
    return null;
  }

  String? Function(String?)? _getValidator() =>
      widget.validator ??
      (value) => (value == null || value.isEmpty)
          ? "This field cannot be empty".tr
          : null;
}

/// ============================
/// FIELD LABEL & CONTAINER
/// ============================
class _FieldLabel extends StatelessWidget {
  final String text;
  final bool isDark;
  const _FieldLabel({required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    child: Text(
      text,
      style: TextStyles.size16(
        fontWeight: FontWeight.w400,
        color: isDark ? darkText : Colors.black87,
      ),
    ),
  );
}

class _FieldContainer extends StatelessWidget {
  final bool isDark;
  final Widget child;
  const _FieldContainer({required this.isDark, required this.child});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(8.0.h),
    decoration: BoxDecoration(
      color: isDark ? darkFieldColor : fieldColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isDark ? darkBorder : Colors.transparent,
        width: 1,
      ),
    ),
    child: child,
  );
}

class _IconPrefix extends StatelessWidget {
  final IconData iconData;
  final bool isDark;
  const _IconPrefix({required this.iconData, required this.isDark});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(iconData, color: appColor),
      const SizedBox(width: 8),
      Container(
        height: 24,
        width: 1,
        color: isDark ? darkColor2 : Colors.grey.shade300,
      ),
    ],
  );
}

class _PhonePrefix extends StatelessWidget {
  final VoidCallback onSelectCountry;
  const _PhonePrefix({required this.onSelectCountry});

  @override
  Widget build(BuildContext context) {
    try {
      final countryController = Get.find<CountryController>();
      return countryController.prefixWidget(onSelectCountry);
    } catch (_) {
      return const SizedBox.shrink();
    }
  }
}

/// ============================
/// DROPDOWN FORM FIELD
/// ============================
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (text != null && text!.isNotEmpty)
          _FieldLabel(text: text!, isDark: isDark),
        if (text != null && text!.isNotEmpty) SizedBox(height: 10.h),
        _FieldContainer(
          isDark: isDark,
          child: DropdownButtonFormField<T>(
            initialValue: value,
            items: items,
            onChanged: readOnly ? null : onChanged,
            validator: useValidator
                ? validator ??
                      (val) =>
                          val == null ? "This field cannot be empty".tr : null
                : null,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: isDark ? darkText : Colors.grey,
                fontSize: 12,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: isDark ? darkText.withOpacity(0.7) : Colors.grey,
              ),
              prefixIcon: iconData != null
                  ? Icon(iconData, color: appColor)
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            style: TextStyle(
              fontSize: 16,
              color: isDark ? darkText : Colors.black,
            ),
            dropdownColor: isDark ? darkFieldColor : Colors.white,
            icon: Icon(
              Icons.arrow_drop_down,
              color: isDark ? darkText : Colors.grey,
            ),
            isExpanded: true,
            menuMaxHeight: 300,
          ),
        ),
      ],
    );
  }
}

/// ============================
/// POPUP MENU
/// ============================
class GlobalPopupMenu extends StatelessWidget {
  final List<PopupMenuItemModel> items;
  final Icon? icon;
  final String? tooltip;

  const GlobalPopupMenu({
    super.key,
    required this.items,
    this.icon,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PopupMenuButton<int>(
      icon:
          icon ??
          Icon(
            Icons.more_vert_rounded,
            color: isDark ? darkText : Colors.black87,
          ),
      tooltip: tooltip ?? 'More options',
      color: isDark ? darkCardColor : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isDark ? darkBorder : Colors.grey.shade200,
          width: 1,
        ),
      ),
      elevation: isDark ? 8 : 2,
      onSelected: (index) {
        if (index >= 0 && index < items.length) items[index].onTap?.call();
      },
      itemBuilder: (context) => List.generate(
        items.length,
        (index) => PopupMenuItem(
          value: index,
          child: _PopupMenuItem(item: items[index], isDark: isDark),
        ),
      ),
    );
  }
}

class _PopupMenuItem extends StatelessWidget {
  final PopupMenuItemModel item;
  final bool isDark;
  const _PopupMenuItem({required this.item, required this.isDark});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (item.icon != null) ...[
        Icon(
          item.icon,
          color: item.iconColor ?? (isDark ? darkText : Colors.black87),
          size: 20,
        ),
        const SizedBox(width: 12),
      ],
      Flexible(
        child: Text(
          item.title,
          style: TextStyle(
            color: isDark ? darkText : Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

class PopupMenuItemModel {
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  const PopupMenuItemModel({
    required this.title,
    this.icon,
    this.iconColor,
    this.onTap,
  });
}
