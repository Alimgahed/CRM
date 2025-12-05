import 'package:crm/features/clients/logic/all_clients/Clients_controller.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientAction {
  final String datecreator;
  final String dateend;
  final String unitPrice;

  const ClientAction({
    required this.datecreator,
    required this.dateend,
    this.unitPrice = '-',
  });
}

class Clientchance extends StatelessWidget {
  final controller = Get.find<ClientsController>();
  Clientchance({super.key});

  static final List<ClientAction> _dummyData = List.generate(
    50,
    (index) => ClientAction(
      datecreator: '2024-01-${(index % 31) + 1}',
      dateend: '2024-01-${(index % 31) + 1}',
      unitPrice: '${100 + index * 10}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    const headers = [
      'سعر الوحدة',
      'التاريخ إنشاء',
      'التاريخ انتهاء',
      'الإجراءات',
    ];

    return CustomTable(
      headers: headers,
      rows: List.generate(_dummyData.length, (index) {
        final e = _dummyData[index];
        return [
          _SmallText(e.datecreator),
          _SmallText(e.unitPrice),
          _SmallText(e.dateend),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  controller.selectedFilter.value = 101;
                },
                child: Icon(Icons.edit_square, size: 25),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  controller.selectedFilter.value = 102;
                },
                child: Icon(Icons.delete, size: 25, color: Colors.red),
              ),
            ],
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
