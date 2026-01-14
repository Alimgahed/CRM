import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:crm/features/clients/logic/cubit/filiter_cubit.dart';
import 'package:crm/features/clients/ui/widgets/ClienTtimeLine.dart';
import 'package:crm/features/clients/ui/widgets/ClientChance.dart';
import 'package:crm/features/clients/ui/widgets/ClientCli.dart';
import 'package:crm/features/clients/ui/widgets/ClientComments.dart';
import 'package:crm/features/clients/ui/widgets/ClientDeals.dart';
import 'package:crm/features/clients/ui/widgets/Clientattachment.dart';
import 'package:crm/features/clients/ui/widgets/Clientmore.dart';
import 'package:crm/features/clients/ui/widgets/ClientsFiliter.dart';
import 'package:crm/features/clients/ui/widgets/Clientsdetails.dart';
import 'package:crm/features/actions/ui/screens/add_client.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientsDetails extends StatelessWidget {
  const ClientsDetails({super.key, required this.lead});

  final Lead lead;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return BlocProvider(
      create: (context) => FiliterCubit(),
      child: Builder(
        builder: (context) {
          final filterCubit = context.read<FiliterCubit>();

          final List<Map<String, dynamic>> actionButtons = [
            {
              'icon': Icons.remove_red_eye_outlined,
              'index': 18,
              'onTap': () => filterCubit.change(18),
            },
            {
              'icon': Icons.add_box,
              'index': 28,
              'onTap': () {
                filterCubit.change(28);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => FractionallySizedBox(
                    heightFactor: 0.8,
                    child: const AddClient(),
                  ),
                );
              },
            },
            {
              'icon': Icons.edit_outlined,
              'index': 29,
              'onTap': () {
                // Open edit client screen/modal
              },
            },
            {
              'icon': Icons.people_alt_outlined,
              'index': 30,
              'onTap': () {
                // Show client contacts
              },
            },
            {
              'icon': Icons.more_vert_outlined,
              'index': 31,
              'onTap': () {
                filterCubit.change(31);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) =>
                      const FractionallySizedBox(child: Clientmore()),
                );
              },
            },
          ];

          final List<dynamic> filters = [
            {'index': 17, 'icon': Icons.now_widgets_outlined},
            {'index': 18, 'label': appLocalizations.details},
            {'index': 19, 'label': appLocalizations.comments},
            {'index': 20, 'label': appLocalizations.attachments},
            {'index': 21, 'label': appLocalizations.timeline},
            {'index': 22, 'label': appLocalizations.deals},
            {'index': 23, 'label': appLocalizations.chances},
            {'index': 24, 'label': appLocalizations.cliRequest},
            {'index': 25, 'label': appLocalizations.contracts},
            {'index': 26, 'label': appLocalizations.paymentPlan},
            {'index': 27, 'label': appLocalizations.checkIn},
          ];

          return SingleChildScrollView(
            child: Column(
              children: [
                const FloatingCloseButton(),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: isDark ? darkColor : Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, -1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with Client Name
                      Row(
                        children: [
                          const Icon(Icons.contact_emergency_outlined),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lead.fullName,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                if (lead.jobTitle.isNotEmpty)
                                  Text(
                                    lead.jobTitle,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(color: secondaryTextColor),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Action Buttons
                      Wrap(
                        spacing: 8,
                        children: actionButtons
                            .map(
                              (btn) => _ActionIconButton(
                                icon: btn['icon'],
                                onTap: btn['onTap'],
                                index: btn['index'],
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 15),

                      // Filter Buttons (Horizontal Scroll)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: filters.map((filter) {
                              if (filter.containsKey('icon')) {
                                return Row(
                                  children: [
                                    FilterButton(
                                      index: filter['index'],
                                      icon: filter['icon'],
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                );
                              }
                              return Row(
                                children: [
                                  FilterButton(
                                    index: filter['index'],
                                    label: filter['label'],
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      // Details Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 18) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: DetailsWidget(lead: lead),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // Comments Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 19) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Clientcomments(leadid: lead.leadId),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // Timeline Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 21) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: ClientTimeline(leadid: lead.leadId),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // Attachments Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 20) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: ClientAttachment(
                                attachments: lead.attchments ?? [],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // Deals Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 22) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: ClientDeals(leadid: lead.leadId),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // Chances Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 23) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Clientchance(leadid: lead.leadId),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // CLI Request Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 24) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Clientcli(leadid: lead.leadId),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      // Contracts Widget
                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 25) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: ClientAttachment(
                                attachments: lead.contracts ?? [],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),

                      BlocBuilder<FiliterCubit, int>(
                        builder: (context, selectedFilter) {
                          if (selectedFilter == 100) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: ClientDealsList(
                                deals: [
                                  ClientDeal(
                                    unitNumber: 'وحدة#1',
                                    projectInfo: 'مشروع النخيل - شقة - 120 م²',
                                    totalPrice: '500,000 جنيه',
                                    status: 'مباع',
                                  ),
                                  ClientDeal(
                                    unitNumber: 'وحدة#2',
                                    projectInfo: 'مشروع النخيل - فيلا - 200 م²',
                                    totalPrice: '1,200,000 جنيه',
                                    status: 'متاحة',
                                  ),
                                  ClientDeal(
                                    unitNumber: 'وحدة#3',
                                    projectInfo: 'مشروع الواحة - شقة - 90 م²',
                                    totalPrice: '350,000 جنيه',
                                    status: 'محجوزة',
                                  ),
                                  ClientDeal(
                                    unitNumber: 'وحدة#4',
                                    projectInfo: 'مشروع الواحة - فيلا - 180 م²',
                                    totalPrice: '1,000,000 جنيه',
                                    status: 'مباع',
                                  ),
                                  ClientDeal(
                                    unitNumber: 'وحدة#5',
                                    projectInfo: 'مشروع النخيل - شقة - 110 م²',
                                    totalPrice: '480,000 جنيه',
                                    status: 'متاحة',
                                  ),
                                ],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final int index;

  const _ActionIconButton({
    super.key, // Added super.key for best practice
    required this.icon,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocBuilder<FiliterCubit, int>(
      buildWhen: (prev, curr) => prev == index || curr == index,
      builder: (context, selectedFilter) {
        final bool isSelected = selectedFilter == index;

        // 1. Background Color Logic
        final Color backgroundColor = isSelected
            ? (isDark
                  ? appColor.withOpacity(0.8)
                  : appColor) // Subtle glow in dark mode
            : (isDark ? darkColor : Colors.white);

        // 2. Border Color Logic
        final Color borderColor = isSelected
            ? (isDark ? Colors.white70 : appColor)
            : (isDark ? darkBorder : appColor.withOpacity(0.5));

        // 3. Icon Color Logic
        final Color iconColor = isSelected
            ? Colors
                  .white // High contrast for selection
            : (isDark ? Colors.white70 : Colors.black87);

        return AnimatedContainer(
          // Smooth transition between colors
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Material(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: Container(
                width: 55,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
