
import 'package:crm/cache/cache.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var currentLanguage = Cache.getdata(key: "lang") ?? "ar";

  void toggleLanguage(String lang) {
    currentLanguage = lang;
    // Update the locale and save it in cache
    Get.updateLocale(Locale(lang));
    Cache.saveData(key: "lang", value: lang);
    update(); // Notify listeners
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "New Deals": "New Deals",
          "Home": "Home",
          "Sales Performance Stages": "Sales Performance Stages",
          "Calendar": "Calendar",
          "more":"More",
          "conversion rate": "conversion rate",
          "Welcome": "Welcome",
          "Search": "Search",
          "Clients": "Clients",
          "total sales": "total sales",
          "Active Clients": "Active Clients",
          "Notifications": "Notifications",
        
        },
        'ar': {
          "Sales Performance Stages": "مراحل أداء المبيعات",
        "Active Clients": "العملاء النشطون", 
         "total sales": "إجمالي المبيعات",
          "New Deals": "صفقات جديدة",
          "conversion rate": "معدل التحويل",
          "Search": "بحث",
          "Welcome": "مرحباً بك",
          "Calendar": "التقويم",
          "Home": "الرئيسية",
          "Clients": "العملاء",
          "Notifications": "إشعارات",
          "More": "المزيد"
        },
      };
}
