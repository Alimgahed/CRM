import 'package:crm/Core/theming/colors.dart';
import 'package:flutter/material.dart';

class CountryPhoneField extends StatefulWidget {
  final TextEditingController phoneController;
  final String hintText;
  final String country;

  const CountryPhoneField({
    super.key,
    required this.phoneController,
    required this.hintText,
    required this.country,
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
              SizedBox(
                height: 260,
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (_, index) {
                    final country = countries[index];
                    return ListTile(
                      leading: Text(
                        country["flag"]!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text("${country['name']} (${country['code']})"),
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
    return TextField(
      controller: widget.phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        fillColor: isDark ? darkFieldColor : Colors.white,
        hintText: widget.hintText,
        prefixIcon: GestureDetector(
          onTap: _showCountryDialog,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(selectedFlag, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 4),
                Text(
                  selectedCode,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : secondaryTextColor,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: isDark ? Colors.white : secondaryTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
