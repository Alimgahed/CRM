// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddTaskState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddTaskState()';
}


}

/// @nodoc
class $AddTaskStateCopyWith<$Res>  {
$AddTaskStateCopyWith(AddTaskState _, $Res Function(AddTaskState) __);
}


/// Adds pattern-matching-related methods to [AddTaskState].
extension AddTaskStatePatterns on AddTaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddTaskInitial value)?  initial,TResult Function( AddTaskLoading value)?  loading,TResult Function( AddTaskLoaded value)?  loaded,TResult Function( AddTaskError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddTaskInitial() when initial != null:
return initial(_that);case AddTaskLoading() when loading != null:
return loading(_that);case AddTaskLoaded() when loaded != null:
return loaded(_that);case AddTaskError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddTaskInitial value)  initial,required TResult Function( AddTaskLoading value)  loading,required TResult Function( AddTaskLoaded value)  loaded,required TResult Function( AddTaskError value)  error,}){
final _that = this;
switch (_that) {
case AddTaskInitial():
return initial(_that);case AddTaskLoading():
return loading(_that);case AddTaskLoaded():
return loaded(_that);case AddTaskError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddTaskInitial value)?  initial,TResult? Function( AddTaskLoading value)?  loading,TResult? Function( AddTaskLoaded value)?  loaded,TResult? Function( AddTaskError value)?  error,}){
final _that = this;
switch (_that) {
case AddTaskInitial() when initial != null:
return initial(_that);case AddTaskLoading() when loading != null:
return loading(_that);case AddTaskLoaded() when loaded != null:
return loaded(_that);case AddTaskError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddTaskInitial() when initial != null:
return initial();case AddTaskLoading() when loading != null:
return loading();case AddTaskLoaded() when loaded != null:
return loaded(_that.message);case AddTaskError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AddTaskInitial():
return initial();case AddTaskLoading():
return loading();case AddTaskLoaded():
return loaded(_that.message);case AddTaskError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AddTaskInitial() when initial != null:
return initial();case AddTaskLoading() when loading != null:
return loading();case AddTaskLoaded() when loaded != null:
return loaded(_that.message);case AddTaskError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AddTaskInitial implements AddTaskState {
  const AddTaskInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddTaskState.initial()';
}


}




/// @nodoc


class AddTaskLoading implements AddTaskState {
  const AddTaskLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddTaskState.loading()';
}


}




/// @nodoc


class AddTaskLoaded implements AddTaskState {
  const AddTaskLoaded(this.message);
  

 final  String message;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTaskLoadedCopyWith<AddTaskLoaded> get copyWith => _$AddTaskLoadedCopyWithImpl<AddTaskLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskLoaded&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddTaskState.loaded(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddTaskLoadedCopyWith<$Res> implements $AddTaskStateCopyWith<$Res> {
  factory $AddTaskLoadedCopyWith(AddTaskLoaded value, $Res Function(AddTaskLoaded) _then) = _$AddTaskLoadedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddTaskLoadedCopyWithImpl<$Res>
    implements $AddTaskLoadedCopyWith<$Res> {
  _$AddTaskLoadedCopyWithImpl(this._self, this._then);

  final AddTaskLoaded _self;
  final $Res Function(AddTaskLoaded) _then;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddTaskLoaded(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddTaskError implements AddTaskState {
  const AddTaskError(this.message);
  

 final  String message;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTaskErrorCopyWith<AddTaskError> get copyWith => _$AddTaskErrorCopyWithImpl<AddTaskError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddTaskState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddTaskErrorCopyWith<$Res> implements $AddTaskStateCopyWith<$Res> {
  factory $AddTaskErrorCopyWith(AddTaskError value, $Res Function(AddTaskError) _then) = _$AddTaskErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddTaskErrorCopyWithImpl<$Res>
    implements $AddTaskErrorCopyWith<$Res> {
  _$AddTaskErrorCopyWithImpl(this._self, this._then);

  final AddTaskError _self;
  final $Res Function(AddTaskError) _then;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddTaskError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
