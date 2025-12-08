import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {

    const factory LoginState.initial() = LoginStateInitial<T>;
    const factory LoginState.loading() = LoginStateLoading<T>;
    const factory LoginState.loaded(T data) = LoginStateLoaded<T>;
    const factory LoginState.error(String message) = LoginStateError<T>;
}