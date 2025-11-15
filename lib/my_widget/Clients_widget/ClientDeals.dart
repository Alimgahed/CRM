import 'package:crm/constant/colors.dart';
import 'package:crm/controller/Clients/Clients_controller.dart';
import 'package:crm/gloable/gloable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientAction {
  final String date;
  final String executor;
  final String unitPrice;
  final String unitType;
  final String marketer;

  const ClientAction({
    required this.date,
    required this.executor,
    this.unitPrice = '-',
    this.unitType = '-',
    this.marketer = '-',
  });
}

class ClientDeals extends StatelessWidget {
  final controller = Get.find<ClientsController>();
  ClientDeals({super.key});

  static final List<ClientAction> _dummyData = List.generate(
    50,
    (index) => ClientAction(
      date: '2024-01-${(index % 31) + 1}',
      executor: 'الموظف ${index + 1}',
      unitPrice: '${100 + index * 10}',
      unitType: index % 2 == 0 ? 'شقة' : 'فيلا',
      marketer: 'مسوق ${index + 1}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    const headers = [
      'التاريخ',
      'سعر الوحدة',
      'نوع الوحدة',
      'المسوق',
      'الإجراء',
    ];

    return CustomTable(
      headers: headers,
      rows: List.generate(_dummyData.length, (index) {
        final e = _dummyData[index];
        return [
          _SmallText(e.date),
          _SmallText(e.unitPrice),
          _SmallText(e.unitType),
          _SmallText(e.marketer),
          _ActionIcon(onTap: () => controller.selectedFilter.value = 100),
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

class _ActionIcon extends StatelessWidget {
  final VoidCallback onTap;
  const _ActionIcon({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: appColor),
        ),
        padding: const EdgeInsets.all(8.0),
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}

class ClientDeal {
  final String unitNumber;
  final String projectInfo;
  final String totalPrice;
  final String status;

  const ClientDeal({
    required this.unitNumber,
    required this.projectInfo,
    required this.totalPrice,
    required this.status,
  });
}

class ClientDealsList extends StatelessWidget {
  final List<ClientDeal> deals;
  const ClientDealsList({super.key, required this.deals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: deals.length,
      itemBuilder: (context, index) => ClientDealTile(deal: deals[index]),
    );
  }
}

class ClientDealTile extends StatelessWidget {
  final ClientDeal deal;
  const ClientDealTile({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        shape: Border.all(color: Colors.grey.shade100),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade100),
        ),
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        title: Row(
          children: [
            const Icon(Icons.business_outlined, color: appColor, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deal.unitNumber,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    deal.projectInfo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline, color: Colors.red),
            ),
          ],
        ),
        children: [
          _DealRow(
            label1: 'السعر الاجمالي',
            value1: deal.totalPrice,
            label2: 'الحالة',
            value2: deal.status,
          ),
          _DealRow(
            label1: 'المقدم  (%)',
            value1: "25%",
            label2: 'عدد سنين الاقساط',
            value2: "٥ سنين",
          ),
          _DealRow(
            label1: 'غرف نوم',
            value1: "٣",
            label2: 'حمام',
            value2: "٢",
            extra: 'الطابق: ٢, مصعد: نعم',
          ),
          _DealRow(
            label1: 'نوع التشطيب',
            value1: "مشطب",
            label2: 'الاطلالة',
            value2: "تطل علي جهتين",
          ),
        ],
      ),
    );
  }
}

class _DealRow extends StatelessWidget {
  final String label1, value1, label2, value2, extra;
  const _DealRow({
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
    this.extra = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _DealColumn(label: label1, value: value1),
          ),
          Expanded(
            child: _DealColumn(label: label2, value: value2),
          ),
          if (extra.isNotEmpty)
            Expanded(
              child: Text(
                extra,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}

class _DealColumn extends StatelessWidget {
  final String label, value;
  const _DealColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
