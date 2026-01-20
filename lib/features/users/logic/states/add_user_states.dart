import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_user_states.freezed.dart';

@freezed
class AddUserState with _$AddUserState {
  const factory AddUserState.initial() = AddUserInitial;
  const factory AddUserState.loading() = AddUserLoading;
  const factory AddUserState.loaded(String dsata) = AddUserLoaded;
  const factory AddUserState.error(String error) = AddUserError;
}
