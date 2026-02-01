// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RequestState()';
}


}

/// @nodoc
class $RequestStateCopyWith<$Res>  {
$RequestStateCopyWith(RequestState _, $Res Function(RequestState) __);
}


/// Adds pattern-matching-related methods to [RequestState].
extension RequestStatePatterns on RequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RequestStateInitial value)?  initial,TResult Function( RequestStateLoading value)?  loading,TResult Function( RequestStateLoaded value)?  loaded,TResult Function( RequestStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RequestStateInitial() when initial != null:
return initial(_that);case RequestStateLoading() when loading != null:
return loading(_that);case RequestStateLoaded() when loaded != null:
return loaded(_that);case RequestStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RequestStateInitial value)  initial,required TResult Function( RequestStateLoading value)  loading,required TResult Function( RequestStateLoaded value)  loaded,required TResult Function( RequestStateError value)  error,}){
final _that = this;
switch (_that) {
case RequestStateInitial():
return initial(_that);case RequestStateLoading():
return loading(_that);case RequestStateLoaded():
return loaded(_that);case RequestStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RequestStateInitial value)?  initial,TResult? Function( RequestStateLoading value)?  loading,TResult? Function( RequestStateLoaded value)?  loaded,TResult? Function( RequestStateError value)?  error,}){
final _that = this;
switch (_that) {
case RequestStateInitial() when initial != null:
return initial(_that);case RequestStateLoading() when loading != null:
return loading(_that);case RequestStateLoaded() when loaded != null:
return loaded(_that);case RequestStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<RequestModel> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RequestStateInitial() when initial != null:
return initial();case RequestStateLoading() when loading != null:
return loading();case RequestStateLoaded() when loaded != null:
return loaded(_that.data);case RequestStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<RequestModel> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case RequestStateInitial():
return initial();case RequestStateLoading():
return loading();case RequestStateLoaded():
return loaded(_that.data);case RequestStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<RequestModel> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case RequestStateInitial() when initial != null:
return initial();case RequestStateLoading() when loading != null:
return loading();case RequestStateLoaded() when loaded != null:
return loaded(_that.data);case RequestStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RequestStateInitial implements RequestState {
  const RequestStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RequestState.initial()';
}


}




/// @nodoc


class RequestStateLoading implements RequestState {
  const RequestStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RequestState.loading()';
}


}




/// @nodoc


class RequestStateLoaded implements RequestState {
  const RequestStateLoaded(final  List<RequestModel> data): _data = data;
  

 final  List<RequestModel> _data;
 List<RequestModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestStateLoadedCopyWith<RequestStateLoaded> get copyWith => _$RequestStateLoadedCopyWithImpl<RequestStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestStateLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'RequestState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $RequestStateLoadedCopyWith<$Res> implements $RequestStateCopyWith<$Res> {
  factory $RequestStateLoadedCopyWith(RequestStateLoaded value, $Res Function(RequestStateLoaded) _then) = _$RequestStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<RequestModel> data
});




}
/// @nodoc
class _$RequestStateLoadedCopyWithImpl<$Res>
    implements $RequestStateLoadedCopyWith<$Res> {
  _$RequestStateLoadedCopyWithImpl(this._self, this._then);

  final RequestStateLoaded _self;
  final $Res Function(RequestStateLoaded) _then;

/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(RequestStateLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<RequestModel>,
  ));
}


}

/// @nodoc


class RequestStateError implements RequestState {
  const RequestStateError(this.message);
  

 final  String message;

/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestStateErrorCopyWith<RequestStateError> get copyWith => _$RequestStateErrorCopyWithImpl<RequestStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RequestState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RequestStateErrorCopyWith<$Res> implements $RequestStateCopyWith<$Res> {
  factory $RequestStateErrorCopyWith(RequestStateError value, $Res Function(RequestStateError) _then) = _$RequestStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RequestStateErrorCopyWithImpl<$Res>
    implements $RequestStateErrorCopyWith<$Res> {
  _$RequestStateErrorCopyWithImpl(this._self, this._then);

  final RequestStateError _self;
  final $Res Function(RequestStateError) _then;

/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RequestStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
