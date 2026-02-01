// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentsState()';
}


}

/// @nodoc
class $CommentsStateCopyWith<$Res>  {
$CommentsStateCopyWith(CommentsState _, $Res Function(CommentsState) __);
}


/// Adds pattern-matching-related methods to [CommentsState].
extension CommentsStatePatterns on CommentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CommentsStateInitial value)?  initial,TResult Function( CommentsStateLoading value)?  loading,TResult Function( CommentsStateLoaded value)?  loaded,TResult Function( CommentsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CommentsStateInitial() when initial != null:
return initial(_that);case CommentsStateLoading() when loading != null:
return loading(_that);case CommentsStateLoaded() when loaded != null:
return loaded(_that);case CommentsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CommentsStateInitial value)  initial,required TResult Function( CommentsStateLoading value)  loading,required TResult Function( CommentsStateLoaded value)  loaded,required TResult Function( CommentsStateError value)  error,}){
final _that = this;
switch (_that) {
case CommentsStateInitial():
return initial(_that);case CommentsStateLoading():
return loading(_that);case CommentsStateLoaded():
return loaded(_that);case CommentsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CommentsStateInitial value)?  initial,TResult? Function( CommentsStateLoading value)?  loading,TResult? Function( CommentsStateLoaded value)?  loaded,TResult? Function( CommentsStateError value)?  error,}){
final _that = this;
switch (_that) {
case CommentsStateInitial() when initial != null:
return initial(_that);case CommentsStateLoading() when loading != null:
return loading(_that);case CommentsStateLoaded() when loaded != null:
return loaded(_that);case CommentsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CommentModel> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CommentsStateInitial() when initial != null:
return initial();case CommentsStateLoading() when loading != null:
return loading();case CommentsStateLoaded() when loaded != null:
return loaded(_that.data);case CommentsStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CommentModel> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CommentsStateInitial():
return initial();case CommentsStateLoading():
return loading();case CommentsStateLoaded():
return loaded(_that.data);case CommentsStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CommentModel> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CommentsStateInitial() when initial != null:
return initial();case CommentsStateLoading() when loading != null:
return loading();case CommentsStateLoaded() when loaded != null:
return loaded(_that.data);case CommentsStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CommentsStateInitial implements CommentsState {
  const CommentsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentsState.initial()';
}


}




/// @nodoc


class CommentsStateLoading implements CommentsState {
  const CommentsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CommentsState.loading()';
}


}




/// @nodoc


class CommentsStateLoaded implements CommentsState {
  const CommentsStateLoaded(final  List<CommentModel> data): _data = data;
  

 final  List<CommentModel> _data;
 List<CommentModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsStateLoadedCopyWith<CommentsStateLoaded> get copyWith => _$CommentsStateLoadedCopyWithImpl<CommentsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsStateLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CommentsState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $CommentsStateLoadedCopyWith<$Res> implements $CommentsStateCopyWith<$Res> {
  factory $CommentsStateLoadedCopyWith(CommentsStateLoaded value, $Res Function(CommentsStateLoaded) _then) = _$CommentsStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<CommentModel> data
});




}
/// @nodoc
class _$CommentsStateLoadedCopyWithImpl<$Res>
    implements $CommentsStateLoadedCopyWith<$Res> {
  _$CommentsStateLoadedCopyWithImpl(this._self, this._then);

  final CommentsStateLoaded _self;
  final $Res Function(CommentsStateLoaded) _then;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CommentsStateLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,
  ));
}


}

/// @nodoc


class CommentsStateError implements CommentsState {
  const CommentsStateError(this.message);
  

 final  String message;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentsStateErrorCopyWith<CommentsStateError> get copyWith => _$CommentsStateErrorCopyWithImpl<CommentsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CommentsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CommentsStateErrorCopyWith<$Res> implements $CommentsStateCopyWith<$Res> {
  factory $CommentsStateErrorCopyWith(CommentsStateError value, $Res Function(CommentsStateError) _then) = _$CommentsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CommentsStateErrorCopyWithImpl<$Res>
    implements $CommentsStateErrorCopyWith<$Res> {
  _$CommentsStateErrorCopyWithImpl(this._self, this._then);

  final CommentsStateError _self;
  final $Res Function(CommentsStateError) _then;

/// Create a copy of CommentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CommentsStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
