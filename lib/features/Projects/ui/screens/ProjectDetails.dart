import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/attachment_section.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/details.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/payment_plan_section.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/price_section.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/project_header.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/stages.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/share_cubit/atttachment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// =============================================================
// MAIN DETAILS SCREEN WITH CUBIT
// =============================================================
class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Get localization from LocaleCubit
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return BlocProvider(
      create: (context) => AttachmentCubit(baseUrl: ApiConstants.baseUrl),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark ? darkColor : Colors.white,
          elevation: 0,
          leading: BackButton(color: appColor, onPressed: () => context.pop()),
          title: Text(
            l10n.locale == 'ar' ? project.projectName! : project.projectNameEn!,
            style: TextStyle(
              color: appColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        body: BlocListener<AttachmentCubit, AttachmentState>(
          listener: (context, state) {
            if (state is AttachmentDownloadSuccess) {
              // Get translated message
              final message = l10n.fileDownloadedToDownloads;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: appColor,
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: l10n.open,
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<AttachmentCubit>().openFile(state.filePath);
                    },
                  ),
                ),
              );
              context.read<AttachmentCubit>().resetToLoaded(project);
            } else if (state is AttachmentDownloadError) {
              // Get translated error message
              final message = state.message.isNotEmpty
                  ? '${l10n.downloadFailed}: ${state.message}'
                  : l10n.downloadFailed;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: warningColor,
                  behavior: SnackBarBehavior.floating,
                ),
              );
              context.read<AttachmentCubit>().resetToLoaded(project);
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProjectHeader(project: project),
                heightSpace(16),
                ProjectDetailsCard(project: project),
                heightSpace(16),
                ProjectPriceSection(project: project),
                heightSpace(16),
                // ProjectDeveloperSection(project: project),
                heightSpace(16),
                ProjectPlansSection(project: project),
                heightSpace(16),
                ProjectStagesSection(project: project),
                heightSpace(16),
                ProjectAttachmentsSection(project: project),
                heightSpace(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
