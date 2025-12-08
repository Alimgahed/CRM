import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_states.freezed.dart';
@freezed
class DeveloperStates<T> with _$DeveloperStates<T> {

    const factory DeveloperStates.initial() = DeveloperStatesInitial<T>;
    const factory DeveloperStates.loading() = DeveloperStatesLoading<T>;
    const factory DeveloperStates.loaded(T data) = DeveloperStatesLoaded<T>;
    const factory DeveloperStates.error(String message) = DeveloperStatesError<T>;
}