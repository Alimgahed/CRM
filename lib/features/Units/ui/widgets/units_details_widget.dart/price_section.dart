import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitPriceSection extends StatelessWidget {
  final Unit unit;

  const UnitPriceSection({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    // Cache computed values (CPU optimization)
    final totalPrice = '${unit.totalPrice.toCompactPrice()} جنيه';
    final meterPrice = '${unit.meterPrice.toCompactPrice()} جنيه';
    final totalArea = '${unit.totalArea} م²';
    final buildingArea = '${unit.buildingArea} م²';

    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle(appLocalizations.unitPriceAndArea),
          const SizedBox(height: itemSpacing),

          Row(
            children: [
              Expanded(
                child: _PriceCard(
                  label: 'السعر الإجمالي',
                  value: totalPrice,
                  icon: Icons.attach_money,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _PriceCard(
                  label: 'سعر المتر',
                  value: meterPrice,
                  icon: Icons.straighten,
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _PriceCard(
                  label: 'المساحة الكلية',
                  value: totalArea,
                  icon: Icons.square_foot,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _PriceCard(
                  label: 'مساحة البناء',
                  value: buildingArea,
                  icon: Icons.home_work,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PriceCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _PriceCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = color.withOpacity(0.3);
    final backgroundColor = color.withOpacity(0.1);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
