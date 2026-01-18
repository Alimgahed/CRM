import 'package:crm/features/owners/data/models/owners_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_states.freezed.dart';

@freezed
class OwnerState with _$OwnerState {
  const factory OwnerState.initial() = OwnerStateInitial;
  const factory OwnerState.loading() = OwnerStateLoading;
  const factory OwnerState.loaded(List<Owner> data) = ProjectsStateLoaded;
  const factory OwnerState.error(String message) = ProjectsStateError;
}
