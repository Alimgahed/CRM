// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectResponse> data) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectResponse> data)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectResponse> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectsStateInitial value) initial,
    required TResult Function(ProjectsStateLoading value) loading,
    required TResult Function(ProjectsStateLoaded value) loaded,
    required TResult Function(ProjectsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsStateInitial value)? initial,
    TResult? Function(ProjectsStateLoading value)? loading,
    TResult? Function(ProjectsStateLoaded value)? loaded,
    TResult? Function(ProjectsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsStateInitial value)? initial,
    TResult Function(ProjectsStateLoading value)? loading,
    TResult Function(ProjectsStateLoaded value)? loaded,
    TResult Function(ProjectsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateCopyWith(
          ProjectsState value, $Res Function(ProjectsState) then) =
      _$ProjectsStateCopyWithImpl<$Res, ProjectsState>;
}

/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res, $Val extends ProjectsState>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProjectsStateInitialImplCopyWith<$Res> {
  factory _$$ProjectsStateInitialImplCopyWith(_$ProjectsStateInitialImpl value,
          $Res Function(_$ProjectsStateInitialImpl) then) =
      __$$ProjectsStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectsStateInitialImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$ProjectsStateInitialImpl>
    implements _$$ProjectsStateInitialImplCopyWith<$Res> {
  __$$ProjectsStateInitialImplCopyWithImpl(_$ProjectsStateInitialImpl _value,
      $Res Function(_$ProjectsStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectsStateInitialImpl implements ProjectsStateInitial {
  const _$ProjectsStateInitialImpl();

  @override
  String toString() {
    return 'ProjectsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectResponse> data) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectResponse> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectResponse> data)? loaded,
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
    required TResult Function(ProjectsStateInitial value) initial,
    required TResult Function(ProjectsStateLoading value) loading,
    required TResult Function(ProjectsStateLoaded value) loaded,
    required TResult Function(ProjectsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsStateInitial value)? initial,
    TResult? Function(ProjectsStateLoading value)? loading,
    TResult? Function(ProjectsStateLoaded value)? loaded,
    TResult? Function(ProjectsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsStateInitial value)? initial,
    TResult Function(ProjectsStateLoading value)? loading,
    TResult Function(ProjectsStateLoaded value)? loaded,
    TResult Function(ProjectsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProjectsStateInitial implements ProjectsState {
  const factory ProjectsStateInitial() = _$ProjectsStateInitialImpl;
}

/// @nodoc
abstract class _$$ProjectsStateLoadingImplCopyWith<$Res> {
  factory _$$ProjectsStateLoadingImplCopyWith(_$ProjectsStateLoadingImpl value,
          $Res Function(_$ProjectsStateLoadingImpl) then) =
      __$$ProjectsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectsStateLoadingImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$ProjectsStateLoadingImpl>
    implements _$$ProjectsStateLoadingImplCopyWith<$Res> {
  __$$ProjectsStateLoadingImplCopyWithImpl(_$ProjectsStateLoadingImpl _value,
      $Res Function(_$ProjectsStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectsStateLoadingImpl implements ProjectsStateLoading {
  const _$ProjectsStateLoadingImpl();

  @override
  String toString() {
    return 'ProjectsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectResponse> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectResponse> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectResponse> data)? loaded,
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
    required TResult Function(ProjectsStateInitial value) initial,
    required TResult Function(ProjectsStateLoading value) loading,
    required TResult Function(ProjectsStateLoaded value) loaded,
    required TResult Function(ProjectsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsStateInitial value)? initial,
    TResult? Function(ProjectsStateLoading value)? loading,
    TResult? Function(ProjectsStateLoaded value)? loaded,
    TResult? Function(ProjectsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsStateInitial value)? initial,
    TResult Function(ProjectsStateLoading value)? loading,
    TResult Function(ProjectsStateLoaded value)? loaded,
    TResult Function(ProjectsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProjectsStateLoading implements ProjectsState {
  const factory ProjectsStateLoading() = _$ProjectsStateLoadingImpl;
}

/// @nodoc
abstract class _$$ProjectsStateLoadedImplCopyWith<$Res> {
  factory _$$ProjectsStateLoadedImplCopyWith(_$ProjectsStateLoadedImpl value,
          $Res Function(_$ProjectsStateLoadedImpl) then) =
      __$$ProjectsStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProjectResponse> data});
}

/// @nodoc
class __$$ProjectsStateLoadedImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$ProjectsStateLoadedImpl>
    implements _$$ProjectsStateLoadedImplCopyWith<$Res> {
  __$$ProjectsStateLoadedImplCopyWithImpl(_$ProjectsStateLoadedImpl _value,
      $Res Function(_$ProjectsStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ProjectsStateLoadedImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProjectResponse>,
    ));
  }
}

/// @nodoc

class _$ProjectsStateLoadedImpl implements ProjectsStateLoaded {
  const _$ProjectsStateLoadedImpl(final List<ProjectResponse> data)
      : _data = data;

  final List<ProjectResponse> _data;
  @override
  List<ProjectResponse> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ProjectsState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsStateLoadedImplCopyWith<_$ProjectsStateLoadedImpl> get copyWith =>
      __$$ProjectsStateLoadedImplCopyWithImpl<_$ProjectsStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectResponse> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectResponse> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectResponse> data)? loaded,
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
    required TResult Function(ProjectsStateInitial value) initial,
    required TResult Function(ProjectsStateLoading value) loading,
    required TResult Function(ProjectsStateLoaded value) loaded,
    required TResult Function(ProjectsStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsStateInitial value)? initial,
    TResult? Function(ProjectsStateLoading value)? loading,
    TResult? Function(ProjectsStateLoaded value)? loaded,
    TResult? Function(ProjectsStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsStateInitial value)? initial,
    TResult Function(ProjectsStateLoading value)? loading,
    TResult Function(ProjectsStateLoaded value)? loaded,
    TResult Function(ProjectsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ProjectsStateLoaded implements ProjectsState {
  const factory ProjectsStateLoaded(final List<ProjectResponse> data) =
      _$ProjectsStateLoadedImpl;

  List<ProjectResponse> get data;

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectsStateLoadedImplCopyWith<_$ProjectsStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectsStateErrorImplCopyWith<$Res> {
  factory _$$ProjectsStateErrorImplCopyWith(_$ProjectsStateErrorImpl value,
          $Res Function(_$ProjectsStateErrorImpl) then) =
      __$$ProjectsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProjectsStateErrorImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$ProjectsStateErrorImpl>
    implements _$$ProjectsStateErrorImplCopyWith<$Res> {
  __$$ProjectsStateErrorImplCopyWithImpl(_$ProjectsStateErrorImpl _value,
      $Res Function(_$ProjectsStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProjectsStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectsStateErrorImpl implements ProjectsStateError {
  const _$ProjectsStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProjectsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsStateErrorImplCopyWith<_$ProjectsStateErrorImpl> get copyWith =>
      __$$ProjectsStateErrorImplCopyWithImpl<_$ProjectsStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ProjectResponse> data) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ProjectResponse> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ProjectResponse> data)? loaded,
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
    required TResult Function(ProjectsStateInitial value) initial,
    required TResult Function(ProjectsStateLoading value) loading,
    required TResult Function(ProjectsStateLoaded value) loaded,
    required TResult Function(ProjectsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsStateInitial value)? initial,
    TResult? Function(ProjectsStateLoading value)? loading,
    TResult? Function(ProjectsStateLoaded value)? loaded,
    TResult? Function(ProjectsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsStateInitial value)? initial,
    TResult Function(ProjectsStateLoading value)? loading,
    TResult Function(ProjectsStateLoaded value)? loaded,
    TResult Function(ProjectsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProjectsStateError implements ProjectsState {
  const factory ProjectsStateError(final String message) =
      _$ProjectsStateErrorImpl;

  String get message;

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectsStateErrorImplCopyWith<_$ProjectsStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
