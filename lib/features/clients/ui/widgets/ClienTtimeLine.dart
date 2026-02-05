import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/Core/helpers/app_helpers.dart';
import 'package:crm/features/actions/logic/cubit/get_all_lead_action_cubit.dart';
import 'package:crm/features/actions/logic/state/lead_action_state.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:crm/features/clients/ui/widgets/shareble_widget/shareble.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientTimeline extends StatelessWidget {
  final int leadid;
  const ClientTimeline({super.key, required this.leadid});

  void _showActionDetails(BuildContext context, LeadActionModel action) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.85,
        child: _ActionDetailsSheet(action: action),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final headers = [
      appLocalizations.executor,
      appLocalizations.date,
      appLocalizations.actionType,
      appLocalizations.vieew,
    ];

    return BlocBuilder<ActionCubit, LeadActionState>(
      builder: (context, state) {
        return state.when(
          error: (error) {
            return Center(
              child: Text(error, style: const TextStyle(color: Colors.red)),
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (data) {
            if (data.isEmpty) {
              return Center(child: Text(appLocalizations.noActions));
            }

            final rows = data
                .map((action) {
                  return [
                    Text(
                      ActionHelper.valueOrDefault(action.user?.fullName),
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      action.actionDate.toString().toFormattedDate(
                        appLocalizations,
                      ),
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ActionHelper.getActionType(
                        ActionType.fromValue(action.actionType) ??
                            ActionType.call,
                        appLocalizations,
                      ),
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    ShaderMask(
                      shaderCallback: (bounds) => appGradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 20,
                        ),
                        onPressed: () => _showActionDetails(context, action),
                      ),
                    ),
                  ];
                })
                .toList(growable: false);

            return CustomTable(headers: headers, rows: rows, height: 300.h);
          },
          initial: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}

/// Separated widget for better performance and code organization
class _ActionDetailsSheet extends StatelessWidget {
  final LeadActionModel action;

  const _ActionDetailsSheet({required this.action});

  @override
  Widget build(BuildContext context) {
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            decoration: const BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                /// Drag Handle
                Container(
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                /// Title
                Text(
                  l10n.actionDetails,
                  style: TextStyles.size20(
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                DetailCard(
                  label: l10n.executedBy,
                  value: ActionHelper.valueOrDefault(action.user?.fullName),
                  icon: Icons.person,
                ),

                DetailCard(
                  label: l10n.actionType,
                  value: ActionHelper.getActionType(
                    ActionType.fromValue(action.actionType) ?? ActionType.call,
                    l10n,
                  ),
                  icon: Icons.work_outline,
                ),

                DetailCard(
                  label: l10n.actionDate,
                  value: action.actionDate.toString().toFormattedDate(l10n),
                  icon: Icons.calendar_today,
                ),

                DetailCard(
                  label: l10n.answerd,
                  value: action.isAnswered == true ? l10n.yes : l10n.no,
                  icon: action.isAnswered == true
                      ? Icons.check_circle
                      : Icons.cancel,
                  iconColor: action.isAnswered == true
                      ? successColor
                      : warningColor,
                ),

                if (action.nextFollow != null)
                  DetailCard(
                    label: l10n.nextFollowup,
                    value: ActionHelper.getNextFollow(action.nextFollow, l10n),
                    icon: Icons.next_plan,
                  ),

                if (action.unitPrice != null)
                  DetailCard(
                    label: l10n.unitPrice,
                    value: ActionHelper.formatCurrency(action.unitPrice),
                    icon: Icons.attach_money,
                  ),

                if (action.rentalDuration != null)
                  DetailCard(
                    label: l10n.rentalDuration,
                    value: ActionHelper.formatDuration(
                      action.rentalDuration,
                      l10n,
                    ),
                    icon: Icons.schedule,
                  ),

                if (action.rentalCost != null)
                  DetailCard(
                    label: l10n.rentalCost,
                    value: ActionHelper.formatCurrency(action.rentalCost),
                    icon: Icons.payments,
                  ),

                if (action.meetingType != null)
                  DetailCard(
                    label: l10n.meetingType,
                    value: ActionHelper.getMeetingType(
                      action.meetingType,
                      l10n,
                    ),
                    icon: Icons.video_call,
                  ),

                if (action.meetingLocation != null)
                  DetailCard(
                    label: l10n.meetingLocation,
                    value: ActionHelper.getMeetingLocation(
                      action.meetingLocation,
                      l10n,
                    ),
                    icon: Icons.location_on,
                  ),

                if (!ActionHelper.isNullOrEmpty(action.cancelReason))
                  DetailCard(
                    label: l10n.cancelReason,
                    value: action.cancelReason!,
                    icon: Icons.cancel_outlined,
                    isLongText: true,
                  ),

                if (!ActionHelper.isNullOrEmpty(action.notes))
                  DetailCard(
                    label: l10n.notes,
                    value: action.notes!,
                    icon: Icons.note,
                    isLongText: true,
                  ),

                DetailCard(
                  label: l10n.createdAt,
                  value: action.createdAt.toString().toFormattedDate(l10n),
                  icon: Icons.add_circle_outline,
                ),

                DetailCard(
                  label: l10n.updatedAt,
                  value: action.updatedAt.toString().toFormattedDate(l10n),
                  icon: Icons.update,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
