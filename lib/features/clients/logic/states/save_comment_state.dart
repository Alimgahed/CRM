import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_comment_state.freezed.dart';

@freezed
class SaveCommentState with _$SaveCommentState {
  const factory SaveCommentState.initial() = SaveCommentStateInitial;
  const factory SaveCommentState.loading() = SaveCommentStateLoading;
  const factory SaveCommentState.loaded() = SaveCommentStateLoaded;
  const factory SaveCommentState.error(String message) = SaveCommentStateError;
}
