import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class UnitLocationSection extends StatelessWidget {
  final Unit unit;

  const UnitLocationSection({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    // Select only what we need to minimize rebuilds
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle(appLocalizations.location),
          const SizedBox(height: itemSpacing),

          // Using a private helper for readability within the class
          _buildLocationInfo(appLocalizations),

          if (unit.mapUrl != null && unit.mapUrl!.isNotEmpty) ...[
            const SizedBox(height: 16),
            _MapButton(url: unit.mapUrl!, label: appLocalizations.viewOnMap),
          ],
        ],
      ),
    );
  }

  Widget _buildLocationInfo(AppLocalizations locale) {
    // Helper to handle null values safely
    String s(String? value) => (value == null || value.isEmpty) ? '-' : value;

    return Column(
      children: [
        buildInfoRow(locale.country, s(unit.country)),
        buildInfoRow(locale.governorate, s(unit.governate)),
        buildInfoRow(locale.city, s(unit.city)),
        buildInfoRow(locale.district, s(unit.district)),
        buildInfoRow(locale.street, s(unit.street)),
      ],
    );
  }
}

/// Extracted Map Button for performance and reusability
class _MapButton extends StatelessWidget {
  final String url;
  final String label;

  const _MapButton({required this.url, required this.label});

  Future<void> _handleLaunch() async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Could not launch map: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleLaunch,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: appColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: appColor.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, color: appColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: appColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
