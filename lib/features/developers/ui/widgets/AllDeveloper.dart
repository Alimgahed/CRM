import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/developers/data/models/developers_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDeveloperWidget extends StatelessWidget {
  final DevelopmentCompany developer;

  const AllDeveloperWidget({super.key, required this.developer});

  @override
  Widget build(BuildContext context) {
    final textColor = secondaryTextColor;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        width: screenWidth,
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
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company logo - full width
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: developer.companyLogoUrl != null
                  ? CachedNetworkImage(
                      imageUrl: developer.companyLogoUrl!,
                      width: screenWidth - 16.w, // responsive width
                      height: 190.h, // responsive height
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: screenWidth - 16.w,
                          height: 190.h,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.engineering_outlined, size: 60.sp),
                    )
                  : Container(
                      width: screenWidth - 16.w,
                      height: 190.h,
                      color: Colors.grey.shade300,
                      child: Center(
                        child: Icon(Icons.engineering_outlined, size: 60.sp),
                      ),
                    ),
            ),

            heightSpace(10.h),

            // Company name
            Text(
              '${developer.companyName ?? "N/A"} - ${developer.companyNameEn ?? ""}',
              style: titleStyle.copyWith(
                color: textColor,
                fontSize: 18.sp, // responsive font
              ),
            ),

            heightSpace(10.h),

            // Sales info
            Row(
              children: [
                if (developer.companySalesName != null)
                  infoChip(
                      Icons.person_outline,
                      developer.companySalesName!,
                      textColor,
                     ), // responsive font
                if (developer.companySalesPhone != null) ...[
                  widthSpace(10.w),
                  infoChip(Icons.call_outlined, developer.companySalesPhone!,
                      textColor,
                      ),
                ],
              ],
            ),

            heightSpace(5.h),

            // Accountant info
            Row(
              children: [
                if (developer.companyAccountantName != null)
                  infoChip(Icons.person_outline,
                      developer.companyAccountantName!, textColor,
                      ),
                if (developer.companyAccountantPhone != null) ...[
                  widthSpace(10.w),
                  infoChip(Icons.call_outlined,
                      developer.companyAccountantPhone!, textColor,
                      ),
                ],
              ],
            ),

            heightSpace(10.h),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 45.h, // responsive button height
                    text: 'Edit'.tr,
                    onPressed: () {
                      // handle edit
                    },
                  ),
                ),
                widthSpace(10.w),
                ActionButton(
                  icon: Icons.delete_outline,
                  color: Colors.red,
                  onTap: () {
                    // handle delete
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
