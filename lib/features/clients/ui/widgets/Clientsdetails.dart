import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/constant/enums/enums..dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/helpers/date_format.dart';

class DetailsWidget extends StatelessWidget {
  final Lead lead;
  const DetailsWidget({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    // Optimization: Access localizations once efficiently
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Prepare list of items to display to avoid code duplication
    final List<_DetailItem> items = [
      _DetailItem(
        appLocalizations.status,
        getStatusText(lead.status, appLocalizations),
      ),
      _DetailItem(
        appLocalizations.projectCount,
        _getProjectCountText(lead.projectIds, appLocalizations),
      ),
      _DetailItem(appLocalizations.jobTitle, lead.jobTitle),
      _DetailItem(appLocalizations.email, lead.email),
      _DetailItem(appLocalizations.phone, lead.phone),
      if (lead.secondaryPhone?.isNotEmpty ?? false)
        _DetailItem(appLocalizations.secondaryPhone, lead.secondaryPhone!),
      _DetailItem(appLocalizations.channel, lead.leadSource?.sourceName ?? ""),
      _DetailItem(
        appLocalizations.assignedTo,
        lead.assignedToId ?? appLocalizations.notAssigned,
      ),
      _DetailItem(
        appLocalizations.creationDate,
        lead.createdAt!.toFormattedDate(appLocalizations),
      ),
      _DetailItem(appLocalizations.budget, lead.budget.toCompactPrice()),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? darkColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? darkBorder : Colors.grey.shade200),
      ),
      child: Column(
        children: items.map((item) {
          final isLast = items.indexOf(item) == items.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
            child: InfoRowText(label: item.label, value: item.value),
          );
        }).toList(),
      ),
    );
  }

  // Helper for cleaner logic
  String _getProjectCountText(List? projects, AppLocalizations loc) {
    if (projects == null || projects.isEmpty) return '0';
    final count = projects.length;
    return '$count ${count == 1 ? loc.project : loc.projects}';
  }
}

class InfoRowText extends StatelessWidget {
  final String label;
  final String value;

  const InfoRowText({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Better for multi-line
      children: [
        Expanded(
          flex: 2, // Label gets 40% space
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: isDark ? Colors.white : secondaryTextColor,
            ),
          ),
        ),
        const SizedBox(width: 8), // Gap between label and value
        Expanded(
          flex: 3, // Value gets 60% space
          child: Text(
            value,
            textAlign: TextAlign.end, // Aligns value to the opposite side
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

// Simple helper class for the loop
class _DetailItem {
  final String label;
  final String value;
  _DetailItem(this.label, this.value);
}
