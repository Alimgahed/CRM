import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectHeader extends StatelessWidget {
  final Project project;

  const ProjectHeader({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations(context.watch<LocaleCubit>().currentLocale);

    return ModernCard(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: appColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.apartment_rounded, size: 32.sp, color: appColor),
          ),
          widthSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.projectName,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                if (project.projectNameEn.isNotEmpty) ...[
                  heightSpace(4),
                  Text(
                    project.projectNameEn,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
                if (project.projectPrefix != null) ...[
                  heightSpace(4),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: fieldColor,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      '${l10n.prefix}: ${project.projectPrefix}',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: secondaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
