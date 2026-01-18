import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/features/tasks/data/model/task_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;
  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.grey.shade50],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title and Status Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatusChip(task.status ?? 0, appLocalizations),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          task.title ?? 'No Title',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1C1E),
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Description
                  if (task.description != null &&
                      task.description!.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Text(
                        task.description!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  // Date Cards Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateCard(
                          icon: Icons.event_outlined,
                          label: 'Due Date',
                          value:
                              task.dueDate?.toString().toFormattedDate(
                                appLocalizations,
                              ) ??
                              '-',
                          color: const Color(0xFFF44336),
                          gradient: [Colors.red.shade50, Colors.red.shade100],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDateCard(
                          icon: Icons.schedule_outlined,
                          label: 'Created',
                          value:
                              task.createdAt?.toString().toFormattedDate(
                                appLocalizations,
                              ) ??
                              '-',
                          color: const Color(0xFF2196F3),
                          gradient: [Colors.blue.shade50, Colors.blue.shade100],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // People Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Created By
                        Expanded(
                          child: _buildUserInfo(
                            label: 'Created By',
                            user: task.createdBy,
                            fallback: 'Unknown',
                            align: CrossAxisAlignment.start,
                          ),
                        ),

                        Container(
                          width: 1.5,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.grey.shade200,
                                Colors.grey.shade400,
                                Colors.grey.shade200,
                              ],
                            ),
                          ),
                        ),

                        // Assigned To
                        Expanded(
                          child: _buildUserInfo(
                            label: appLocalizations.assignedTo,
                            user: task.assignedTo,
                            fallback: 'Unassigned',
                            align: CrossAxisAlignment.end,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Task Status Footer
                  if (task.isDeleted == true) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delete_outline,
                            size: 16,
                            color: Colors.red.shade700,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'This task has been deleted',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build date card with gradient background
  Widget _buildDateCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required List<Color> gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24, color: color),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Build user info section
  Widget _buildUserInfo({
    required String label,
    required dynamic user,
    required String fallback,
    required CrossAxisAlignment align,
  }) {
    final userName = user?.fullName ?? fallback;
    final photoUrl = user?.photoUrl;
    final isAssigned = user != null;

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: isAssigned
                    ? Colors.blue.shade100
                    : Colors.grey.shade300,
                backgroundImage: photoUrl != null && photoUrl.isNotEmpty
                    ? NetworkImage(photoUrl)
                    : null,
                child: photoUrl == null || photoUrl.isEmpty
                    ? Icon(
                        Icons.person,
                        size: 22,
                        color: isAssigned
                            ? Colors.blue.shade700
                            : Colors.grey.shade600,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                userName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isAssigned
                      ? const Color(0xFF1A1C1E)
                      : Colors.grey.shade500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Build status chip
  Widget _buildStatusChip(int status, AppLocalizations loc) {
    Color color = _getStatusColor(status);
    String text = _getStatusText(status);
    IconData icon = _getStatusIcon(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for status
  Color _getStatusColor(int status) {
    switch (status) {
      case 1:
        return const Color(0xFFF44336); // Urgent - Red
      case 2:
        return const Color(0xFF2196F3); // Normal - Blue
      default:
        return const Color(0xFFFFC107); // Low - Amber
    }
  }

  String _getStatusText(int status) {
    switch (status) {
      case 1:
        return 'Urgent';
      case 2:
        return 'Normal';
      default:
        return 'Low';
    }
  }

  IconData _getStatusIcon(int status) {
    switch (status) {
      case 1:
        return Icons.priority_high_rounded;
      case 2:
        return Icons.flag_rounded;
      default:
        return Icons.low_priority_rounded;
    }
  }
}
