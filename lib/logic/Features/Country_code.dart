import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _FieldLabel extends StatelessWidget {
  final String text;
  final bool isDark;
  const _FieldLabel({required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 4),
    child: Text(
      text,
      style: TextStyles.size16(
        fontWeight: FontWeight.w400,
        color: isDark ? darkText : Colors.black87,
      ),
    ),
  );
}

class CountryPhoneField extends StatefulWidget {
  final TextEditingController phoneController;
  final String hintText;
  final String country;
  final bool enabled;
  final String label;

  const CountryPhoneField({
    super.key,
    required this.phoneController,
    required this.hintText,
    required this.country,
    this.enabled = true,
    required this.label,
  });

  @override
  State<CountryPhoneField> createState() => _CountryPhoneFieldState();
}

class _CountryPhoneFieldState extends State<CountryPhoneField> {
  String selectedFlag = "🇪🇬";
  String selectedCode = "+20";

  final List<Map<String, String>> countries = [
    {"flag": "🇪🇬", "code": "+20", "name": "Egypt"},
    {"flag": "🇸🇦", "code": "+966", "name": "Saudi Arabia"},
    {"flag": "🇦🇪", "code": "+971", "name": "United Arab Emirates"},
    {"flag": "🇶🇦", "code": "+974", "name": "Qatar"},
    {"flag": "🇰🇼", "code": "+965", "name": "Kuwait"},
    {"flag": "🇧🇭", "code": "+973", "name": "Bahrain"},
    {"flag": "🇴🇲", "code": "+968", "name": "Oman"},
    {"flag": "🇯🇴", "code": "+962", "name": "Jordan"},
    {"flag": "🇱🇧", "code": "+961", "name": "Lebanon"},
    {"flag": "🇮🇳", "code": "+91", "name": "India"},
    {"flag": "🇺🇸", "code": "+1", "name": "USA"},
    {"flag": "🇬🇧", "code": "+44", "name": "United Kingdom"},
  ];

  void _showCountryDialog() {
    if (!widget.enabled) return;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.country,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (_, index) {
                    final country = countries[index];
                    final isSelected = selectedCode == country["code"];

                    return ListTile(
                      selected: isSelected,
                      leading: Text(
                        country["flag"]!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text("${country['name']} (${country['code']})"),
                      trailing: isSelected
                          ? const Icon(Icons.check, color: appColor)
                          : null,
                      onTap: () {
                        setState(() {
                          selectedFlag = country["flag"]!;
                          selectedCode = country["code"]!;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(text: widget.label, isDark: isDark),
        SizedBox(height: 8),

        TextFormField(
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return appLocalizations.requiredField;
            }

            return null;
          },
          enabled: widget.enabled,
          controller: widget.phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            filled: true, // ← THIS IS THE FIX!
            fillColor: isDark ? darkFieldColor : fieldColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
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
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: isDark ? darkTextSecondary.withOpacity(0.5) : Colors.grey,
            ),
            prefixIcon: GestureDetector(
              onTap: _showCountryDialog,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(selectedFlag, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 6),
                    Text(
                      selectedCode,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : secondaryTextColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: isDark ? Colors.white70 : secondaryTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
