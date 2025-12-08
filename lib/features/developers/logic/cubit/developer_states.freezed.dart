// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeveloperStates<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeveloperStatesInitial<T> value) initial,
    required TResult Function(DeveloperStatesLoading<T> value) loading,
    required TResult Function(DeveloperStatesLoaded<T> value) loaded,
    required TResult Function(DeveloperStatesError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeveloperStatesInitial<T> value)? initial,
    TResult? Function(DeveloperStatesLoading<T> value)? loading,
    TResult? Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult? Function(DeveloperStatesError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeveloperStatesInitial<T> value)? initial,
    TResult Function(DeveloperStatesLoading<T> value)? loading,
    TResult Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult Function(DeveloperStatesError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperStatesCopyWith<T, $Res> {
  factory $DeveloperStatesCopyWith(
          DeveloperStates<T> value, $Res Function(DeveloperStates<T>) then) =
      _$DeveloperStatesCopyWithImpl<T, $Res, DeveloperStates<T>>;
}

/// @nodoc
class _$DeveloperStatesCopyWithImpl<T, $Res, $Val extends DeveloperStates<T>>
    implements $DeveloperStatesCopyWith<T, $Res> {
  _$DeveloperStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeveloperStatesInitialImplCopyWith<T, $Res> {
  factory _$$DeveloperStatesInitialImplCopyWith(
          _$DeveloperStatesInitialImpl<T> value,
          $Res Function(_$DeveloperStatesInitialImpl<T>) then) =
      __$$DeveloperStatesInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DeveloperStatesInitialImplCopyWithImpl<T, $Res>
    extends _$DeveloperStatesCopyWithImpl<T, $Res,
        _$DeveloperStatesInitialImpl<T>>
    implements _$$DeveloperStatesInitialImplCopyWith<T, $Res> {
  __$$DeveloperStatesInitialImplCopyWithImpl(
      _$DeveloperStatesInitialImpl<T> _value,
      $Res Function(_$DeveloperStatesInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeveloperStatesInitialImpl<T> implements DeveloperStatesInitial<T> {
  const _$DeveloperStatesInitialImpl();

  @override
  String toString() {
    return 'DeveloperStates<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeveloperStatesInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeveloperStatesInitial<T> value) initial,
    required TResult Function(DeveloperStatesLoading<T> value) loading,
    required TResult Function(DeveloperStatesLoaded<T> value) loaded,
    required TResult Function(DeveloperStatesError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeveloperStatesInitial<T> value)? initial,
    TResult? Function(DeveloperStatesLoading<T> value)? loading,
    TResult? Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult? Function(DeveloperStatesError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeveloperStatesInitial<T> value)? initial,
    TResult Function(DeveloperStatesLoading<T> value)? loading,
    TResult Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult Function(DeveloperStatesError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DeveloperStatesInitial<T> implements DeveloperStates<T> {
  const factory DeveloperStatesInitial() = _$DeveloperStatesInitialImpl<T>;
}

/// @nodoc
abstract class _$$DeveloperStatesLoadingImplCopyWith<T, $Res> {
  factory _$$DeveloperStatesLoadingImplCopyWith(
          _$DeveloperStatesLoadingImpl<T> value,
          $Res Function(_$DeveloperStatesLoadingImpl<T>) then) =
      __$$DeveloperStatesLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$DeveloperStatesLoadingImplCopyWithImpl<T, $Res>
    extends _$DeveloperStatesCopyWithImpl<T, $Res,
        _$DeveloperStatesLoadingImpl<T>>
    implements _$$DeveloperStatesLoadingImplCopyWith<T, $Res> {
  __$$DeveloperStatesLoadingImplCopyWithImpl(
      _$DeveloperStatesLoadingImpl<T> _value,
      $Res Function(_$DeveloperStatesLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeveloperStatesLoadingImpl<T> implements DeveloperStatesLoading<T> {
  const _$DeveloperStatesLoadingImpl();

  @override
  String toString() {
    return 'DeveloperStates<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeveloperStatesLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeveloperStatesInitial<T> value) initial,
    required TResult Function(DeveloperStatesLoading<T> value) loading,
    required TResult Function(DeveloperStatesLoaded<T> value) loaded,
    required TResult Function(DeveloperStatesError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeveloperStatesInitial<T> value)? initial,
    TResult? Function(DeveloperStatesLoading<T> value)? loading,
    TResult? Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult? Function(DeveloperStatesError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeveloperStatesInitial<T> value)? initial,
    TResult Function(DeveloperStatesLoading<T> value)? loading,
    TResult Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult Function(DeveloperStatesError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DeveloperStatesLoading<T> implements DeveloperStates<T> {
  const factory DeveloperStatesLoading() = _$DeveloperStatesLoadingImpl<T>;
}

/// @nodoc
abstract class _$$DeveloperStatesLoadedImplCopyWith<T, $Res> {
  factory _$$DeveloperStatesLoadedImplCopyWith(
          _$DeveloperStatesLoadedImpl<T> value,
          $Res Function(_$DeveloperStatesLoadedImpl<T>) then) =
      __$$DeveloperStatesLoadedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DeveloperStatesLoadedImplCopyWithImpl<T, $Res>
    extends _$DeveloperStatesCopyWithImpl<T, $Res,
        _$DeveloperStatesLoadedImpl<T>>
    implements _$$DeveloperStatesLoadedImplCopyWith<T, $Res> {
  __$$DeveloperStatesLoadedImplCopyWithImpl(
      _$DeveloperStatesLoadedImpl<T> _value,
      $Res Function(_$DeveloperStatesLoadedImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DeveloperStatesLoadedImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DeveloperStatesLoadedImpl<T> implements DeveloperStatesLoaded<T> {
  const _$DeveloperStatesLoadedImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DeveloperStates<$T>.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeveloperStatesLoadedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeveloperStatesLoadedImplCopyWith<T, _$DeveloperStatesLoadedImpl<T>>
      get copyWith => __$$DeveloperStatesLoadedImplCopyWithImpl<T,
          _$DeveloperStatesLoadedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeveloperStatesInitial<T> value) initial,
    required TResult Function(DeveloperStatesLoading<T> value) loading,
    required TResult Function(DeveloperStatesLoaded<T> value) loaded,
    required TResult Function(DeveloperStatesError<T> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeveloperStatesInitial<T> value)? initial,
    TResult? Function(DeveloperStatesLoading<T> value)? loading,
    TResult? Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult? Function(DeveloperStatesError<T> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeveloperStatesInitial<T> value)? initial,
    TResult Function(DeveloperStatesLoading<T> value)? loading,
    TResult Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult Function(DeveloperStatesError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DeveloperStatesLoaded<T> implements DeveloperStates<T> {
  const factory DeveloperStatesLoaded(final T data) =
      _$DeveloperStatesLoadedImpl<T>;

  T get data;

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeveloperStatesLoadedImplCopyWith<T, _$DeveloperStatesLoadedImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeveloperStatesErrorImplCopyWith<T, $Res> {
  factory _$$DeveloperStatesErrorImplCopyWith(
          _$DeveloperStatesErrorImpl<T> value,
          $Res Function(_$DeveloperStatesErrorImpl<T>) then) =
      __$$DeveloperStatesErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DeveloperStatesErrorImplCopyWithImpl<T, $Res>
    extends _$DeveloperStatesCopyWithImpl<T, $Res,
        _$DeveloperStatesErrorImpl<T>>
    implements _$$DeveloperStatesErrorImplCopyWith<T, $Res> {
  __$$DeveloperStatesErrorImplCopyWithImpl(_$DeveloperStatesErrorImpl<T> _value,
      $Res Function(_$DeveloperStatesErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DeveloperStatesErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeveloperStatesErrorImpl<T> implements DeveloperStatesError<T> {
  const _$DeveloperStatesErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DeveloperStates<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeveloperStatesErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeveloperStatesErrorImplCopyWith<T, _$DeveloperStatesErrorImpl<T>>
      get copyWith => __$$DeveloperStatesErrorImplCopyWithImpl<T,
          _$DeveloperStatesErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeveloperStatesInitial<T> value) initial,
    required TResult Function(DeveloperStatesLoading<T> value) loading,
    required TResult Function(DeveloperStatesLoaded<T> value) loaded,
    required TResult Function(DeveloperStatesError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeveloperStatesInitial<T> value)? initial,
    TResult? Function(DeveloperStatesLoading<T> value)? loading,
    TResult? Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult? Function(DeveloperStatesError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeveloperStatesInitial<T> value)? initial,
    TResult Function(DeveloperStatesLoading<T> value)? loading,
    TResult Function(DeveloperStatesLoaded<T> value)? loaded,
    TResult Function(DeveloperStatesError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DeveloperStatesError<T> implements DeveloperStates<T> {
  const factory DeveloperStatesError(final String message) =
      _$DeveloperStatesErrorImpl<T>;

  String get message;

  /// Create a copy of DeveloperStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeveloperStatesErrorImplCopyWith<T, _$DeveloperStatesErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
