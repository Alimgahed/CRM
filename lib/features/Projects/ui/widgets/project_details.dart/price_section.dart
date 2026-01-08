import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectPriceSection extends StatelessWidget {
  final Project project;

  const ProjectPriceSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations(context.watch<LocaleCubit>().currentLocale);

    return ModernCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.priceAndArea),
          heightSpace(12),
          PriceCard(
            icon: Icons.payments_outlined,
            label: l10n.meterPrice,
            value:
                "${project.priceMmeterFrom.toPrice()} - ${project.priceMmeterTo.toPrice()}",
          ),
          heightSpace(12),
          PriceCard(
            icon: Icons.square_foot_outlined,
            label: l10n.areaRange,
            value:
                "${project.areaFrom ?? '—'} ${l10n.sqm} - ${project.areaTo ?? '—'} ${l10n.sqm}",
          ),
        ],
      ),
    );
  }
}

class PriceCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const PriceCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: divColor, width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: appColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: appColor, size: 22.sp),
          ),
          widthSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                heightSpace(4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: appColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
