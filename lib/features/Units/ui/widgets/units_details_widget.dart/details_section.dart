import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitBasicDetailsSection extends StatelessWidget {
  final Unit unit;
  const UnitBasicDetailsSection({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    // Optimized selector
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle(appLocalizations.unitBasicDetails),
          const SizedBox(height: itemSpacing),

          // Use a localized helper
          buildInfoRow(
            appLocalizations.unitType,
            _getLocalizedUnitType(unit.unitType, appLocalizations),
          ),

          buildInfoRow(
            appLocalizations.hasElevator,
            unit.hasElevator == true
                ? appLocalizations.yes
                : appLocalizations.no,
          ),

          buildInfoRow(appLocalizations.sellPurpose, unit.sellPurpose ?? '-'),

          buildInfoRow(
            appLocalizations.isStandalone,
            unit.isStandalone == true
                ? appLocalizations.yes
                : appLocalizations.no,
          ),

          if (unit.floors != null)
            buildInfoRow(appLocalizations.floors, unit.floors.toString()),

          buildInfoRow(
            appLocalizations.createdAt,
            unit.createdAt?.toString().toFormattedDate(appLocalizations) ?? '-',
          ),
        ],
      ),
    );
  }

  // Moved localization responsibility here
  String _getLocalizedUnitType(int? type, AppLocalizations locale) {
    switch (type) {
      case 1:
        return locale.apartment;
      case 2:
        return locale.villa;
      case 3:
        return locale.townhouse;
      case 4:
        return locale.land;
      default:
        return locale.undefined;
    }
  }
}
