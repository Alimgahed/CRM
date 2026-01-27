import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/theming/theme.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/home/ui/widgets/clients_widget/client_wiidgets.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

class Clients extends StatelessWidget {
  final List<Lead> leads;
  final VoidCallback? onViewAll;

  const Clients({super.key, required this.leads, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final loc = AppLocalizations(Localizations.localeOf(context).languageCode);

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: isDark
            ? AppDecorations.darkContainer
            : AppDecorations.lightContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.clients,
              style: TextStyles.size16(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : primaryTextColor,
              ),
            ),
            const SizedBox(height: 12),

            /// Clients List
            if (leads.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    loc.noResults,
                    style: TextStyles.size14(color: secondaryTextColor),
                  ),
                ),
              )
            else
              ...leads
                  .take(4)
                  .map((lead) => ClientsWidget(lead: lead, isDark: isDark)),

            /// View All
            const SizedBox(height: 12),
            if (leads.length > 4) ...[
              InkWell(
                onTap: onViewAll,
                child: Center(
                  child: Text(
                    loc.viewall,
                    style: TextStyles.size14(
                      fontWeight: FontWeight.w500,
                      color: buttonColor,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
