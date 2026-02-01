import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/clients/data/model/comment_response.dart';
import 'package:crm/features/clients/ui/widgets/comments/comment_widget.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  final List<CommentModel> comments;
  final int leadid;
  final AppLocalizations localizations;
  const CommentsList({
    super.key,
    required this.comments,
    required this.localizations,
    required this.leadid,
  });

  @override
  Widget build(BuildContext context) {
    return comments.isEmpty
        ? SizedBox(
            height: 300,
            child: _EmptyState(localizations: localizations),
          )
        : ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: comments.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final comment = comments[index];
                return ClientCommentItem(
                  comment: comment,
                  leadId: leadid,
                  l10n: localizations,
                );
              },
            ),
          );
  }
}

class _EmptyState extends StatelessWidget {
  final AppLocalizations localizations;
  const _EmptyState({required this.localizations});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            localizations.noComments,
            style: TextStyles.size16(color: Colors.grey.shade300),
          ),
          const SizedBox(height: 8),
          Text(
            localizations.addfirstcomment,
            style: TextStyles.size14(color: Colors.grey.shade300),
          ),
        ],
      ),
    );
  }
}
