import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectStagesSection extends StatelessWidget {
  final Project project;

  const ProjectStagesSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations(context.watch<LocaleCubit>().currentLocale);
    final stages = project.projectStages;
    if (stages == null || stages.isEmpty) return const SizedBox.shrink();

    return ModernCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.projectStages),
          heightSpace(12),
          ...stages.map((stage) => StageCard(stage: stage)),
        ],
      ),
    );
  }
}

class StageCard extends StatelessWidget {
  final ProjectStage stage;

  const StageCard({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: divColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.layers_outlined, color: appColor, size: 20.sp),
              widthSpace(8),
              Text(
                stage.stageName,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          if (stage.groups != null && stage.groups!.isNotEmpty) ...[
            heightSpace(12),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: stage.groups!.map((g) => GroupChip(group: g)).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class GroupChip extends StatelessWidget {
  final StageGroup group;

  const GroupChip({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        group.stageCode,
        style: TextStyle(
          fontSize: 12.sp,
          color: secondaryTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
