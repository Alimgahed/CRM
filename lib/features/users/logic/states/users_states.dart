import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_states.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = Initial;
  const factory UsersState.loading() = Loading;
  const factory UsersState.loaded(List<UsersModel> data) = Loaded;
  const factory UsersState.error(String message) = _Error;
}
