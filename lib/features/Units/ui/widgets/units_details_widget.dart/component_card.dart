import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitComponentsSection extends StatelessWidget {
  final Unit unit;

  const UnitComponentsSection({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    // Select specific state to prevent unnecessary rebuilds
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle(appLocalizations.unitComponents),
          const SizedBox(height: itemSpacing),

          Row(
            children: [
              Expanded(
                child: _ComponentTile(
                  icon: Icons.bed_outlined,
                  label: appLocalizations.bedrooms,
                  value: unit.bedrooms?.toString() ?? '0',
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ComponentTile(
                  icon: Icons.bathtub_outlined,
                  label: appLocalizations.bathrooms,
                  value: unit.bathrooms?.toString() ?? '0',
                  color: Colors.cyan,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Safety first: provide defaults for null values
          buildInfoRow(appLocalizations.view, unit.view ?? '-'),
          buildInfoRow(appLocalizations.finshing, unit.finshing ?? '-'),
        ],
      ),
    );
  }
}

/// Extracted private widget for the numeric cards
class _ComponentTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _ComponentTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
              height: 1.2,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
