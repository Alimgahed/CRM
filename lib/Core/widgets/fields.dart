import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';

/// ============================
/// CUSTOM TEXT FORM FIELD
/// ============================

import 'package:intl/intl.dart';

// ============= Number Formatter for Thousands Separator =============
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Remove all commas to get the raw number
    final String cleanedText = newValue.text.replaceAll(',', '');

    // Validate it's a number
    if (int.tryParse(cleanedText) == null) {
      return oldValue;
    }

    // Format with commas
    final String formattedText = _formatter.format(int.parse(cleanedText));

    // Calculate new cursor position
    final int originalCursorPosition = newValue.selection.baseOffset;
    final int commasBefore = ','
        .allMatches(newValue.text.substring(0, originalCursorPosition))
        .length;
    final int commasAfter = ','.allMatches(formattedText).length;
    final int cursorOffset = commasAfter - commasBefore;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: (originalCursorPosition + cursorOffset).clamp(
          0,
          formattedText.length,
        ),
      ),
    );
  }
}

// ============= Decimal Formatter (for prices with decimals) =============
class DecimalFormatter extends TextInputFormatter {
  final int decimalPlaces;
  final NumberFormat _formatter;

  DecimalFormatter({this.decimalPlaces = 2})
    : _formatter = NumberFormat('#,##0.${'0' * decimalPlaces}');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final String cleanedText = newValue.text.replaceAll(',', '');

    if (double.tryParse(cleanedText) == null) {
      return oldValue;
    }

    final double value = double.parse(cleanedText);
    final String formattedText = _formatter.format(value);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

// ============= Optimized CustomTextFormField =============
class CustomTextFormField extends StatefulWidget {
  // Controllers and callbacks
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String>? validator;

  // Text properties
  final String? text; // Label above field
  final String? labelText; // Floating label inside field
  final String? hintText;
  final String? initialValue;

  // Input properties
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final bool useValidator;

  // Icons and widgets
  final IconData? iconData;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  // Special features
  final bool enableTogglePassword;
  final bool isPhoneField;
  final bool isNumberField;
  final bool useThousandsSeparator; // NEW: Format numbers like 1,000,000
  final bool allowDecimals; // NEW: Allow decimal numbers
  final int decimalPlaces; // NEW: Number of decimal places (default: 2)
  final VoidCallback? onSelectCountry;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.validator,
    this.text,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.useValidator = true,
    this.iconData,
    this.prefixWidget,
    this.suffixWidget,
    this.enableTogglePassword = false,
    this.isPhoneField = false,
    this.isNumberField = false,
    this.useThousandsSeparator = false,
    this.allowDecimals = false,
    this.decimalPlaces = 2,
    this.onSelectCountry,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();

  // ============= Factory Methods =============

  /// Password field with toggle visibility
  static CustomTextFormField password({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    TextInputAction? textInputAction,
    bool enabled = true,
  }) => CustomTextFormField(
    key: key,
    controller: controller,
    focusNode: focusNode,
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
    enabled: enabled,
  );

  /// Phone number field
  static CustomTextFormField phone({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    required VoidCallback onSelectCountry,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    TextInputAction? textInputAction,
    bool enabled = true,
  }) => CustomTextFormField(
    key: key,
    controller: controller,
    focusNode: focusNode,
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
    enabled: enabled,
  );

  /// Email field
  static CustomTextFormField email({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    TextInputAction? textInputAction,
    bool enabled = true,
  }) => CustomTextFormField(
    key: key,
    controller: controller,
    focusNode: focusNode,
    labelText: labelText,
    hintText: hintText,
    text: labelAboveField,
    iconData: Icons.email_outlined,
    keyboardType: TextInputType.emailAddress,
    validator: validator,
    onChanged: onChanged,
    textInputAction: textInputAction ?? TextInputAction.next,
    enabled: enabled,
  );

  /// Number field with thousands separator (1,000,000)
  static CustomTextFormField number({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    TextInputAction? textInputAction,
    bool enabled = true,
    bool useThousandsSeparator = true,
    bool allowDecimals = false,
    int decimalPlaces = 2,
  }) => CustomTextFormField(
    key: key,
    controller: controller,
    focusNode: focusNode,
    labelText: labelText,
    hintText: hintText,
    text: labelAboveField,
    isNumberField: true,
    useThousandsSeparator: useThousandsSeparator,
    allowDecimals: allowDecimals,
    decimalPlaces: decimalPlaces,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    validator: validator,
    onChanged: onChanged,
    textInputAction: textInputAction ?? TextInputAction.done,
    enabled: enabled,
  );

  /// Currency/Price field with decimals (1,000,000.00)
  static CustomTextFormField currency({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? labelText,
    String? hintText,
    String? labelAboveField,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    TextInputAction? textInputAction,
    bool enabled = true,
    int decimalPlaces = 2,
  }) => CustomTextFormField(
    key: key,
    controller: controller,
    focusNode: focusNode,
    labelText: labelText,
    hintText: hintText,
    text: labelAboveField,
    isNumberField: true,
    useThousandsSeparator: true,
    allowDecimals: true,
    decimalPlaces: decimalPlaces,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    validator: validator,
    onChanged: onChanged,
    textInputAction: textInputAction ?? TextInputAction.done,
    enabled: enabled,
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
        if (widget.text != null && widget.text!.isNotEmpty) ...[
          _FieldLabel(text: widget.text!, isDark: isDark),
          SizedBox(height: 10.h),
        ],
        _FieldContainer(
          isDark: isDark,
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,

            initialValue: widget.initialValue,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            obscureText: _isObscured,
            maxLines: _isObscured ? 1 : widget.maxLines,
            maxLength: widget.maxLength,
            keyboardType: _getKeyboardType(),
            textInputAction: widget.textInputAction,
            inputFormatters: _getInputFormatters(),
            style: TextStyle(
              color: widget.enabled
                  ? (isDark ? darkText : Colors.black)
                  : (isDark ? darkText.withOpacity(0.5) : Colors.grey),
              fontSize: 16,
            ),
            cursorColor: isDark ? darkColor : Colors.black,
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: appColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              border: InputBorder.none,
              counterText: widget.maxLength != null ? null : '',
              counterStyle: TextStyle(
                color: isDark ? darkTextSecondary : Colors.grey,
              ),
              prefixIcon: _buildPrefixWidget(isDark),
              suffixIcon: _buildSuffixWidget(isDark),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
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

  // ============= Helper Methods =============

  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) return widget.keyboardType!;
    if (widget.isPhoneField) return TextInputType.phone;
    if (widget.isNumberField) {
      return TextInputType.numberWithOptions(decimal: widget.allowDecimals);
    }
    return TextInputType.text;
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (widget.inputFormatters != null) return widget.inputFormatters;

    final List<TextInputFormatter> formatters = [];

    if (widget.isNumberField) {
      if (widget.useThousandsSeparator) {
        if (widget.allowDecimals) {
          // For currency/price: allow decimals with thousands separator
          formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[\d,.]')));
          formatters.add(DecimalFormatter(decimalPlaces: widget.decimalPlaces));
        } else {
          // For whole numbers: only digits with thousands separator
          formatters.add(FilteringTextInputFormatter.digitsOnly);
          formatters.add(ThousandsSeparatorInputFormatter());
        }
      } else {
        // Simple number without formatting
        if (widget.allowDecimals) {
          formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[\d.]')));
        } else {
          formatters.add(FilteringTextInputFormatter.digitsOnly);
        }
      }
    }

    return formatters.isEmpty ? null : formatters;
  }

  Widget? _buildPrefixWidget(bool isDark) {
    if (widget.prefixWidget != null) return widget.prefixWidget;
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
        onPressed: widget.enabled
            ? () => setState(() => _isObscured = !_isObscured)
            : null,
      );
    }
    return null;
  }

  FormFieldValidator<String>? _getValidator() {
    return widget.validator ??
        (value) {
          if (value == null || value.trim().isEmpty) {
            return "This field cannot be empty";
          }
          return null;
        };
  }
}

// ============= Helper Widgets =============

// ============= Utility Extension =============
extension TextEditingControllerExtension on TextEditingController {
  /// Get the numeric value without commas
  int? get numericValue {
    final cleaned = text.replaceAll(',', '');
    return int.tryParse(cleaned);
  }

  /// Get the decimal value without commas
  double? get decimalValue {
    final cleaned = text.replaceAll(',', '');
    return double.tryParse(cleaned);
  }

  /// Set numeric value with formatting
  set numericValue(int? value) {
    if (value == null) {
      text = '';
    } else {
      text = NumberFormat('#,###').format(value);
    }
  }

  /// Set decimal value with formatting
  void setDecimalValue(double? value, {int decimalPlaces = 2}) {
    if (value == null) {
      text = '';
    } else {
      text = NumberFormat('#,##0.${'0' * decimalPlaces}').format(value);
    }
  }
}

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
                      (val) => val == null ? "This field cannot be empty" : null
                : null,
            decoration: InputDecoration(
              labelText: labelText,
              fillColor: isDark ? darkFieldColor : fieldColor,
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
