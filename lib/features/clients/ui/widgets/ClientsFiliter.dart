import 'package:crm/features/clients/logic/cubit/filiter_cubit.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/language/localazation.dart'; // Ensure correct path
import 'package:crm/Core/widgets/buttons.dart'; // For FloatingCloseButton

// --- 1. DATA MODEL ---

class FilterItem {
  final int index;
  final String Function(AppLocalizations) label;
  final IconData? icon;

  FilterItem({required this.index, required this.label, this.icon});
}

// Data for Client Status (Horizontal Bar)
final List<FilterItem> clientStatusFilters = [
  FilterItem(index: 1, label: (l) => l.allClients),
  FilterItem(index: 2, label: (l) => l.myClients),
  FilterItem(index: 3, label: (l) => l.newClients),
  FilterItem(index: 4, label: (l) => l.deferredClients),
  FilterItem(index: 5, label: (l) => l.followUp),
  FilterItem(index: 6, label: (l) => l.rent),
  FilterItem(index: 7, label: (l) => l.comment),
  FilterItem(index: 8, label: (l) => l.reservation),
  FilterItem(index: 9, label: (l) => l.interest),
  FilterItem(index: 10, label: (l) => l.archive),
  FilterItem(index: 11, label: (l) => l.meeting),
  FilterItem(index: 12, label: (l) => l.followAfterMeeting),
  FilterItem(index: 13, label: (l) => l.meetingSchedule),
  FilterItem(index: 14, label: (l) => l.sold),
  FilterItem(index: 15, label: (l) => l.newLabel),
  FilterItem(index: 16, label: (l) => l.cancel),
];

// Data for Client Details (Bottom Sheet)
final List<FilterItem> clientDetailsFilters = [
  FilterItem(index: 18, label: (l) => l.details),
  FilterItem(index: 19, label: (l) => l.comments),
  FilterItem(index: 20, label: (l) => l.attachments),
  FilterItem(index: 21, label: (l) => l.timeline),
  FilterItem(index: 22, label: (l) => l.deals),
  FilterItem(index: 23, label: (l) => l.chances),
  FilterItem(index: 24, label: (l) => l.cliRequest),
  FilterItem(index: 25, label: (l) => l.contracts),
  FilterItem(index: 26, label: (l) => l.paymentPlan),
  FilterItem(index: 27, label: (l) => l.checkIn),
];

// --- 2. MAIN FILTER SECTION ---

class ClientsFilterSection extends StatelessWidget {
  const ClientsFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: clientStatusFilters.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          if (i == 0) {
            return const FilterButton(
              index: 0,
              icon: Icons.now_widgets_outlined,
            );
          }
          final item = clientStatusFilters[i - 1];
          return FilterButton(
            index: item.index,
            label: item.label(appLocalizations),
          );
        },
      ),
    );
  }
}

// --- 3. REUSABLE FILTER BUTTON ---

class FilterButton extends StatelessWidget {
  final int index;
  final IconData? icon;
  final String? label;
  final VoidCallback? onTap;

  const FilterButton({
    super.key,
    required this.index,
    this.icon,
    this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<FiliterCubit, int>(
      buildWhen: (prev, curr) => prev == index || curr == index,
      builder: (context, selectedIndex) {
        final bool isSelected = selectedIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? appColor : (isDark ? darkColor : Colors.white),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : (isDark ? darkBorder : Colors.grey.shade300),
            ),
          ),
          child: InkWell(
            onTap: () {
              context.read<FiliterCubit>().change(index);
              if (index == 0) _showSheet(context, const AllClientFilter());
              if (index == 17)
                _showSheet(context, const AllClientDetailsFilter());
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Center(
                child: icon != null
                    ? Icon(
                        icon,
                        color: isSelected ? Colors.white : secondaryTextColor,
                        size: 20,
                      )
                    : Text(
                        label ?? '',
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : (isDark ? Colors.white70 : Colors.black87),
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSheet(BuildContext context, Widget content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => content,
    );
  }
}

// --- 4. BOTTOM SHEETS ---

class GenericFilterSheet extends StatelessWidget {
  final String title;
  final List<FilterItem> items;

  const GenericFilterSheet({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50), // Space for status bar
        const FloatingCloseButton(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? darkColor : Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.now_widgets_outlined,
                      color: isDark ? Colors.white : appColor,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 30),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 3.2,
                        ),
                    itemCount: items.length,
                    itemBuilder: (context, i) => FilterButton(
                      index: items[i].index,
                      label: items[i].label(appLocalizations),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AllClientFilter extends StatelessWidget {
  const AllClientFilter({super.key});
  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return BlocProvider(
      create: (context) => FiliterCubit(),
      child: GenericFilterSheet(
        title: appLocalizations.deals,
        items: clientStatusFilters,
      ),
    );
  }
}

class AllClientDetailsFilter extends StatelessWidget {
  const AllClientDetailsFilter({super.key});
  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return GenericFilterSheet(
      title: appLocalizations.clientDetails,
      items: clientDetailsFilters,
    );
  }
}
