// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddClientState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddClientState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddClientState<$T>()';
}


}

/// @nodoc
class $AddClientStateCopyWith<T,$Res>  {
$AddClientStateCopyWith(AddClientState<T> _, $Res Function(AddClientState<T>) __);
}


/// Adds pattern-matching-related methods to [AddClientState].
extension AddClientStatePatterns<T> on AddClientState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddClientStateInitial<T> value)?  initial,TResult Function( AddClientStateLoading<T> value)?  loading,TResult Function( AddClientStateLoaded<T> value)?  loaded,TResult Function( AddClientStateError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddClientStateInitial() when initial != null:
return initial(_that);case AddClientStateLoading() when loading != null:
return loading(_that);case AddClientStateLoaded() when loaded != null:
return loaded(_that);case AddClientStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddClientStateInitial<T> value)  initial,required TResult Function( AddClientStateLoading<T> value)  loading,required TResult Function( AddClientStateLoaded<T> value)  loaded,required TResult Function( AddClientStateError<T> value)  error,}){
final _that = this;
switch (_that) {
case AddClientStateInitial():
return initial(_that);case AddClientStateLoading():
return loading(_that);case AddClientStateLoaded():
return loaded(_that);case AddClientStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddClientStateInitial<T> value)?  initial,TResult? Function( AddClientStateLoading<T> value)?  loading,TResult? Function( AddClientStateLoaded<T> value)?  loaded,TResult? Function( AddClientStateError<T> value)?  error,}){
final _that = this;
switch (_that) {
case AddClientStateInitial() when initial != null:
return initial(_that);case AddClientStateLoading() when loading != null:
return loading(_that);case AddClientStateLoaded() when loaded != null:
return loaded(_that);case AddClientStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddClientStateInitial() when initial != null:
return initial();case AddClientStateLoading() when loading != null:
return loading();case AddClientStateLoaded() when loaded != null:
return loaded(_that.data);case AddClientStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AddClientStateInitial():
return initial();case AddClientStateLoading():
return loading();case AddClientStateLoaded():
return loaded(_that.data);case AddClientStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AddClientStateInitial() when initial != null:
return initial();case AddClientStateLoading() when loading != null:
return loading();case AddClientStateLoaded() when loaded != null:
return loaded(_that.data);case AddClientStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AddClientStateInitial<T> implements AddClientState<T> {
  const AddClientStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddClientStateInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddClientState<$T>.initial()';
}


}




/// @nodoc


class AddClientStateLoading<T> implements AddClientState<T> {
  const AddClientStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddClientStateLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddClientState<$T>.loading()';
}


}




/// @nodoc


class AddClientStateLoaded<T> implements AddClientState<T> {
  const AddClientStateLoaded(this.data);
  

 final  T data;

/// Create a copy of AddClientState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddClientStateLoadedCopyWith<T, AddClientStateLoaded<T>> get copyWith => _$AddClientStateLoadedCopyWithImpl<T, AddClientStateLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddClientStateLoaded<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AddClientState<$T>.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $AddClientStateLoadedCopyWith<T,$Res> implements $AddClientStateCopyWith<T, $Res> {
  factory $AddClientStateLoadedCopyWith(AddClientStateLoaded<T> value, $Res Function(AddClientStateLoaded<T>) _then) = _$AddClientStateLoadedCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$AddClientStateLoadedCopyWithImpl<T,$Res>
    implements $AddClientStateLoadedCopyWith<T, $Res> {
  _$AddClientStateLoadedCopyWithImpl(this._self, this._then);

  final AddClientStateLoaded<T> _self;
  final $Res Function(AddClientStateLoaded<T>) _then;

/// Create a copy of AddClientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(AddClientStateLoaded<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class AddClientStateError<T> implements AddClientState<T> {
  const AddClientStateError(this.message);
  

 final  String message;

/// Create a copy of AddClientState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddClientStateErrorCopyWith<T, AddClientStateError<T>> get copyWith => _$AddClientStateErrorCopyWithImpl<T, AddClientStateError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddClientStateError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddClientState<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddClientStateErrorCopyWith<T,$Res> implements $AddClientStateCopyWith<T, $Res> {
  factory $AddClientStateErrorCopyWith(AddClientStateError<T> value, $Res Function(AddClientStateError<T>) _then) = _$AddClientStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddClientStateErrorCopyWithImpl<T,$Res>
    implements $AddClientStateErrorCopyWith<T, $Res> {
  _$AddClientStateErrorCopyWithImpl(this._self, this._then);

  final AddClientStateError<T> _self;
  final $Res Function(AddClientStateError<T>) _then;

/// Create a copy of AddClientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddClientStateError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
