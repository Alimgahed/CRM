import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/constant/enums/actioins_enms.dart';
import 'package:crm/features/actions/logic/cubit/get_all_lead_action_cubit.dart';
import 'package:crm/features/actions/logic/state/lead_action_state.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientTimeline extends StatelessWidget {
  final int leadid;
  const ClientTimeline({super.key, required this.leadid});

  void _showActionDetails(BuildContext context, LeadActionModel action) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => _ActionDetailsSheet(
          action: action,
          scrollController: scrollController,
        ),
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
              return const Center(child: Text('لا توجد إجراءات'));
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
                    IconButton(
                      icon: const Icon(Icons.remove_red_eye, size: 20),
                      onPressed: () => _showActionDetails(context, action),
                      color: Colors.blue,
                    ),
                  ];
                })
                .toList(growable: false);

            return CustomTable(headers: headers, rows: rows, height: 300);
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
  final ScrollController scrollController;

  const _ActionDetailsSheet({
    required this.action,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        controller: scrollController,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'تفاصيل الإجراء',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _DetailCard(
            label: 'المنفذ',
            value: ActionHelper.valueOrDefault(action.user?.fullName),
            icon: Icons.person,
          ),
          _DetailCard(
            label: 'نوع الإجراء',
            value: ActionHelper.getActionType(
              ActionType.fromValue(action.actionType) ?? ActionType.call,
              appLocalizations,
            ),
            icon: Icons.work_outline,
          ),
          _DetailCard(
            label: 'تاريخ الإجراء',
            value: (action.actionDate.toString().toFormattedDate(
              appLocalizations,
            )),
            icon: Icons.calendar_today,
          ),
          _DetailCard(
            label: 'تم الرد',
            value: action.isAnswered == true ? 'نعم' : 'لا',
            icon: action.isAnswered == true ? Icons.check_circle : Icons.cancel,
            iconColor: action.isAnswered == true ? Colors.green : Colors.red,
          ),
          if (action.nextFollow != null)
            _DetailCard(
              label: 'المتابعة التالية',
              value: ActionHelper.getNextFollow(
                action.nextFollow,
                appLocalizations,
              ),
              icon: Icons.next_plan,
            ),
          if (action.unitPrice != null)
            _DetailCard(
              label: 'سعر الوحدة',
              value: ActionHelper.formatCurrency(action.unitPrice),
              icon: Icons.attach_money,
            ),
          if (action.rentalDuration != null)
            _DetailCard(
              label: 'مدة الإيجار',
              value: ActionHelper.formatDuration(
                action.rentalDuration,
                appLocalizations,
              ),
              icon: Icons.schedule,
            ),
          if (action.rentalCost != null)
            _DetailCard(
              label: 'تكلفة الإيجار',
              value: ActionHelper.formatCurrency(action.rentalCost),
              icon: Icons.payments,
            ),
          if (action.meetingType != null)
            _DetailCard(
              label: 'نوع الاجتماع',
              value: ActionHelper.getMeetingType(
                action.meetingType,
                appLocalizations,
              ),
              icon: Icons.video_call,
            ),
          if (action.meetingLocation != null)
            _DetailCard(
              label: 'موقع الاجتماع',
              value: ActionHelper.getMeetingLocation(
                action.meetingLocation,
                appLocalizations,
              ),
              icon: Icons.location_on,
            ),
          if (!ActionHelper.isNullOrEmpty(action.cancelReason))
            _DetailCard(
              label: 'سبب الإلغاء',
              value: action.cancelReason!,
              icon: Icons.cancel_outlined,
              isLongText: true,
            ),
          if (!ActionHelper.isNullOrEmpty(action.notes))
            _DetailCard(
              label: 'ملاحظات',
              value: action.notes!,
              icon: Icons.note,
              isLongText: true,
            ),
          _DetailCard(
            label: 'تاريخ الإنشاء',
            value: action.createdAt.toString().toFormattedDate(
              appLocalizations,
            ),
            icon: Icons.add_circle_outline,
          ),
          _DetailCard(
            label: 'آخر تحديث',
            value: action.updatedAt.toString().toFormattedDate(
              appLocalizations,
            ),
            icon: Icons.update,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// Reusable detail card widget for better performance
class _DetailCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? iconColor;
  final bool isLongText;

  const _DetailCard({
    required this.label,
    required this.value,
    required this.icon,
    this.iconColor,
    this.isLongText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: isLongText
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor ?? Colors.blue, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
