import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_action_state.freezed.dart';

@freezed
class AddActionState<T> with _$AddActionState<T> {
  const factory AddActionState.initial() = AddActionStateInitial<T>;
  const factory AddActionState.loading() = AddActionStateLoading<T>;
  const factory AddActionState.loaded(T data) = AddActionStateLoaded<T>;
  const factory AddActionState.error(String message) = AddActionStateError<T>;

  const factory AddActionState.actionTypeChanged(int actionType) =
      AddActionStateActionTypeChanged;
}
