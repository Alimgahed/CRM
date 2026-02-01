import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/clients/data/repo/comment_repo.dart';
import 'package:crm/features/clients/logic/states/comments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentRepo commentRepo;

  CommentsCubit({required this.commentRepo})
    : super(const CommentsState.initial());

  Future<void> fetchComments(int id) async {
    emit(const CommentsState.loading());

    final result = await commentRepo.getComments(id);

    result.when(
      success: (data) => emit(CommentsState.loaded(data.data)),
      error: (error) =>
          emit(CommentsState.error(error.error ?? "Unknown Error")),
    );
  }
}
