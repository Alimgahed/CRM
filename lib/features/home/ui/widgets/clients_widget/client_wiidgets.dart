import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/constant/enums/enums..dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/statistics/data/model/lead_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension LeadUIExtension on Lead {
  String getDisplayName(String locale) =>
      locale == 'ar' ? fullName : fullNameEn;

  String getProjectDisplay(String locale) {
    if (projects.isEmpty) return '-';
    final firstProject = locale == 'ar'
        ? projects.first.projectName
        : projects.first.projectNameEn;
    if (projects.length == 1) return firstProject;
    return '$firstProject +${projects.length - 1}';
  }
}

class ClientsWidget extends StatelessWidget {
  final Lead lead;
  final bool isDark;

  const ClientsWidget({super.key, required this.lead, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.select(
      (LocaleCubit cubit) => cubit.currentLocale,
    );
    final loc = AppLocalizations(currentLocale);

    final statusColor = getStatusColor(lead.status);
    final statusText = getStatusText(lead.status, loc);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : fieldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isDark ? Colors.white : fieldColor),
        // Added const implicit via literal
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.contact_emergency_outlined,
                size: 30,
                color: appColor,
              ),
              widthSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lead.getDisplayName(currentLocale),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.size14(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : primaryTextColor,
                      ),
                    ),
                    heightSpace(4),
                    Text(
                      lead.jobTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.size12(
                        color: isDark ? Colors.white : secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              StatusChip(statusText: statusText, statusColor: statusColor),
            ],
          ),
          heightSpace(12),
          Row(
            children: [
              Expanded(
                child: infoChip(
                  Icons.email_outlined,
                  lead.email,
                  isDark ? Colors.white : secondaryTextColor,
                ),
              ),
              widthSpace(8),
              Expanded(
                child: infoChip(
                  Icons.phone_outlined,
                  lead.phone,
                  isDark ? Colors.white : secondaryTextColor,
                ),
              ),
            ],
          ),
          heightSpace(10),
          _LabelRow(loc: loc),
          heightSpace(6),
          Row(
            children: [
              Expanded(
                child: infoChip(
                  Icons.folder_outlined,
                  lead.getProjectDisplay(currentLocale),
                  isDark ? Colors.white : secondaryTextColor,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      size: 12,
                      color: successColor,
                    ),
                    Text(
                      lead.budget.toCompactPrice(),
                      style: TextStyles.size12(
                        fontWeight: FontWeight.w600,
                        color: successColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LabelRow extends StatelessWidget {
  final AppLocalizations loc;
  const _LabelRow({required this.loc});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final style = TextStyles.size12(
      fontWeight: FontWeight.w600,
      color: isDark ? Colors.white : secondaryTextColor.withOpacity(0.8),
    );
    return Row(
      children: [
        Expanded(child: Text(loc.projects, style: style)),
        Expanded(child: Text(loc.budget, style: style)),
      ],
    );
  }
}
