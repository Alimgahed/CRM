import 'package:crm/Core/theming/theme.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalsSection extends StatelessWidget {
  final AgentActionStatisticsResponse data;

  const TotalsSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final locale = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    ); // Use a list of cards to reduce duplication
    final List<TotalItem> items = [
      TotalItem(title: locale.newDeals, amount: data.data.newDeals.toString()),
      TotalItem(title: locale.conversionRate, ratio: data.data.conversionRate),
      TotalItem(
        title: locale.newClients,
        amount: data.data.newClients.toString(),
      ),
      TotalItem(
        title: locale.totalSales,
        amount: data.data.totalSales.toString(),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i += 2)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(child: TotalCard(item: items[i])),
                  const SizedBox(width: 12),
                  Expanded(child: TotalCard(item: items[i + 1])),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Model class for a single total card
class TotalItem {
  final String title;
  final String? amount;
  final double? ratio;

  TotalItem({required this.title, this.amount, this.ratio});
}

/// Single card widget
class TotalCard extends StatelessWidget {
  final TotalItem item;

  const TotalCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPositive = (item.ratio ?? 0) >= 0;
    final percentageColor = item.ratio != null
        ? (isPositive ? successColor : warningColor)
        : Colors.transparent;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: isDark
          ? AppDecorations.darkContainer
          : AppDecorations.lightContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.size12(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : primaryTextColor,
            ),
          ),
          const SizedBox(height: 10),

          /// Percentage chip
          if (item.ratio != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: percentageColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${(item.ratio!.abs() * 100).toStringAsFixed(1)}%',
                    style: TextStyles.size12(
                      fontWeight: FontWeight.w600,
                      color: percentageColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 12,
                    color: percentageColor,
                  ),
                ],
              ),
            ),

          const SizedBox(height: 12),

          if (item.amount != null)
            Text(
              item.amount!,
              style: TextStyles.size16(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : primaryTextColor,
              ),
            ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
