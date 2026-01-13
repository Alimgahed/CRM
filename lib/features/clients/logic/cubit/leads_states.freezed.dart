// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leads_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeadsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsState()';
}


}

/// @nodoc
class $LeadsStateCopyWith<$Res>  {
$LeadsStateCopyWith(LeadsState _, $Res Function(LeadsState) __);
}


/// Adds pattern-matching-related methods to [LeadsState].
extension LeadsStatePatterns on LeadsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LeadsStateInitial value)?  initial,TResult Function( LeadsStateLoading value)?  loading,TResult Function( LeadsStateLoaded value)?  loaded,TResult Function( LeadsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LeadsStateInitial() when initial != null:
return initial(_that);case LeadsStateLoading() when loading != null:
return loading(_that);case LeadsStateLoaded() when loaded != null:
return loaded(_that);case LeadsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LeadsStateInitial value)  initial,required TResult Function( LeadsStateLoading value)  loading,required TResult Function( LeadsStateLoaded value)  loaded,required TResult Function( LeadsStateError value)  error,}){
final _that = this;
switch (_that) {
case LeadsStateInitial():
return initial(_that);case LeadsStateLoading():
return loading(_that);case LeadsStateLoaded():
return loaded(_that);case LeadsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LeadsStateInitial value)?  initial,TResult? Function( LeadsStateLoading value)?  loading,TResult? Function( LeadsStateLoaded value)?  loaded,TResult? Function( LeadsStateError value)?  error,}){
final _that = this;
switch (_that) {
case LeadsStateInitial() when initial != null:
return initial(_that);case LeadsStateLoading() when loading != null:
return loading(_that);case LeadsStateLoaded() when loaded != null:
return loaded(_that);case LeadsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Lead> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LeadsStateInitial() when initial != null:
return initial();case LeadsStateLoading() when loading != null:
return loading();case LeadsStateLoaded() when loaded != null:
return loaded(_that.data);case LeadsStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Lead> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LeadsStateInitial():
return initial();case LeadsStateLoading():
return loading();case LeadsStateLoaded():
return loaded(_that.data);case LeadsStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Lead> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LeadsStateInitial() when initial != null:
return initial();case LeadsStateLoading() when loading != null:
return loading();case LeadsStateLoaded() when loaded != null:
return loaded(_that.data);case LeadsStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LeadsStateInitial implements LeadsState {
  const LeadsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsState.initial()';
}


}




/// @nodoc


class LeadsStateLoading implements LeadsState {
  const LeadsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsState.loading()';
}


}




/// @nodoc


class LeadsStateLoaded implements LeadsState {
  const LeadsStateLoaded(final  List<Lead> data): _data = data;
  

 final  List<Lead> _data;
 List<Lead> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadsStateLoadedCopyWith<LeadsStateLoaded> get copyWith => _$LeadsStateLoadedCopyWithImpl<LeadsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsStateLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LeadsState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LeadsStateLoadedCopyWith<$Res> implements $LeadsStateCopyWith<$Res> {
  factory $LeadsStateLoadedCopyWith(LeadsStateLoaded value, $Res Function(LeadsStateLoaded) _then) = _$LeadsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Lead> data
});




}
/// @nodoc
class _$LeadsStateLoadedCopyWithImpl<$Res>
    implements $LeadsStateLoadedCopyWith<$Res> {
  _$LeadsStateLoadedCopyWithImpl(this._self, this._then);

  final LeadsStateLoaded _self;
  final $Res Function(LeadsStateLoaded) _then;

/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LeadsStateLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Lead>,
  ));
}


}

/// @nodoc


class LeadsStateError implements LeadsState {
  const LeadsStateError(this.message);
  

 final  String message;

/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadsStateErrorCopyWith<LeadsStateError> get copyWith => _$LeadsStateErrorCopyWithImpl<LeadsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LeadsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LeadsStateErrorCopyWith<$Res> implements $LeadsStateCopyWith<$Res> {
  factory $LeadsStateErrorCopyWith(LeadsStateError value, $Res Function(LeadsStateError) _then) = _$LeadsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LeadsStateErrorCopyWithImpl<$Res>
    implements $LeadsStateErrorCopyWith<$Res> {
  _$LeadsStateErrorCopyWithImpl(this._self, this._then);

  final LeadsStateError _self;
  final $Res Function(LeadsStateError) _then;

/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LeadsStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
