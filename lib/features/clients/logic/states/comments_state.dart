import 'package:crm/features/clients/data/model/comment_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_state.freezed.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.initial() = CommentsStateInitial;
  const factory CommentsState.loading() = CommentsStateLoading;
  const factory CommentsState.loaded(List<CommentModel> data) =
      CommentsStateLoaded;
  const factory CommentsState.error(String message) = CommentsStateError;
}
