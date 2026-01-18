import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_action_state.freezed.dart';

@freezed
class LeadActionState<T> with _$LeadActionState<T> {
  const factory LeadActionState.initial() = LeadActionStateInitial<T>;
  const factory LeadActionState.loading() = LeadActionStateLoading<T>;
  const factory LeadActionState.loaded(List<LeadActionModel> data) =
      LeadActionStateLoaded<T>;
  const factory LeadActionState.error(String message) = LeadActionStateError<T>;
}
