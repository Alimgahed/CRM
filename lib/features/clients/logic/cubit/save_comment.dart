import 'package:crm/Core/network/api_result.dart';
import 'package:crm/features/clients/data/repo/save_comment_repo.dart';
import 'package:crm/features/clients/logic/states/save_comment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveCommentCubit extends Cubit<SaveCommentState> {
  final SaveCommentRepo saveCommentRepo;

  SaveCommentCubit({required this.saveCommentRepo})
    : super(const SaveCommentState.initial());

  Future<void> saveComment(Map<String, dynamic> commentModel) async {
    emit(const SaveCommentState.loading());

    final result = await saveCommentRepo.saveComment(commentModel);

    result.when(
      success: (data) => emit(SaveCommentState.loaded()),
      error: (error) =>
          emit(SaveCommentState.error(error.error ?? "Unknown Error")),
    );
  }
}
