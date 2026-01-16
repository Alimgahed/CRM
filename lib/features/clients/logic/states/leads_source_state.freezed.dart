// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leads_source_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeadsSourceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsSourceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsSourceState()';
}


}

/// @nodoc
class $LeadsSourceStateCopyWith<$Res>  {
$LeadsSourceStateCopyWith(LeadsSourceState _, $Res Function(LeadsSourceState) __);
}


/// Adds pattern-matching-related methods to [LeadsSourceState].
extension LeadsSourceStatePatterns on LeadsSourceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LeadsSourceStateInitial value)?  initial,TResult Function( LeadsSourceStateLoading value)?  loading,TResult Function( LeadsSourceStateLoaded value)?  loaded,TResult Function( LeadsSourceStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LeadsSourceStateInitial() when initial != null:
return initial(_that);case LeadsSourceStateLoading() when loading != null:
return loading(_that);case LeadsSourceStateLoaded() when loaded != null:
return loaded(_that);case LeadsSourceStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LeadsSourceStateInitial value)  initial,required TResult Function( LeadsSourceStateLoading value)  loading,required TResult Function( LeadsSourceStateLoaded value)  loaded,required TResult Function( LeadsSourceStateError value)  error,}){
final _that = this;
switch (_that) {
case LeadsSourceStateInitial():
return initial(_that);case LeadsSourceStateLoading():
return loading(_that);case LeadsSourceStateLoaded():
return loaded(_that);case LeadsSourceStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LeadsSourceStateInitial value)?  initial,TResult? Function( LeadsSourceStateLoading value)?  loading,TResult? Function( LeadsSourceStateLoaded value)?  loaded,TResult? Function( LeadsSourceStateError value)?  error,}){
final _that = this;
switch (_that) {
case LeadsSourceStateInitial() when initial != null:
return initial(_that);case LeadsSourceStateLoading() when loading != null:
return loading(_that);case LeadsSourceStateLoaded() when loaded != null:
return loaded(_that);case LeadsSourceStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<LeadSource> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LeadsSourceStateInitial() when initial != null:
return initial();case LeadsSourceStateLoading() when loading != null:
return loading();case LeadsSourceStateLoaded() when loaded != null:
return loaded(_that.data);case LeadsSourceStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<LeadSource> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LeadsSourceStateInitial():
return initial();case LeadsSourceStateLoading():
return loading();case LeadsSourceStateLoaded():
return loaded(_that.data);case LeadsSourceStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<LeadSource> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LeadsSourceStateInitial() when initial != null:
return initial();case LeadsSourceStateLoading() when loading != null:
return loading();case LeadsSourceStateLoaded() when loaded != null:
return loaded(_that.data);case LeadsSourceStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LeadsSourceStateInitial implements LeadsSourceState {
  const LeadsSourceStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsSourceStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsSourceState.initial()';
}


}




/// @nodoc


class LeadsSourceStateLoading implements LeadsSourceState {
  const LeadsSourceStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsSourceStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsSourceState.loading()';
}


}




/// @nodoc


class LeadsSourceStateLoaded implements LeadsSourceState {
  const LeadsSourceStateLoaded(final  List<LeadSource> data): _data = data;
  

 final  List<LeadSource> _data;
 List<LeadSource> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LeadsSourceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadsSourceStateLoadedCopyWith<LeadsSourceStateLoaded> get copyWith => _$LeadsSourceStateLoadedCopyWithImpl<LeadsSourceStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsSourceStateLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LeadsSourceState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LeadsSourceStateLoadedCopyWith<$Res> implements $LeadsSourceStateCopyWith<$Res> {
  factory $LeadsSourceStateLoadedCopyWith(LeadsSourceStateLoaded value, $Res Function(LeadsSourceStateLoaded) _then) = _$LeadsSourceStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<LeadSource> data
});




}
/// @nodoc
class _$LeadsSourceStateLoadedCopyWithImpl<$Res>
    implements $LeadsSourceStateLoadedCopyWith<$Res> {
  _$LeadsSourceStateLoadedCopyWithImpl(this._self, this._then);

  final LeadsSourceStateLoaded _self;
  final $Res Function(LeadsSourceStateLoaded) _then;

/// Create a copy of LeadsSourceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LeadsSourceStateLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<LeadSource>,
  ));
}


}

/// @nodoc


class LeadsSourceStateError implements LeadsSourceState {
  const LeadsSourceStateError(this.message);
  

 final  String message;

/// Create a copy of LeadsSourceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadsSourceStateErrorCopyWith<LeadsSourceStateError> get copyWith => _$LeadsSourceStateErrorCopyWithImpl<LeadsSourceStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsSourceStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LeadsSourceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LeadsSourceStateErrorCopyWith<$Res> implements $LeadsSourceStateCopyWith<$Res> {
  factory $LeadsSourceStateErrorCopyWith(LeadsSourceStateError value, $Res Function(LeadsSourceStateError) _then) = _$LeadsSourceStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LeadsSourceStateErrorCopyWithImpl<$Res>
    implements $LeadsSourceStateErrorCopyWith<$Res> {
  _$LeadsSourceStateErrorCopyWithImpl(this._self, this._then);

  final LeadsSourceStateError _self;
  final $Res Function(LeadsSourceStateError) _then;

/// Create a copy of LeadsSourceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LeadsSourceStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
