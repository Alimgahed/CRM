import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AllprojectWidget extends StatelessWidget {
  final Project project;

  const AllprojectWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final textColor = secondaryTextColor;

    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
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
                imageUrl:
                    ApiConstants.baseUrl + (project.attachments![0].filePath),
                width: double.infinity,
                height: 190.h,
                fit: BoxFit.cover,
                placeholder: (_, __) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: double.infinity,
                    height: 190.h,
                    color: Colors.grey.shade300,
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  width: double.infinity,
                  height: 190.h,
                  color: Colors.grey.shade300,
                  child: Icon(
                    Icons.broken_image,
                    size: 60.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            heightSpace(10),

            /* ----------------------------- PROJECT NAME ----------------------------- */
            Text(
              '${project.projectName} - ${project.projectNameEn}',
              style: titleStyle.copyWith(color: textColor, fontSize: 16.sp),
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
                    project.description ?? 'لا يوجد وصف متاح',
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
                ),
                widthSpace(8),
                infoChip(
                  Icons.business,
                  project.devCompany?.companyNameAr ?? 'غير متوفر',
                  textColor,
                ),
              ],
            ),
            heightSpace(10),

            heightSpace(10),

            /* ----------------------------- DETAILS BUTTON ----------------------------- */
            Center(
              child: CustomButton(
                height: 40.h,
                text: 'عرض التفاصيل',
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
    if (from == null || to == null) return 'غير متوفر';
    return '$from م² - $to م²';
  }
}
