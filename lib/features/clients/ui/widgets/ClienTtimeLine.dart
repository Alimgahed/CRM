import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/actions/logic/cubit/action_cubit.dart';
import 'package:crm/features/actions/logic/state/lead_action_state.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ClientTimeline extends StatelessWidget {
  final String leadid;
  const ClientTimeline({super.key, required this.leadid});

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  String _getActionType(int? type) {
    switch (type) {
      case 1:
        return 'CALL';
      case 2:
        return 'CANCELLED';
      case 3:
        return 'INTERESTED';
      case 4:
        return 'DEAL';
      case 5:
        return 'BOOKED';
      case 6:
        return 'MEETING';
      case 7:
        return 'RENTAL';
      default:
        return '-';
    }
  }

  String _getNextFollow(int? type) {
    switch (type) {
      case 1:
        return 'HOURS';
      case 2:
        return 'TWO_HOURS';
      case 3:
        return 'NEXT_DAY';
      case 4:
        return 'NEXT_WEEK';
      default:
        return '-';
    }
  }

  String _getMeetingType(int? type) {
    switch (type) {
      case 1:
        return 'عبر الإنترنت';
      case 2:
        return 'وجهاً لوجه';
      default:
        return '-';
    }
  }

  String _getMeetingLocation(int? location) {
    switch (location) {
      case 1:
        return 'المكتب';
      case 2:
        return 'موقع العميل';
      case 3:
        return 'موقع آخر';
      default:
        return '-';
    }
  }

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
        builder: (context, scrollController) =>
            _buildDetailsSheet(context, action, scrollController),
      ),
    );
  }

  Widget _buildDetailsSheet(
    BuildContext context,
    LeadActionModel action,
    ScrollController scrollController,
  ) {
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
          Text(
            'تفاصيل الإجراء',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildDetailCard(
            'المنفذ',
            action.user?.fullName ?? '-',
            Icons.person,
          ),
          _buildDetailCard(
            'نوع الإجراء',
            _getActionType(action.actionType),
            Icons.work_outline,
          ),
          _buildDetailCard(
            'تاريخ الإجراء',
            _formatDate(action.actionDate),
            Icons.calendar_today,
          ),
          _buildDetailCard(
            'تم الرد',
            action.isAnswered == true ? 'نعم' : 'لا',
            action.isAnswered == true ? Icons.check_circle : Icons.cancel,
            iconColor: action.isAnswered == true ? Colors.green : Colors.red,
          ),
          if (action.nextFollow != null)
            _buildDetailCard(
              'المتابعة التالية',
              _getNextFollow(action.nextFollow),
              Icons.next_plan,
            ),
          if (action.unitPrice != null)
            _buildDetailCard(
              'سعر الوحدة',
              action.unitPrice.toString(),
              Icons.attach_money,
            ),
          if (action.rentalDuration != null)
            _buildDetailCard(
              'مدة الإيجار',
              '${action.rentalDuration} شهر',
              Icons.schedule,
            ),
          if (action.rentalCost != null)
            _buildDetailCard(
              'تكلفة الإيجار',
              action.rentalCost.toString(),
              Icons.payments,
            ),
          if (action.meetingType != null)
            _buildDetailCard(
              'نوع الاجتماع',
              _getMeetingType(action.meetingType),
              Icons.video_call,
            ),
          if (action.meetingLocation != null)
            _buildDetailCard(
              'موقع الاجتماع',
              _getMeetingLocation(action.meetingLocation),
              Icons.location_on,
            ),
          if (action.cancelReason != null && action.cancelReason!.isNotEmpty)
            _buildDetailCard(
              'سبب الإلغاء',
              action.cancelReason!,
              Icons.cancel_outlined,
              isLongText: true,
            ),
          if (action.notes != null && action.notes!.isNotEmpty)
            _buildDetailCard(
              'ملاحظات',
              action.notes!,
              Icons.note,
              isLongText: true,
            ),
          _buildDetailCard(
            'تاريخ الإنشاء',
            _formatDate(action.createdAt),
            Icons.add_circle_outline,
          ),
          _buildDetailCard(
            'آخر تحديث',
            _formatDate(action.updatedAt),
            Icons.update,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDetailCard(
    String label,
    String value,
    IconData icon, {
    Color? iconColor,
    bool isLongText = false,
  }) {
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

  @override
  Widget build(BuildContext context) {
    final headers = ['المنفذ', 'التاريخ', 'نوع الإجراء', 'عرض'];

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
                      action.user?.fullName ?? '-',
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _formatDate(action.actionDate),
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _getActionType(action.actionType),
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
