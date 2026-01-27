// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddActionState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddActionState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddActionState<$T>()';
}


}

/// @nodoc
class $AddActionStateCopyWith<T,$Res>  {
$AddActionStateCopyWith(AddActionState<T> _, $Res Function(AddActionState<T>) __);
}


/// Adds pattern-matching-related methods to [AddActionState].
extension AddActionStatePatterns<T> on AddActionState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddActionStateInitial<T> value)?  initial,TResult Function( AddActionStateLoading<T> value)?  loading,TResult Function( AddActionStateLoaded<T> value)?  loaded,TResult Function( AddActionStateError<T> value)?  error,TResult Function( AddActionStateActionTypeChanged<T> value)?  actionTypeChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddActionStateInitial() when initial != null:
return initial(_that);case AddActionStateLoading() when loading != null:
return loading(_that);case AddActionStateLoaded() when loaded != null:
return loaded(_that);case AddActionStateError() when error != null:
return error(_that);case AddActionStateActionTypeChanged() when actionTypeChanged != null:
return actionTypeChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddActionStateInitial<T> value)  initial,required TResult Function( AddActionStateLoading<T> value)  loading,required TResult Function( AddActionStateLoaded<T> value)  loaded,required TResult Function( AddActionStateError<T> value)  error,required TResult Function( AddActionStateActionTypeChanged<T> value)  actionTypeChanged,}){
final _that = this;
switch (_that) {
case AddActionStateInitial():
return initial(_that);case AddActionStateLoading():
return loading(_that);case AddActionStateLoaded():
return loaded(_that);case AddActionStateError():
return error(_that);case AddActionStateActionTypeChanged():
return actionTypeChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddActionStateInitial<T> value)?  initial,TResult? Function( AddActionStateLoading<T> value)?  loading,TResult? Function( AddActionStateLoaded<T> value)?  loaded,TResult? Function( AddActionStateError<T> value)?  error,TResult? Function( AddActionStateActionTypeChanged<T> value)?  actionTypeChanged,}){
final _that = this;
switch (_that) {
case AddActionStateInitial() when initial != null:
return initial(_that);case AddActionStateLoading() when loading != null:
return loading(_that);case AddActionStateLoaded() when loaded != null:
return loaded(_that);case AddActionStateError() when error != null:
return error(_that);case AddActionStateActionTypeChanged() when actionTypeChanged != null:
return actionTypeChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  loaded,TResult Function( String message)?  error,TResult Function( int actionType)?  actionTypeChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddActionStateInitial() when initial != null:
return initial();case AddActionStateLoading() when loading != null:
return loading();case AddActionStateLoaded() when loaded != null:
return loaded(_that.data);case AddActionStateError() when error != null:
return error(_that.message);case AddActionStateActionTypeChanged() when actionTypeChanged != null:
return actionTypeChanged(_that.actionType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  loaded,required TResult Function( String message)  error,required TResult Function( int actionType)  actionTypeChanged,}) {final _that = this;
switch (_that) {
case AddActionStateInitial():
return initial();case AddActionStateLoading():
return loading();case AddActionStateLoaded():
return loaded(_that.data);case AddActionStateError():
return error(_that.message);case AddActionStateActionTypeChanged():
return actionTypeChanged(_that.actionType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  loaded,TResult? Function( String message)?  error,TResult? Function( int actionType)?  actionTypeChanged,}) {final _that = this;
switch (_that) {
case AddActionStateInitial() when initial != null:
return initial();case AddActionStateLoading() when loading != null:
return loading();case AddActionStateLoaded() when loaded != null:
return loaded(_that.data);case AddActionStateError() when error != null:
return error(_that.message);case AddActionStateActionTypeChanged() when actionTypeChanged != null:
return actionTypeChanged(_that.actionType);case _:
  return null;

}
}

}

/// @nodoc


class AddActionStateInitial<T> implements AddActionState<T> {
  const AddActionStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddActionStateInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddActionState<$T>.initial()';
}


}




/// @nodoc


class AddActionStateLoading<T> implements AddActionState<T> {
  const AddActionStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddActionStateLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddActionState<$T>.loading()';
}


}




/// @nodoc


class AddActionStateLoaded<T> implements AddActionState<T> {
  const AddActionStateLoaded(this.data);
  

 final  T data;

/// Create a copy of AddActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddActionStateLoadedCopyWith<T, AddActionStateLoaded<T>> get copyWith => _$AddActionStateLoadedCopyWithImpl<T, AddActionStateLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddActionStateLoaded<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AddActionState<$T>.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $AddActionStateLoadedCopyWith<T,$Res> implements $AddActionStateCopyWith<T, $Res> {
  factory $AddActionStateLoadedCopyWith(AddActionStateLoaded<T> value, $Res Function(AddActionStateLoaded<T>) _then) = _$AddActionStateLoadedCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$AddActionStateLoadedCopyWithImpl<T,$Res>
    implements $AddActionStateLoadedCopyWith<T, $Res> {
  _$AddActionStateLoadedCopyWithImpl(this._self, this._then);

  final AddActionStateLoaded<T> _self;
  final $Res Function(AddActionStateLoaded<T>) _then;

/// Create a copy of AddActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(AddActionStateLoaded<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class AddActionStateError<T> implements AddActionState<T> {
  const AddActionStateError(this.message);
  

 final  String message;

/// Create a copy of AddActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddActionStateErrorCopyWith<T, AddActionStateError<T>> get copyWith => _$AddActionStateErrorCopyWithImpl<T, AddActionStateError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddActionStateError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddActionState<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddActionStateErrorCopyWith<T,$Res> implements $AddActionStateCopyWith<T, $Res> {
  factory $AddActionStateErrorCopyWith(AddActionStateError<T> value, $Res Function(AddActionStateError<T>) _then) = _$AddActionStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddActionStateErrorCopyWithImpl<T,$Res>
    implements $AddActionStateErrorCopyWith<T, $Res> {
  _$AddActionStateErrorCopyWithImpl(this._self, this._then);

  final AddActionStateError<T> _self;
  final $Res Function(AddActionStateError<T>) _then;

/// Create a copy of AddActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddActionStateError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddActionStateActionTypeChanged<T> implements AddActionState<T> {
  const AddActionStateActionTypeChanged(this.actionType);
  

 final  int actionType;

/// Create a copy of AddActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddActionStateActionTypeChangedCopyWith<T, AddActionStateActionTypeChanged<T>> get copyWith => _$AddActionStateActionTypeChangedCopyWithImpl<T, AddActionStateActionTypeChanged<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddActionStateActionTypeChanged<T>&&(identical(other.actionType, actionType) || other.actionType == actionType));
}


@override
int get hashCode => Object.hash(runtimeType,actionType);

@override
String toString() {
  return 'AddActionState<$T>.actionTypeChanged(actionType: $actionType)';
}


}

/// @nodoc
abstract mixin class $AddActionStateActionTypeChangedCopyWith<T,$Res> implements $AddActionStateCopyWith<T, $Res> {
  factory $AddActionStateActionTypeChangedCopyWith(AddActionStateActionTypeChanged<T> value, $Res Function(AddActionStateActionTypeChanged<T>) _then) = _$AddActionStateActionTypeChangedCopyWithImpl;
@useResult
$Res call({
 int actionType
});




}
/// @nodoc
class _$AddActionStateActionTypeChangedCopyWithImpl<T,$Res>
    implements $AddActionStateActionTypeChangedCopyWith<T, $Res> {
  _$AddActionStateActionTypeChangedCopyWithImpl(this._self, this._then);

  final AddActionStateActionTypeChanged<T> _self;
  final $Res Function(AddActionStateActionTypeChanged<T>) _then;

/// Create a copy of AddActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? actionType = null,}) {
  return _then(AddActionStateActionTypeChanged<T>(
null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
