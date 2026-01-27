import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/theming/Icons.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/constant/enums/enums..dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/logic/Features/Communcation_cubit.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/clients/ui/screens/ContactAction/Clients_details.dart';
import 'package:crm/logic/Features/communcation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsListScreen extends StatelessWidget {
  const ClientsListScreen({super.key, required this.lead});
  final List<Lead> lead;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommunicationCubit(),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: lead.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final currentLead = lead[index];

          return BlocListener<CommunicationCubit, CommunicationState>(
            listener: (context, state) {
              if (state is CommunicationError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is CommunicationSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Action completed successfully'),
                  ),
                );
              }
            },
            child: ClientCard(
              lead: currentLead,
              onCall: () {
                context.read<CommunicationCubit>().makePhoneCall(
                  currentLead.phone ?? '',
                );
              },
              onWhatsapp: () {
                context.read<CommunicationCubit>().whatsapp(
                  phone: currentLead.phone ?? "",
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ClientCard extends StatelessWidget {
  final Lead lead;
  final VoidCallback onCall;
  final VoidCallback onWhatsapp;

  const ClientCard({
    super.key,
    required this.lead,
    required this.onCall,
    required this.onWhatsapp,
  });

  IconData _getLeadSourceIcon(String? sourceName) {
    if (sourceName == null) return Icons.source_outlined;

    final lowerSource = sourceName.toLowerCase();
    if (lowerSource.contains('facebook')) {
      return Icons.facebook_outlined;
    } else if (lowerSource.contains('whatsapp')) {
      return MyFlutterApp.whatsapp;
    } else if (lowerSource.contains('instagram')) {
      return Icons.camera_alt_outlined;
    } else if (lowerSource.contains('linkedin')) {
      return Icons.business_center_outlined;
    } else if (lowerSource.contains('website') || lowerSource.contains('web')) {
      return Icons.language_outlined;
    } else if (lowerSource.contains('google')) {
      return Icons.email_outlined;
    } else if (lowerSource.contains('direct') || lowerSource.contains('call')) {
      return Icons.phone_outlined;
    } else {
      return Icons.source_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final statusColor = getStatusColor(lead.status ?? 0);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : Colors.white,
        border: Border.all(color: isDark ? Colors.white : divColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  lead.fullName ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : secondaryTextColor,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: isDark ? Colors.white : secondaryTextColor,
                  size: 25,
                ),
              ),
            ],
          ),

          // Phone
          const SizedBox(height: 4),
          Row(
            children: [
              infoChip(
                Icons.phone_outlined,
                lead.phone ?? "",
                isDark ? Colors.white : secondaryTextColor,
              ),
              Spacer(),
              infoChip(
                Icons.calendar_month_outlined,
                lead.createdAt!.toFormattedDate(appLocalizations),
                isDark ? Colors.white : secondaryTextColor,
              ),
            ],
          ),
          const SizedBox(height: 8),

          if (lead.secondaryPhone != null &&
              lead.secondaryPhone!.isNotEmpty) ...[
            const SizedBox(height: 4),
            infoChip(
              Icons.phone_android_outlined,
              lead.secondaryPhone!,
              isDark ? Colors.white : secondaryTextColor,
            ),
          ],

          const SizedBox(height: 8),

          Row(
            children: [
              if (lead.leadProjects != null)
                Tag(
                  color: isDark ? darkColor : divColor,
                  iconColor: isDark ? Colors.white : secondaryTextColor,
                  icon: Icons.business_sharp,
                  text:
                      '${lead.leadProjects!.length} ${lead.leadProjects!.length == 1 ? 'Project' : 'Projects'}',
                ),
              if (lead.leadProjects != null) const SizedBox(width: 10),

              if (lead.leadSource != null)
                Tag(
                  color: isDark ? darkColor : divColor,
                  iconColor: isDark ? Colors.white : secondaryTextColor,
                  icon: _getLeadSourceIcon(lead.leadSource!.sourceName),
                  text: lead.leadSource!.sourceName,
                ),
              const Spacer(),

              StatusTag(
                status: getStatusText(lead.status ?? 0, appLocalizations),
                color: statusColor,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Buttons Row with BlocBuilder to disable buttons when loading
          BlocBuilder<CommunicationCubit, CommunicationState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      height: 40,
                      text: appLocalizations.details,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return FractionallySizedBox(
                              child: ClientsDetails(lead: lead),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ActionButton(
                    icon: MyFlutterApp.whatsapp,
                    onTap: onWhatsapp,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 10),

                  ActionButton(
                    icon: Icons.call_outlined,
                    onTap: onCall,
                    color: Colors.green,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// Small, efficient reusable UI widgets

class Tag extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Color? iconColor;
  const Tag({
    super.key,
    required this.icon,
    required this.text,
    this.color,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 5),
          Text(text, style: TextStyle(fontSize: 12, color: iconColor)),
        ],
      ),
    );
  }
}

class StatusTag extends StatelessWidget {
  final String status;
  final Color color;
  const StatusTag({super.key, required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(status, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}
