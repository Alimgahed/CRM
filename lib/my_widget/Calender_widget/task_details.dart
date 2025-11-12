import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';


class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget valueWidget;

  const DetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.valueWidget,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(icon, color: secondaryTextColor),
              const SizedBox(width: 10),
              Text(
                label,
                style: textTheme.bodyMedium?.copyWith(
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Expanded(child: valueWidget),
      ],
    );
  }
}
