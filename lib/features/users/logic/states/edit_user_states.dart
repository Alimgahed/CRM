import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_states.freezed.dart';

@freezed
class EditUserState with _$EditUserState {
  const factory EditUserState.initial() = EditUserInitial;
  const factory EditUserState.loading() = EditUserLoading;
  const factory EditUserState.loaded(String dsata) = EditUserLoaded;
  const factory EditUserState.error(String error) = EditUserError;
}
