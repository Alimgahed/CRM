import 'package:crm/gloable/gloable.dart';
import 'package:flutter/material.dart';

class ClientAction {
  final String date;
  final String action;
  final String executor;

  const ClientAction({
    required this.date,
    required this.action,
    required this.executor,
  });
}

class ClientTimeline extends StatelessWidget {
  const ClientTimeline({super.key});

  static final List<ClientAction> _dummyData = [
    ClientAction(
      date: '2024-01-15',
      action: 'إضافة عميل جديد',
      executor: 'أحمد محمد',
    ),
    ClientAction(
      date: '2024-01-14',
      action: 'تحديث بيانات العميل',
      executor: 'سارة علي',
    ),
    ClientAction(
      date: '2024-01-13',
      action: 'إرسال عرض سعر',
      executor: 'محمد حسن',
    ),
    ClientAction(
      date: '2024-01-12',
      action: 'مكالمة هاتفية',
      executor: 'فاطمة أحمد',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final headers = ['منفذ الإجراء', 'الإجراء', 'التاريخ'];

    // Convert each ClientAction into a list of Widgets
    final rows = _dummyData
        .map((e) {
          return [
            Text(
              e.executor,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
            Text(
              style: TextStyle(fontSize: 10),
              e.action,
              textAlign: TextAlign.center,
            ),
            Text(
              style: TextStyle(fontSize: 10),
              e.date,
              textAlign: TextAlign.center,
            ),
          ];
        })
        .toList(growable: false);

    return CustomTable(headers: headers, rows: rows, height: 300);
  }
}
