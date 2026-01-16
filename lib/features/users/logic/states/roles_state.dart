import 'package:crm/features/users/data/model/role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'roles_state.freezed.dart';

@freezed
class RolesState with _$RolesState {
  const factory RolesState.initial() = Initial;
  const factory RolesState.loading() = Loading;
  const factory RolesState.loaded(List<Role> data) = Loaded;
  const factory RolesState.error(String message) = _Error;
}
