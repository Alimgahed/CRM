import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProjectDeveloperSection extends StatelessWidget {
  final Project project;

  const ProjectDeveloperSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations(context.watch<LocaleCubit>().currentLocale);
    final dev = project.devCompany;
    if (dev == null) return const SizedBox.shrink();

    return ModernCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.developerCompany),
          if (dev.logoUrl != null && dev.logoUrl!.isNotEmpty) ...[
            heightSpace(12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                color: isDark ? const Color(0xFF2C2C2C) : fieldColor,
                padding: EdgeInsets.all(16.w),
                child: CachedNetworkImage(
                  memCacheHeight: 800,
                  memCacheWidth: 800,
                  imageUrl: ApiConstants.baseUrl + dev.logoUrl!,
                  height: 80.h,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  placeholder: (_, __) => Shimmer.fromColors(
                    baseColor: isDark
                        ? Colors.grey.shade800
                        : Colors.grey.shade300,
                    highlightColor: isDark
                        ? Colors.grey.shade700
                        : Colors.grey.shade100,
                    child: Container(
                      height: 80.h,
                      color: isDark ? Colors.grey.shade800 : Colors.grey,
                    ),
                  ),
                  errorWidget: (_, __, ___) => Icon(
                    Icons.business,
                    size: 40.sp,
                    color: isDark ? Colors.grey[600] : Colors.grey,
                  ),
                ),
              ),
            ),
            heightSpace(16),
          ],
          ModernInfoRow(label: l10n.arabicName, value: dev.companyNameAr),
          ModernInfoRow(label: l10n.englishName, value: dev.companyNameEn),
          ModernInfoRow(label: l10n.contactPerson, value: dev.contactPerson),
          ModernInfoRow(label: l10n.phone, value: dev.contactNumber),
          ModernInfoRow(
            label: l10n.status,
            value: (dev.isActive ?? false) ? l10n.active : l10n.inactive,
            valueColor: (dev.isActive ?? false) ? Colors.green : Colors.orange,
          ),
        ],
      ),
    );
  }
}
