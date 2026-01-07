// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState<$T>()';
}


}

/// @nodoc
class $LoginStateCopyWith<T,$Res>  {
$LoginStateCopyWith(LoginState<T> _, $Res Function(LoginState<T>) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns<T> on LoginState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginStateInitial<T> value)?  initial,TResult Function( LoginStateLoading<T> value)?  loading,TResult Function( LoginStateLoaded<T> value)?  loaded,TResult Function( LoginStateError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginStateInitial() when initial != null:
return initial(_that);case LoginStateLoading() when loading != null:
return loading(_that);case LoginStateLoaded() when loaded != null:
return loaded(_that);case LoginStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginStateInitial<T> value)  initial,required TResult Function( LoginStateLoading<T> value)  loading,required TResult Function( LoginStateLoaded<T> value)  loaded,required TResult Function( LoginStateError<T> value)  error,}){
final _that = this;
switch (_that) {
case LoginStateInitial():
return initial(_that);case LoginStateLoading():
return loading(_that);case LoginStateLoaded():
return loaded(_that);case LoginStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginStateInitial<T> value)?  initial,TResult? Function( LoginStateLoading<T> value)?  loading,TResult? Function( LoginStateLoaded<T> value)?  loaded,TResult? Function( LoginStateError<T> value)?  error,}){
final _that = this;
switch (_that) {
case LoginStateInitial() when initial != null:
return initial(_that);case LoginStateLoading() when loading != null:
return loading(_that);case LoginStateLoaded() when loaded != null:
return loaded(_that);case LoginStateError() when error != null:
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
case LoginStateInitial() when initial != null:
return initial();case LoginStateLoading() when loading != null:
return loading();case LoginStateLoaded() when loaded != null:
return loaded(_that.data);case LoginStateError() when error != null:
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
case LoginStateInitial():
return initial();case LoginStateLoading():
return loading();case LoginStateLoaded():
return loaded(_that.data);case LoginStateError():
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
case LoginStateInitial() when initial != null:
return initial();case LoginStateLoading() when loading != null:
return loading();case LoginStateLoaded() when loaded != null:
return loaded(_that.data);case LoginStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoginStateInitial<T> implements LoginState<T> {
  const LoginStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState<$T>.initial()';
}


}




/// @nodoc


class LoginStateLoading<T> implements LoginState<T> {
  const LoginStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState<$T>.loading()';
}


}




/// @nodoc


class LoginStateLoaded<T> implements LoginState<T> {
  const LoginStateLoaded(this.data);
  

 final  T data;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateLoadedCopyWith<T, LoginStateLoaded<T>> get copyWith => _$LoginStateLoadedCopyWithImpl<T, LoginStateLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateLoaded<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'LoginState<$T>.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoginStateLoadedCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory $LoginStateLoadedCopyWith(LoginStateLoaded<T> value, $Res Function(LoginStateLoaded<T>) _then) = _$LoginStateLoadedCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$LoginStateLoadedCopyWithImpl<T,$Res>
    implements $LoginStateLoadedCopyWith<T, $Res> {
  _$LoginStateLoadedCopyWithImpl(this._self, this._then);

  final LoginStateLoaded<T> _self;
  final $Res Function(LoginStateLoaded<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(LoginStateLoaded<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class LoginStateError<T> implements LoginState<T> {
  const LoginStateError(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateErrorCopyWith<T, LoginStateError<T>> get copyWith => _$LoginStateErrorCopyWithImpl<T, LoginStateError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginStateErrorCopyWith<T,$Res> implements $LoginStateCopyWith<T, $Res> {
  factory $LoginStateErrorCopyWith(LoginStateError<T> value, $Res Function(LoginStateError<T>) _then) = _$LoginStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginStateErrorCopyWithImpl<T,$Res>
    implements $LoginStateErrorCopyWith<T, $Res> {
  _$LoginStateErrorCopyWithImpl(this._self, this._then);

  final LoginStateError<T> _self;
  final $Res Function(LoginStateError<T>) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginStateError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
