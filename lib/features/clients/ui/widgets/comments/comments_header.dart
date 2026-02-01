import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

class CommentsHeader extends StatelessWidget {
  final AppLocalizations localizations;
  const CommentsHeader({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.comment_rounded,
              color: Colors.blue.shade700,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.comments,
                  style: TextStyles.size16(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  localizations.allCommentsandFollowups,
                  style: TextStyles.size12(color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
