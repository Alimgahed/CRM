import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/constant/enums/enums..dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitsWidget extends StatelessWidget {
  final Unit unit;

  const UnitsWidget({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? darkCardColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? darkBorder : borderColor.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image header with badges
            _ImageHeader(unit: unit),

            // Content section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  _UnitTitle(unit: unit, isDark: isDark),

                  const SizedBox(height: 8),

                  // Location
                  _LocationInfo(unit: unit),

                  const SizedBox(height: 10),

                  // Price & Area in single row
                  _PriceAreaRow(unit: unit, loc: appLocalizations),

                  const SizedBox(height: 10),

                  // Features row
                  _FeaturesRow(unit: unit, loc: appLocalizations),

                  const SizedBox(height: 12),

                  // View details button
                  _DetailsButton(unit: unit, loc: appLocalizations),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  final Unit unit;

  const _ImageHeader({required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [appColor.withOpacity(0.15), Colors.grey.shade100],
        ),
      ),
      child: Stack(
        children: [
          // Center icon
          Center(
            child: Icon(
              Icons.apartment_rounded,
              size: 48,
              color: appColor.withOpacity(0.4),
            ),
          ),

          // Top badges row
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatusBadge(status: unit.status!),
                _PurposeBadge(purpose: unit.sellPurpose!),
              ],
            ),
          ),

          // Unit name overlay at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
              child: Text(
                unit.unitName ?? '',
                style: TextStyles.size14(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Status badge
class _StatusBadge extends StatelessWidget {
  final int status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: getStatusLabelColor(status),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: getStatusLabelColor(status).withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        getStatusLabel(status),
        style: TextStyles.size12(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Purpose badge
class _PurposeBadge extends StatelessWidget {
  final String purpose;

  const _PurposeBadge({required this.purpose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: infoColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        purpose,
        style: TextStyles.size12(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Unit title (removed as it's now in image overlay)
class _UnitTitle extends StatelessWidget {
  final Unit unit;
  final bool isDark;

  const _UnitTitle({required this.unit, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // Title moved to image overlay
  }
}

/// Location info
class _LocationInfo extends StatelessWidget {
  final Unit unit;

  const _LocationInfo({required this.unit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, size: 16, color: warningColor),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            '${unit.district}، ${unit.city}، ${unit.governate}',
            style: TextStyles.size12(
              color: secondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Price and area in compact row
class _PriceAreaRow extends StatelessWidget {
  final Unit unit;
  final AppLocalizations loc;

  const _PriceAreaRow({required this.unit, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _InfoCard(
            icon: Icons.payments_outlined,
            label: loc.pricePerMeter,
            value: unit.totalPrice?.toString().toCompactPrice() ?? '0',
            color: successColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _InfoCard(
            icon: Icons.square_foot_outlined,
            label: loc.unitArea,
            value: unit.totalArea?.toString().toPrice() ?? '0',
            color: infoColor,
          ),
        ),
      ],
    );
  }
}

/// Info card with icon, label and value
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyles.size8(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyles.size14(fontWeight: FontWeight.bold, color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Features row with compact chips
class _FeaturesRow extends StatelessWidget {
  final Unit unit;
  final AppLocalizations loc;

  const _FeaturesRow({required this.unit, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FeatureChip(
          icon: Icons.bed_outlined,
          value: '${unit.bedrooms ?? 0}',
          label: loc.bedrooms,
        ),
        const SizedBox(width: 6),
        _FeatureChip(
          icon: Icons.bathtub_outlined,
          value: '${unit.bathrooms ?? 0}',
          label: loc.bathrooms,
        ),
        const SizedBox(width: 6),
        _FeatureChip(
          icon: Icons.straighten_outlined,
          value: '${unit.buildingArea ?? 0}',
          label: loc.m,
        ),
      ],
    );
  }
}

/// Feature chip
class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _FeatureChip({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: appColor),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                value,
                style: TextStyles.size12(
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Compact details button
class _DetailsButton extends StatelessWidget {
  final Unit unit;
  final AppLocalizations loc;

  const _DetailsButton({required this.unit, required this.loc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, Routes.unitDetails, arguments: unit);
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: appColor,
          side: BorderSide(color: appColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: const Icon(Icons.visibility_outlined, size: 18),
        label: Text(
          loc.unitDetails,
          style: TextStyles.size14(
            fontWeight: FontWeight.bold,
            color: appColor,
          ),
        ),
      ),
    );
  }
}
