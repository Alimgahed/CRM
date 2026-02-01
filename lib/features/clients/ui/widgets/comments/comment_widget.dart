import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/theming/Colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/clients/data/model/comment_response.dart';
import 'package:crm/features/clients/logic/cubit/save_comment.dart';
import 'package:crm/features/clients/logic/states/save_comment_state.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// ======================================================
/// CLIENT COMMENT ITEM (OPTIMIZED & CLEAN)
/// ======================================================
class ClientCommentItem extends HookWidget {
  final CommentModel comment;
  final AppLocalizations l10n;
  final int leadId;

  const ClientCommentItem({
    super.key,
    required this.comment,
    required this.l10n,
    required this.leadId,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    final showReply = useState(false);

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(comment: comment, l10n: l10n),
          _Body(comment: comment),
          _Actions(
            repliesCount: comment.childrenComments?.length ?? 0,
            l10n: l10n,
            isExpanded: isExpanded,
            showReply: showReply,
          ),
          if (showReply.value)
            ReplyInput(
              leadId: leadId,
              parentCommentId: comment.id ?? 0,
              l10n: l10n,
              onClose: () => showReply.value = false,
            ),
          if (isExpanded.value &&
              (comment.childrenComments?.isNotEmpty ?? false))
            _ChildComments(comments: comment.childrenComments!, l10n: l10n),
        ],
      ),
    );
  }
}

/// ======================================================
/// HEADER (USER INFO)
/// ======================================================
class _Header extends StatelessWidget {
  final CommentModel comment;
  final AppLocalizations l10n;

  const _Header({required this.comment, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final user = comment.commentedByUser;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: appGradient,
            ),
            alignment: Alignment.center,
            child: Text(
              user?.fullName.isNotEmpty ?? false
                  ? user!.fullName[0].toUpperCase()
                  : '?',
              style: TextStyles.size16(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.fullName ?? '',
                  style: TextStyles.size14(
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  comment.createdAt!.relativeToNow(l10n),
                  style: TextStyles.size12(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ======================================================
/// COMMENT BODY
/// ======================================================
class _Body extends StatelessWidget {
  final CommentModel comment;

  const _Body({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        comment.commentText ?? '',
        style: TextStyles.size14(
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// ======================================================
/// ACTION BUTTONS
/// ======================================================
class _Actions extends StatelessWidget {
  final int repliesCount;
  final AppLocalizations l10n;
  final ValueNotifier<bool> isExpanded;
  final ValueNotifier<bool> showReply;

  const _Actions({
    required this.repliesCount,
    required this.l10n,
    required this.isExpanded,
    required this.showReply,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _ActionButton(
            icon: Icons.reply,
            label: l10n.reply,
            active: showReply.value,
            onTap: () => showReply.value = !showReply.value,
          ),
          const SizedBox(width: 12),
          if (repliesCount > 0)
            _ActionButton(
              icon: isExpanded.value ? Icons.expand_less : Icons.expand_more,
              label: '${l10n.replies} ($repliesCount)',
              onTap: () => isExpanded.value = !isExpanded.value,
            ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool active;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: appColor),
          color: active ? appColor.withOpacity(0.08) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: appColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyles.size12(
                fontWeight: FontWeight.w500,
                color: appColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ======================================================
/// REPLY INPUT
/// ======================================================
class ReplyInput extends HookWidget {
  final int leadId;
  final int? parentCommentId;
  final AppLocalizations l10n;
  final VoidCallback onClose;

  const ReplyInput({
    super.key,
    required this.leadId,
    this.parentCommentId,
    required this.l10n,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return BlocBuilder<SaveCommentCubit, SaveCommentState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: controller,
                enabled: !isLoading,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: l10n.writeReply,
                  filled: true,
                  fillColor: fieldColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: onClose, child: Text(l10n.cancel)),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            final text = controller.text.trim();
                            if (text.isEmpty) return;

                            context.read<SaveCommentCubit>().saveComment({
                              'lead_id': leadId,
                              'comment_text': text,
                              'parent_comment_id': parentCommentId,
                            });

                            controller.clear();
                            onClose();
                          },
                    child: isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(l10n.send),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ChildComments extends StatelessWidget {
  final List<ChildComment> comments;
  final AppLocalizations l10n;

  const _ChildComments({required this.comments, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      child: Column(
        children: List.generate(
          comments.length,
          (index) => _ChildCommentItem(comment: comments[index], l10n: l10n),
        ),
      ),
    );
  }
}

/// ======================================================
/// CHILD COMMENT
class _ChildCommentItem extends StatelessWidget {
  final ChildComment comment;
  final AppLocalizations l10n;

  const _ChildCommentItem({required this.comment, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Avatar
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: appGradient,
            ),
            alignment: Alignment.center,
            child: Text(
              comment.userId.toString(),
              style: TextStyles.size14(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name + Time
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        comment.userId.toString(),
                        style: TextStyles.size14(
                          fontWeight: FontWeight.w600,
                          color: primaryTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (comment.createdAt != null)
                      Text(
                        comment.createdAt!.relativeToNow(l10n),
                        style: TextStyles.size12(),
                      ),
                  ],
                ),

                const SizedBox(height: 4),

                /// Comment Text
                Text(
                  comment.commentText ?? '',
                  style: TextStyles.size14(color: secondaryTextColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
