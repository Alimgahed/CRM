import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/theming/theme.dart';
import 'package:crm/features/home/data/model/model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalsSection extends StatelessWidget {
  final AgentActionStatisticsResponse data;

  const TotalsSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Excellent use of select!
    final locale = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    // 1. Logic extracted to a local variable to keep build clean
    final items = _generateItems(locale);

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 0),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i += 2)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(child: TotalCard(item: items[i])),
                  const SizedBox(width: 12),
                  // 2. Added safety check for odd-numbered lists
                  Expanded(
                    child: (i + 1 < items.length)
                        ? TotalCard(item: items[i + 1])
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<TotalItem> _generateItems(AppLocalizations locale) {
    final stats = data.data;
    return [
      TotalItem(title: locale.newDeals, amount: stats.newDeals.toString()),
      TotalItem(title: locale.conversionRate, ratio: stats.conversionRate),
      TotalItem(title: locale.newClients, amount: stats.newClients.toString()),
      TotalItem(
        title: locale.totalSales,
        amount: stats.totalSales.toDecimalPrice(),
      ),
    ];
  }
}

class TotalCard extends StatelessWidget {
  final TotalItem item;
  const TotalCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // 3. Performance: Move Theme lookup to the top
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // 4. Pre-calculate values to keep the UI tree lean
    final ratio = item.ratio ?? 0;
    final isPositive = ratio >= 0;
    final percentageColor = item.ratio != null
        ? (isPositive ? successColor : warningColor)
        : Colors.transparent;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: isDark
          ? AppDecorations.darkContainer
          : AppDecorations.lightContainer,
      child: Column(
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

          if (item.ratio != null)
            _buildPercentageChip(percentageColor, ratio, isPositive),

          const SizedBox(height: 12),

          if (item.amount != null)
            Text(
              item.amount!,
              style: TextStyles.size16(
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : primaryTextColor,
              ),
            ),
        ],
      ),
    );
  }

  // 5. Helper method to reduce nesting in the main build tree
  Widget _buildPercentageChip(Color color, double ratio, bool isPositive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${(ratio.abs() * 100).toStringAsFixed(1)}%',
            style: TextStyles.size12(fontWeight: FontWeight.w600, color: color),
          ),
          const SizedBox(width: 4),
          Icon(
            isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            size: 12,
            color: color,
          ),
        ],
      ),
    );
  }
}
