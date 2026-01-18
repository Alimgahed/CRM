import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:flutter/material.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitFloorsSection extends StatelessWidget {
  final Unit unit;

  const UnitFloorsSection({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    // 1. Check for empty data first to avoid unnecessary builds
    if (unit.unitFloors == null || unit.unitFloors!.isEmpty) {
      return const SizedBox.shrink();
    }

    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle(appLocalizations.floors),
          const SizedBox(height: itemSpacing),

          // 2. Optimization: Use Column + map instead of ListView(shrinkWrap)
          // if the list is small (common for floors). It's lighter on memory.
          ...unit.unitFloors!.asMap().entries.map((entry) {
            final index = entry.key;
            final floor = entry.value;
            final isLast = index == unit.unitFloors!.length - 1;

            return Column(
              children: [
                _FloorTile(floor: floor, appLocalizations: appLocalizations),
                if (!isLast) const Divider(height: 24),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}

class _FloorTile extends StatelessWidget {
  final dynamic floor; // Replace dynamic with your FloorModel type
  final AppLocalizations appLocalizations;

  const _FloorTile({required this.floor, required this.appLocalizations});

  @override
  Widget build(BuildContext context) {
    final bool isActive = floor.isActive ?? false;
    final Color statusColor = isActive ? Colors.green : Colors.grey;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.layers, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),

          // Floor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${appLocalizations.floor} ${floor.floor ?? '-'}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  isActive
                      ? appLocalizations.active
                      : appLocalizations.inactive,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Date Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                appLocalizations.createdAt,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
              ),
              Text(
                floor.createdAt?.toString().toFormattedDate(appLocalizations) ??
                    '-',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
