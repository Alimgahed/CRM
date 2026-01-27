import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/constant/enums/enums..dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitHeaderSection extends StatelessWidget {
  final Unit unit;

  const UnitHeaderSection({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    // Rebuild ONLY when locale changes
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    final int status = unit.status ?? 0;
    final String? description = unit.description;

    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Unit name & code
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unit.unitName ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${appLocalizations.unitCode} : ${unit.id}",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // Status badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: getStatusLabelColor(status),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  getStatusLabel(status),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          // Description section
          if (description != null && description.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.info_outline, size: 20, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(child: _DescriptionText()),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Keeps Text widget const-friendly (micro-optimization)
class _DescriptionText extends StatelessWidget {
  const _DescriptionText();

  @override
  Widget build(BuildContext context) {
    final unit = context
        .findAncestorWidgetOfExactType<UnitHeaderSection>()!
        .unit;

    return Text(
      unit.description!,
      style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
    );
  }
}
