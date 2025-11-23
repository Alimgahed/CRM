import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  TextEditingController phone = TextEditingController();

  RxString selectedFlag = "🇪🇬".obs;
  RxString selectedCode = "+20".obs;

  /// Common Arab countries + worlds most used
  List<Map<String, String>> countries = [
    {"flag": "🇪🇬", "code": "+20", "name": "Egypt"},
    {"flag": "🇸🇦", "code": "+966", "name": "Saudi Arabia"},
    {"flag": "🇦🇪", "code": "+971", "name": "United Arab Emirates"},
    {"flag": "🇶🇦", "code": "+974", "name": "Qatar"},
    {"flag": "🇰🇼", "code": "+965", "name": "Kuwait"},
    {"flag": "🇧🇭", "code": "+973", "name": "Bahrain"},
    {"flag": "🇴🇲", "code": "+968", "name": "Oman"},
    {"flag": "🇯🇴", "code": "+962", "name": "Jordan"},
    {"flag": "🇱🇧", "code": "+961", "name": "Lebanon"},
    {"flag": "🇮🇶", "code": "+964", "name": "Iraq"},
    {"flag": "🇾🇪", "code": "+967", "name": "Yemen"},
    {"flag": "🇸🇩", "code": "+249", "name": "Sudan"},
    {"flag": "🇸🇾", "code": "+963", "name": "Syria"},
    {"flag": "🇱🇾", "code": "+218", "name": "Libya"},
    {"flag": "🇲🇦", "code": "+212", "name": "Morocco"},
    {"flag": "🇩🇿", "code": "+213", "name": "Algeria"},
    {"flag": "🇹🇳", "code": "+216", "name": "Tunisia"},

    /// Additional countries (common globally)
    {"flag": "🇮🇳", "code": "+91", "name": "India"},
    {"flag": "🇺🇸", "code": "+1", "name": "USA"},
    {"flag": "🇬🇧", "code": "+44", "name": "United Kingdom"},
  ];

  void selectCountry(String flag, String code) {
    selectedFlag.value = flag;
    selectedCode.value = code;
    Get.back();
  }

  String get fullNumber => "${selectedCode.value}";
  Widget prefixWidget(VoidCallback onTap) {
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(selectedFlag.value, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 4),
            Text(
              selectedCode.value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      );
    });
  }
}

void showCountrydialog() {
  final c = Get.find<CountryController>();

  Get.dialog(
    Center(
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Country",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 260,
                child: ListView(
                  children: c.countries.map((country) {
                    return ListTile(
                      leading: Text(
                        country["flag"]!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text("${country['name']} (${country['code']})"),
                      onTap: () {
                        c.selectCountry(country["flag"]!, country["code"]!);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: true,
  );
}