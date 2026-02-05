import 'package:crm/features/clients/logic/cubit/filiter_cubit.dart';
import 'package:crm/features/clients/logic/cubit/leads_cubit.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/Core/widgets/buttons.dart';

class FilterItem {
  final int index;
  final String Function(AppLocalizations) label;
  final IconData? icon;

  const FilterItem({required this.index, required this.label, this.icon});
}

final List<FilterItem> clientStatusFilters = [
  FilterItem(index: 0, label: (l) => l.allClients),
  FilterItem(index: 1, label: (l) => l.newClients),
  FilterItem(index: 2, label: (l) => l.conected),
  FilterItem(index: 3, label: (l) => l.qualified),
  FilterItem(index: 4, label: (l) => l.deals),
  FilterItem(index: 5, label: (l) => l.customer),
];

final List<FilterItem> clientDetailsFilters = [
  FilterItem(index: 100, label: (l) => l.details),
  FilterItem(index: 101, label: (l) => l.comments),
  FilterItem(index: 102, label: (l) => l.attachments),
  FilterItem(index: 103, label: (l) => l.timeline),
  FilterItem(index: 104, label: (l) => l.deals),
  FilterItem(index: 105, label: (l) => l.chances),
  FilterItem(index: 106, label: (l) => l.cliRequest),
  FilterItem(index: 107, label: (l) => l.contracts),
  FilterItem(index: 108, label: (l) => l.paymentPlan),
  FilterItem(index: 109, label: (l) => l.checkIn),
];

/// =======================
/// 3. FILTER BAR
/// =======================

class ClientsFilterSection extends StatelessWidget {
  const ClientsFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.select<LocaleCubit, AppLocalizations>(
      (c) => AppLocalizations(c.currentLocale),
    );

    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterButton(
                index: 6,
                label: loc.allClients,
                icon: Icons.now_widgets_outlined,
              ),
              const SizedBox(width: 8),
              ...clientStatusFilters.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterButton(
                    index: item.index,
                    label: item.label(loc),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =======================
/// 4. FILTER BUTTON
/// =======================

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
    final loc = context.select<LocaleCubit, AppLocalizations>(
      (c) => AppLocalizations(c.currentLocale),
    );

    return BlocBuilder<FiliterCubit, int>(
      buildWhen: (prev, curr) => prev == index || curr == index,
      builder: (context, selectedIndex) {
        final isSelected = selectedIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            gradient: isSelected ? appGradient : null,
            color: isSelected
                ? appColor
                : (isDark ? darkFieldColor : Colors.white),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : (isDark ? darkBorder : Colors.grey.shade300),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              /// 1️⃣ Custom behavior (OTHER SCREENS)
              if (onTap != null) {
                onTap!();
                return;
              }

              /// 2️⃣ Default filter behavior
              context.read<FiliterCubit>().change(index);
              context.read<LeadsCubit>().filterByStatus(index);

              if (index == 6) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      // Reuse existing FiliterCubit
                      BlocProvider.value(value: context.read<FiliterCubit>()),

                      // Reuse existing LeadsCubit
                      BlocProvider.value(value: context.read<LeadsCubit>()),

                      // You can add more cubits here if needed
                      // BlocProvider.value(value: context.read<AnotherCubit>()),
                    ],
                    child: GenericFilterSheet(
                      title: loc.allcliientfilter,
                      items: clientStatusFilters,
                    ),
                  ),
                );
              }
            },
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
}

/// =======================
/// 5. GENERIC SHEET
/// =======================

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
    final loc = context.select<LocaleCubit, AppLocalizations>(
      (c) => AppLocalizations(c.currentLocale),
    );

    /// Wrap Column with SingleChildScrollView to avoid layout errors
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FloatingCloseButton(),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 30),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 3.2,
                        ),
                    itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FilterButton(
                        index: items[i].index,
                        label: items[i].label(loc),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
