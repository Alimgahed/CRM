// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OwnerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OwnerState()';
}


}

/// @nodoc
class $OwnerStateCopyWith<$Res>  {
$OwnerStateCopyWith(OwnerState _, $Res Function(OwnerState) __);
}


/// Adds pattern-matching-related methods to [OwnerState].
extension OwnerStatePatterns on OwnerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OwnerStateInitial value)?  initial,TResult Function( OwnerStateLoading value)?  loading,TResult Function( ProjectsStateLoaded value)?  loaded,TResult Function( ProjectsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OwnerStateInitial() when initial != null:
return initial(_that);case OwnerStateLoading() when loading != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OwnerStateInitial value)  initial,required TResult Function( OwnerStateLoading value)  loading,required TResult Function( ProjectsStateLoaded value)  loaded,required TResult Function( ProjectsStateError value)  error,}){
final _that = this;
switch (_that) {
case OwnerStateInitial():
return initial(_that);case OwnerStateLoading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OwnerStateInitial value)?  initial,TResult? Function( OwnerStateLoading value)?  loading,TResult? Function( ProjectsStateLoaded value)?  loaded,TResult? Function( ProjectsStateError value)?  error,}){
final _that = this;
switch (_that) {
case OwnerStateInitial() when initial != null:
return initial(_that);case OwnerStateLoading() when loading != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Owner> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OwnerStateInitial() when initial != null:
return initial();case OwnerStateLoading() when loading != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Owner> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case OwnerStateInitial():
return initial();case OwnerStateLoading():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Owner> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case OwnerStateInitial() when initial != null:
return initial();case OwnerStateLoading() when loading != null:
return loading();case ProjectsStateLoaded() when loaded != null:
return loaded(_that.data);case ProjectsStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class OwnerStateInitial implements OwnerState {
  const OwnerStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OwnerState.initial()';
}


}




/// @nodoc


class OwnerStateLoading implements OwnerState {
  const OwnerStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OwnerState.loading()';
}


}




/// @nodoc


class ProjectsStateLoaded implements OwnerState {
  const ProjectsStateLoaded(final  List<Owner> data): _data = data;
  

 final  List<Owner> _data;
 List<Owner> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of OwnerState
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
  return 'OwnerState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $ProjectsStateLoadedCopyWith<$Res> implements $OwnerStateCopyWith<$Res> {
  factory $ProjectsStateLoadedCopyWith(ProjectsStateLoaded value, $Res Function(ProjectsStateLoaded) _then) = _$ProjectsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Owner> data
});




}
/// @nodoc
class _$ProjectsStateLoadedCopyWithImpl<$Res>
    implements $ProjectsStateLoadedCopyWith<$Res> {
  _$ProjectsStateLoadedCopyWithImpl(this._self, this._then);

  final ProjectsStateLoaded _self;
  final $Res Function(ProjectsStateLoaded) _then;

/// Create a copy of OwnerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ProjectsStateLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Owner>,
  ));
}


}

/// @nodoc


class ProjectsStateError implements OwnerState {
  const ProjectsStateError(this.message);
  

 final  String message;

/// Create a copy of OwnerState
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
  return 'OwnerState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectsStateErrorCopyWith<$Res> implements $OwnerStateCopyWith<$Res> {
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

/// Create a copy of OwnerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectsStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
