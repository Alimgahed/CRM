import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectPlansSection extends StatelessWidget {
  final Project project;

  const ProjectPlansSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations(context.watch<LocaleCubit>().currentLocale);
    final plans = project.planDetails;
    if (plans == null || plans.isEmpty) return const SizedBox.shrink();

    return ModernCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.paymentPlans),
          heightSpace(12),
          ...plans.map((plan) => PaymentPlanCard(plan: plan)),
        ],
      ),
    );
  }
}
