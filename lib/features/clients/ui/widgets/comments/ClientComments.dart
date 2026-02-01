import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/features/clients/data/repo/comment_repo.dart';
import 'package:crm/features/clients/data/repo/save_comment_repo.dart';
import 'package:crm/features/clients/logic/cubit/comments_cubit.dart';
import 'package:crm/features/clients/logic/cubit/save_comment.dart';
import 'package:crm/features/clients/logic/states/comments_state.dart';
import 'package:crm/features/clients/logic/states/save_comment_state.dart';
import 'package:crm/features/clients/ui/widgets/comments/comment_widget.dart';
import 'package:crm/features/clients/ui/widgets/comments/comments_header.dart';
import 'package:crm/features/clients/ui/widgets/comments/comments_list.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Clientcomments extends StatelessWidget {
  final int leadid;
  const Clientcomments({super.key, required this.leadid});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CommentsCubit(commentRepo: CommentRepo(apiService: getIt()))
                ..fetchComments(leadid),
        ),
        BlocProvider(
          create: (context) => SaveCommentCubit(
            saveCommentRepo: SaveCommentRepo(apiService: getIt()),
          ),
        ),
      ],
      child: BlocListener<SaveCommentCubit, SaveCommentState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            loaded: () {
              // ✅ Refresh comments after saving
              context.read<CommentsCubit>().fetchComments(leadid);

              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم حفظ التعليق بنجاح'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
          );
        },
        child: BlocBuilder<CommentsCubit, CommentsState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommentsHeader(localizations: appLocalizations),
                  const Divider(height: 1),
                  state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const SizedBox(
                      height: 300,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (message) => SizedBox(
                      height: 300,
                      child: Center(child: Text(message)),
                    ),
                    loaded: (comments) => CommentsList(
                      comments: comments,
                      localizations: appLocalizations,
                      leadid: leadid,
                    ),
                  ),
                  const Divider(height: 1),
                  _buildAddCommentSection(leadid, null),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddCommentSection(int leadId, int? parentCommentId) {
    return Builder(
      builder: (context) {
        final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
          (cubit) => AppLocalizations(cubit.currentLocale),
        );
        return BlocBuilder<SaveCommentCubit, SaveCommentState>(
          builder: (context, state) {
            // final isLoading = state.maybeWhen(
            //   loading: () => true,
            //   orElse: () => false,
            // );

            return ReplyInput(
              leadId: leadId,
              l10n: appLocalizations,
              onClose: () {},
            );
          },
        );
      },
    );
  }
}
