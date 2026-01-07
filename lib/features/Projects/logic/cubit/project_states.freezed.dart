// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsState()';
}


}

/// @nodoc
class $ProjectsStateCopyWith<$Res>  {
$ProjectsStateCopyWith(ProjectsState _, $Res Function(ProjectsState) __);
}


/// Adds pattern-matching-related methods to [ProjectsState].
extension ProjectsStatePatterns on ProjectsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectsStateInitial value)?  initial,TResult Function( ProjectsStateLoading value)?  loading,TResult Function( ProjectsStateLoaded value)?  loaded,TResult Function( ProjectsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectsStateInitial() when initial != null:
return initial(_that);case ProjectsStateLoading() when loading != null:
return loading(_that);case ProjectsStateLoaded() when loaded != null:
return loaded(_that);case ProjectsStateError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectsStateInitial value)  initial,required TResult Function( ProjectsStateLoading value)  loading,required TResult Function( ProjectsStateLoaded value)  loaded,required TResult Function( ProjectsStateError value)  error,}){
final _that = this;
switch (_that) {
case ProjectsStateInitial():
return initial(_that);case ProjectsStateLoading():
return loading(_that);case ProjectsStateLoaded():
return loaded(_that);case ProjectsStateError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectsStateInitial value)?  initial,TResult? Function( ProjectsStateLoading value)?  loading,TResult? Function( ProjectsStateLoaded value)?  loaded,TResult? Function( ProjectsStateError value)?  error,}){
final _that = this;
switch (_that) {
case ProjectsStateInitial() when initial != null:
return initial(_that);case ProjectsStateLoading() when loading != null:
return loading(_that);case ProjectsStateLoaded() when loaded != null:
return loaded(_that);case ProjectsStateError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Project> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectsStateInitial() when initial != null:
return initial();case ProjectsStateLoading() when loading != null:
return loading();case ProjectsStateLoaded() when loaded != null:
return loaded(_that.data);case ProjectsStateError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Project> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProjectsStateInitial():
return initial();case ProjectsStateLoading():
return loading();case ProjectsStateLoaded():
return loaded(_that.data);case ProjectsStateError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Project> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProjectsStateInitial() when initial != null:
return initial();case ProjectsStateLoading() when loading != null:
return loading();case ProjectsStateLoaded() when loaded != null:
return loaded(_that.data);case ProjectsStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProjectsStateInitial implements ProjectsState {
  const ProjectsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsState.initial()';
}


}




/// @nodoc


class ProjectsStateLoading implements ProjectsState {
  const ProjectsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsState.loading()';
}


}




/// @nodoc


class ProjectsStateLoaded implements ProjectsState {
  const ProjectsStateLoaded(final  List<Project> data): _data = data;
  

 final  List<Project> _data;
 List<Project> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsStateLoadedCopyWith<ProjectsStateLoaded> get copyWith => _$ProjectsStateLoadedCopyWithImpl<ProjectsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsStateLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ProjectsState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $ProjectsStateLoadedCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateLoadedCopyWith(ProjectsStateLoaded value, $Res Function(ProjectsStateLoaded) _then) = _$ProjectsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Project> data
});




}
/// @nodoc
class _$ProjectsStateLoadedCopyWithImpl<$Res>
    implements $ProjectsStateLoadedCopyWith<$Res> {
  _$ProjectsStateLoadedCopyWithImpl(this._self, this._then);

  final ProjectsStateLoaded _self;
  final $Res Function(ProjectsStateLoaded) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ProjectsStateLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Project>,
  ));
}


}

/// @nodoc


class ProjectsStateError implements ProjectsState {
  const ProjectsStateError(this.message);
  

 final  String message;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsStateErrorCopyWith<ProjectsStateError> get copyWith => _$ProjectsStateErrorCopyWithImpl<ProjectsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectsStateErrorCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateErrorCopyWith(ProjectsStateError value, $Res Function(ProjectsStateError) _then) = _$ProjectsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectsStateErrorCopyWithImpl<$Res>
    implements $ProjectsStateErrorCopyWith<$Res> {
  _$ProjectsStateErrorCopyWithImpl(this._self, this._then);

  final ProjectsStateError _self;
  final $Res Function(ProjectsStateError) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectsStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
