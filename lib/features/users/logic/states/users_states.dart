import 'package:crm/features/users/data/model/users_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_states.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = Initial;
  const factory UsersState.loading() = Loading;
  const factory UsersState.loaded(List<User> data) = Loaded;
  const factory UsersState.error(String message) = _Error;
}
