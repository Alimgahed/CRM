import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllprojectWidget extends StatelessWidget {
  final Project project;

  const AllprojectWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white70 : secondaryTextColor;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.3)
                  : Colors.grey.shade200,
              blurRadius: 6.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* ----------------------------- PROJECT IMAGE ----------------------------- */
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                memCacheHeight: 600,
                memCacheWidth: 600,
                imageUrl:
                    ApiConstants.baseUrl + (project.attachments![0].filePath),
                width: double.infinity,
                height: 190.h,
                fit: BoxFit.cover,
                placeholder: (_, __) => Shimmer.fromColors(
                  baseColor: isDark
                      ? Colors.grey.shade800
                      : Colors.grey.shade300,
                  highlightColor: isDark
                      ? Colors.grey.shade700
                      : Colors.grey.shade100,
                  child: Container(
                    width: double.infinity,
                    height: 190.h,
                    color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  width: double.infinity,
                  height: 190.h,
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                  child: Icon(
                    Icons.broken_image,
                    size: 60.sp,
                    color: isDark ? Colors.grey[600] : Colors.grey,
                  ),
                ),
              ),
            ),

            heightSpace(10),

            /* ----------------------------- PROJECT NAME ----------------------------- */
            Text(
              '${project.projectName} - ${project.projectNameEn}',
              style: titleStyle.copyWith(
                color: isDark ? Colors.white : textColor,
                fontSize: 16.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            heightSpace(10),

            /* ----------------------------- DESCRIPTION ----------------------------- */
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 15.sp, color: textColor),
                widthSpace(4),
                Expanded(
                  child: Text(
                    project.description ?? appLocalizations.noData,
                    style: smallStyle.copyWith(
                      color: textColor,
                      fontSize: 12.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            heightSpace(10),

            /* ----------------------------- PRICE + AREA + DEV COMPANY ----------------------------- */
            Row(
              children: [
                infoChip(
                  Icons.architecture_outlined,
                  _formatAreaRange(project.areaFrom, project.areaTo),
                  textColor,
                  isDark,
                ),
                widthSpace(8),
                infoChip(
                  Icons.business,
                  project.devCompany?.companyNameAr ?? appLocalizations.noData,
                  textColor,
                  isDark,
                ),
              ],
            ),
            heightSpace(10),

            /* ----------------------------- DETAILS BUTTON ----------------------------- */
            Center(
              child: CustomButton(
                height: 40.h,
                text: appLocalizations.view,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.projectDetails,
                    arguments: project,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* ----------------------------- HELPERS ----------------------------- */

  String _formatAreaRange(dynamic from, dynamic to) {
    if (from == null || to == null) {
      return 'غير متوفر';
    }
    return '$from م² - $to م²';
  }
}

// Update the infoChip helper function if it exists in Gloable_widget.dart
// or create it here with dark mode support:
Widget infoChip(IconData icon, String text, Color textColor, bool isDark) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: isDark ? const Color(0xFF2C2C2C) : Colors.grey.shade100,
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.sp, color: textColor),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.sp,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
