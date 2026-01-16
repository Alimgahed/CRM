import 'package:crm/features/clients/data/model/leads_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leads_states.freezed.dart';

@freezed
class LeadsState with _$LeadsState {
  const factory LeadsState.initial() = LeadsStateInitial;
  const factory LeadsState.loading() = LeadsStateLoading;
  const factory LeadsState.loaded(List<Lead> data) = LeadsStateLoaded;
  const factory LeadsState.error(String message) = LeadsStateError;
}
