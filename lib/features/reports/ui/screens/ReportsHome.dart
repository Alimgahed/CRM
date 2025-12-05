import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/reports/ui/widgets/Report_home.dart';
import 'package:crm/features/reports/ui/screens/ClientReport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reportshome extends StatelessWidget {
  const Reportshome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports'.tr)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReportHome(
              onTap: () {
                Get.to(() => Clientreport());
              },
              color: Colors.green,
              title: 'تقرير العملاء',
              subtitle: 'تابع تقارير العملاء وجودة التحويل عبر مراحل البيع.',
            ),
            ReportHome(
              color: appColor,
              title: 'تقارير المبيعات والصفقات',
              subtitle:
                  'تابع أداء الصفقات وقيمة المبيعات في كل مشروع وفريق مبيعات.',
            ),
            ReportHome(
              color: Color(0xFFFDC748),
              title: 'تقارير التسويق',
              subtitle:
                  'تحليل الحملات التسويقية وقياس نجاحها لتحسين التسويق ومصادر العملاء.',
            ),
            ReportHome(
              color: Color(0xFF2715E6),
              title: 'تقارير المشاريع والوحدات',
              subtitle:
                  'حلًل أداء المشاريع وأنواع الوحدات عبر المطورين المختلفين.',
            ),

            ReportHome(
              color: Color(0xFFD000D0),
              title: 'تقارير المدفوعات والعمولات',
              subtitle: 'تابع المدفوعات والعمولات عبر المشاريع المختلفة.',
            ),
            ReportHome(
              color: Color(0xFFFD4848),
              title: 'تقارير الأداء العام',
              subtitle:
                  'تابع بنظرة شاملة على مؤشرات الأداء الرئيسية ونمو الشركة',
            ),
          ],
        ),
      ),
    );
  }
}
