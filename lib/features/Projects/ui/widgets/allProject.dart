import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class AllprojectWidget extends StatelessWidget {
  final ProjectResponse project;

  const AllprojectWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = secondaryTextColor;

    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================== IMAGE ====================
            Container(
              height: 190.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: (project.projectImages != null &&
                        project.projectImages!.isNotEmpty &&
                        project.projectImages!.first.imageUrl != null)
                    ? CachedNetworkImage(
                        imageUrl: project.projectImages!.first.imageUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: double.infinity,
                            height: 190.h,
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey.shade300,
                          child: Center(
                            child: Icon(Icons.broken_image,
                                size: 60.sp, color: Colors.grey),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.grey.shade300,
                        child: Center(
                          child: Icon(Icons.business_sharp, size: 60.sp),
                        ),
                      ),
              ),
            ),

            heightSpace(10),

            // ==================== TITLE ====================
            Text(
              '${project.projectName ?? ""} - ${project.projectNameEn ?? ""}',
              style: titleStyle.copyWith(
                color: textColor,
                fontSize: 16.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            heightSpace(10),

            // ==================== LOCATION ====================
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: 15.sp, color: textColor),
                widthSpace(4),
                Expanded(
                  child: Text(
                    project.description ?? 'لا يوجد مكان محدد',
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

            // ==================== PRICE + AREA + COMPANY ====================
            Row(
              children: [
                infoChip(
                  Icons.monetization_on_outlined,
                  _formatPriceRange(project.edaryPriceFrom, project.edaryPriceTo),
                  textColor,
                ),
                widthSpace(10),
                infoChip(
                  Icons.architecture_outlined,
                  _formatAreaRange(project.sakanyPriceFrom, project.sakanyPriceTo),
                  textColor,
                ),
                widthSpace(10),
                infoChip(Icons.business, 'الشركة', textColor),
              ],
            ),

            heightSpace(10),

            // ==================== BUTTON ====================
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
}

              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== Helpers ====================
  String _formatPriceRange(dynamic from, dynamic to) {
    if (from == null || to == null) return 'غير متوفر';
    return '${from.toString()} - ${to.toString()}';
  }

  String _formatAreaRange(dynamic from, dynamic to) {
    if (from == null || to == null) return 'غير متوفر';
    return '${from.toString()}م² - ${to.toString()}م²';
  }
}
