import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/developers/data/models/developers_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDeveloperWidget extends StatelessWidget {
  final DevCompany developer;

  const AllDeveloperWidget({super.key, required this.developer});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* --------------------------- Company Logo --------------------------- */
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: developer.logoUrl != null
                    ? CachedNetworkImage(
                        imageUrl: developer.logoUrl!,
                        width: screenWidth,
                        height: 180.h,
                        fit: BoxFit.contain,
                        placeholder: (_, __) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 180.h,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        errorWidget: (_, __, ___) =>
                            Icon(Icons.business, size: 60.sp),
                      )
                    : Container(
                        height: 180.h,
                        width: screenWidth,
                        color: Colors.grey.shade300,
                        child: Icon(Icons.business, size: 60.sp),
                      ),
              ),

              heightSpace(12),

              /* ---------------------------- Company Name --------------------------- */
              Text(
                "${developer.companyNameAr} - ${developer.companyNameEn}",
                style: titleStyle.copyWith(
                  color: secondaryTextColor,
                  fontSize: 18.sp,
                ),
              ),

              heightSpace(10),

              /* ----------------------------- Contact Info --------------------------- */
              infoChip(
                Icons.person_outline,
                developer.contactPerson ?? '',
                secondaryTextColor,
              ),

              heightSpace(6),

              infoChip(
                Icons.call_outlined,
                developer.contactNumber ?? '',
                secondaryTextColor,
              ),

              heightSpace(15),

              /* -------------------------------- Buttons ----------------------------- */
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Edit".tr,
                      height: 45.h,
                      onPressed: () {
                        // TODO edit action
                      },
                    ),
                  ),
                  widthSpace(10),
                  ActionButton(
                    icon: Icons.delete_outline,
                    color: Colors.red,
                    onTap: () {
                      // TODO delete action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
