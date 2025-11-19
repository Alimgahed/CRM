import 'package:crm/controller/Clients/Clients_controller.dart';
import 'package:crm/gloable/Reusable_widget/gloable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientAction {
  final String date;
  final String sendto;
  final String user;

  const ClientAction({
    required this.date,
    required this.sendto,
    this.user = '-',
  });
}

class Clientcli extends StatelessWidget {
  final controller = Get.find<ClientsController>();
  Clientcli({super.key});

  static final List<ClientAction> _dummyData = List.generate(
    50,
    (index) => ClientAction(
      date: '2024-01-${(index % 31) + 1}',
      sendto: 'علي محمد علي',
      user: '${100 + index * 10}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    const headers = ['التاريخ', 'مرسل إلى', 'منفذ الأجراء', 'الحالة'];

    return CustomTable(
      headers: headers,
      rows: List.generate(_dummyData.length, (index) {
        final e = _dummyData[index];
        return [
          _SmallText(e.date),
          _SmallText(e.sendto),
          _SmallText(e.user),
          Container(
            padding: const EdgeInsets.all(8),

            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue.shade600),
            ),
            child: Text(
              "نم الارسال",
              style: TextStyle(color: Colors.blue.shade600, fontSize: 10),
            ),
          ),
        ];
      }),
      height: 400,
      rowEvenColor: Colors.white,
      rowOddColor: Colors.grey.shade100,
    );
  }
}

class _SmallText extends StatelessWidget {
  final String text;
  const _SmallText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 10, color: Colors.black87),
    );
  }
}
