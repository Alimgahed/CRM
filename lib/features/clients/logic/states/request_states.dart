import 'package:crm/features/clients/data/model/request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_states.freezed.dart';

@freezed
class RequestState with _$RequestState {
  const factory RequestState.initial() = RequestStateInitial;
  const factory RequestState.loading() = RequestStateLoading;
  const factory RequestState.loaded(List<RequestModel> data) =
      RequestStateLoaded;
  const factory RequestState.error(String message) = RequestStateError;
}
