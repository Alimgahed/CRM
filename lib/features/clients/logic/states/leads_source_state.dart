import 'package:crm/features/clients/data/model/lead_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leads_source_state.freezed.dart';

@freezed
class LeadsSourceState with _$LeadsSourceState {
  const factory LeadsSourceState.initial() = LeadsSourceStateInitial;
  const factory LeadsSourceState.loading() = LeadsSourceStateLoading;
  const factory LeadsSourceState.loaded(List<LeadSource> data) =
      LeadsSourceStateLoaded;
  const factory LeadsSourceState.error(String message) = LeadsSourceStateError;
}
