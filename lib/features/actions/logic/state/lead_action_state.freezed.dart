// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeadActionState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadActionState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadActionState<$T>()';
}


}

/// @nodoc
class $LeadActionStateCopyWith<T,$Res>  {
$LeadActionStateCopyWith(LeadActionState<T> _, $Res Function(LeadActionState<T>) __);
}


/// Adds pattern-matching-related methods to [LeadActionState].
extension LeadActionStatePatterns<T> on LeadActionState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LeadActionStateInitial<T> value)?  initial,TResult Function( LeadActionStateLoading<T> value)?  loading,TResult Function( LeadActionStateLoaded<T> value)?  loaded,TResult Function( LeadActionStateError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LeadActionStateInitial() when initial != null:
return initial(_that);case LeadActionStateLoading() when loading != null:
return loading(_that);case LeadActionStateLoaded() when loaded != null:
return loaded(_that);case LeadActionStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LeadActionStateInitial<T> value)  initial,required TResult Function( LeadActionStateLoading<T> value)  loading,required TResult Function( LeadActionStateLoaded<T> value)  loaded,required TResult Function( LeadActionStateError<T> value)  error,}){
final _that = this;
switch (_that) {
case LeadActionStateInitial():
return initial(_that);case LeadActionStateLoading():
return loading(_that);case LeadActionStateLoaded():
return loaded(_that);case LeadActionStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LeadActionStateInitial<T> value)?  initial,TResult? Function( LeadActionStateLoading<T> value)?  loading,TResult? Function( LeadActionStateLoaded<T> value)?  loaded,TResult? Function( LeadActionStateError<T> value)?  error,}){
final _that = this;
switch (_that) {
case LeadActionStateInitial() when initial != null:
return initial(_that);case LeadActionStateLoading() when loading != null:
return loading(_that);case LeadActionStateLoaded() when loaded != null:
return loaded(_that);case LeadActionStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<LeadActionModel> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LeadActionStateInitial() when initial != null:
return initial();case LeadActionStateLoading() when loading != null:
return loading();case LeadActionStateLoaded() when loaded != null:
return loaded(_that.data);case LeadActionStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<LeadActionModel> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LeadActionStateInitial():
return initial();case LeadActionStateLoading():
return loading();case LeadActionStateLoaded():
return loaded(_that.data);case LeadActionStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<LeadActionModel> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LeadActionStateInitial() when initial != null:
return initial();case LeadActionStateLoading() when loading != null:
return loading();case LeadActionStateLoaded() when loaded != null:
return loaded(_that.data);case LeadActionStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LeadActionStateInitial<T> implements LeadActionState<T> {
  const LeadActionStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadActionStateInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadActionState<$T>.initial()';
}


}




/// @nodoc


class LeadActionStateLoading<T> implements LeadActionState<T> {
  const LeadActionStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadActionStateLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadActionState<$T>.loading()';
}


}




/// @nodoc


class LeadActionStateLoaded<T> implements LeadActionState<T> {
  const LeadActionStateLoaded(final  List<LeadActionModel> data): _data = data;
  

 final  List<LeadActionModel> _data;
 List<LeadActionModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LeadActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadActionStateLoadedCopyWith<T, LeadActionStateLoaded<T>> get copyWith => _$LeadActionStateLoadedCopyWithImpl<T, LeadActionStateLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadActionStateLoaded<T>&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LeadActionState<$T>.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LeadActionStateLoadedCopyWith<T,$Res> implements $LeadActionStateCopyWith<T, $Res> {
  factory $LeadActionStateLoadedCopyWith(LeadActionStateLoaded<T> value, $Res Function(LeadActionStateLoaded<T>) _then) = _$LeadActionStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<LeadActionModel> data
});




}
/// @nodoc
class _$LeadActionStateLoadedCopyWithImpl<T,$Res>
    implements $LeadActionStateLoadedCopyWith<T, $Res> {
  _$LeadActionStateLoadedCopyWithImpl(this._self, this._then);

  final LeadActionStateLoaded<T> _self;
  final $Res Function(LeadActionStateLoaded<T>) _then;

/// Create a copy of LeadActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LeadActionStateLoaded<T>(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<LeadActionModel>,
  ));
}


}

/// @nodoc


class LeadActionStateError<T> implements LeadActionState<T> {
  const LeadActionStateError(this.message);
  

 final  String message;

/// Create a copy of LeadActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadActionStateErrorCopyWith<T, LeadActionStateError<T>> get copyWith => _$LeadActionStateErrorCopyWithImpl<T, LeadActionStateError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadActionStateError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LeadActionState<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LeadActionStateErrorCopyWith<T,$Res> implements $LeadActionStateCopyWith<T, $Res> {
  factory $LeadActionStateErrorCopyWith(LeadActionStateError<T> value, $Res Function(LeadActionStateError<T>) _then) = _$LeadActionStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LeadActionStateErrorCopyWithImpl<T,$Res>
    implements $LeadActionStateErrorCopyWith<T, $Res> {
  _$LeadActionStateErrorCopyWithImpl(this._self, this._then);

  final LeadActionStateError<T> _self;
  final $Res Function(LeadActionStateError<T>) _then;

/// Create a copy of LeadActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LeadActionStateError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
