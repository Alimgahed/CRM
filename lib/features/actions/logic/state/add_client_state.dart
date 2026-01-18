import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_client_state.freezed.dart';

@freezed
class AddClientState<T> with _$AddClientState<T> {
  const factory AddClientState.initial() = AddClientStateInitial<T>;
  const factory AddClientState.loading() = AddClientStateLoading<T>;
  const factory AddClientState.loaded(T data) = AddClientStateLoaded<T>;
  const factory AddClientState.error(String message) = AddClientStateError<T>;
}
