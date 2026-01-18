// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_user_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditUserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserState()';
}


}

/// @nodoc
class $EditUserStateCopyWith<$Res>  {
$EditUserStateCopyWith(EditUserState _, $Res Function(EditUserState) __);
}


/// Adds pattern-matching-related methods to [EditUserState].
extension EditUserStatePatterns on EditUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EditUserInitial value)?  initial,TResult Function( EditUserLoading value)?  loading,TResult Function( EditUserLoaded value)?  loaded,TResult Function( EditUserError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EditUserInitial() when initial != null:
return initial(_that);case EditUserLoading() when loading != null:
return loading(_that);case EditUserLoaded() when loaded != null:
return loaded(_that);case EditUserError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EditUserInitial value)  initial,required TResult Function( EditUserLoading value)  loading,required TResult Function( EditUserLoaded value)  loaded,required TResult Function( EditUserError value)  error,}){
final _that = this;
switch (_that) {
case EditUserInitial():
return initial(_that);case EditUserLoading():
return loading(_that);case EditUserLoaded():
return loaded(_that);case EditUserError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EditUserInitial value)?  initial,TResult? Function( EditUserLoading value)?  loading,TResult? Function( EditUserLoaded value)?  loaded,TResult? Function( EditUserError value)?  error,}){
final _that = this;
switch (_that) {
case EditUserInitial() when initial != null:
return initial(_that);case EditUserLoading() when loading != null:
return loading(_that);case EditUserLoaded() when loaded != null:
return loaded(_that);case EditUserError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String dsata)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EditUserInitial() when initial != null:
return initial();case EditUserLoading() when loading != null:
return loading();case EditUserLoaded() when loaded != null:
return loaded(_that.dsata);case EditUserError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String dsata)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case EditUserInitial():
return initial();case EditUserLoading():
return loading();case EditUserLoaded():
return loaded(_that.dsata);case EditUserError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String dsata)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case EditUserInitial() when initial != null:
return initial();case EditUserLoading() when loading != null:
return loading();case EditUserLoaded() when loaded != null:
return loaded(_that.dsata);case EditUserError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class EditUserInitial implements EditUserState {
  const EditUserInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserState.initial()';
}


}




/// @nodoc


class EditUserLoading implements EditUserState {
  const EditUserLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditUserState.loading()';
}


}




/// @nodoc


class EditUserLoaded implements EditUserState {
  const EditUserLoaded(this.dsata);
  

 final  String dsata;

/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditUserLoadedCopyWith<EditUserLoaded> get copyWith => _$EditUserLoadedCopyWithImpl<EditUserLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserLoaded&&(identical(other.dsata, dsata) || other.dsata == dsata));
}


@override
int get hashCode => Object.hash(runtimeType,dsata);

@override
String toString() {
  return 'EditUserState.loaded(dsata: $dsata)';
}


}

/// @nodoc
abstract mixin class $EditUserLoadedCopyWith<$Res> implements $EditUserStateCopyWith<$Res> {
  factory $EditUserLoadedCopyWith(EditUserLoaded value, $Res Function(EditUserLoaded) _then) = _$EditUserLoadedCopyWithImpl;
@useResult
$Res call({
 String dsata
});




}
/// @nodoc
class _$EditUserLoadedCopyWithImpl<$Res>
    implements $EditUserLoadedCopyWith<$Res> {
  _$EditUserLoadedCopyWithImpl(this._self, this._then);

  final EditUserLoaded _self;
  final $Res Function(EditUserLoaded) _then;

/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dsata = null,}) {
  return _then(EditUserLoaded(
null == dsata ? _self.dsata : dsata // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EditUserError implements EditUserState {
  const EditUserError(this.error);
  

 final  String error;

/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditUserErrorCopyWith<EditUserError> get copyWith => _$EditUserErrorCopyWithImpl<EditUserError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'EditUserState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $EditUserErrorCopyWith<$Res> implements $EditUserStateCopyWith<$Res> {
  factory $EditUserErrorCopyWith(EditUserError value, $Res Function(EditUserError) _then) = _$EditUserErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$EditUserErrorCopyWithImpl<$Res>
    implements $EditUserErrorCopyWith<$Res> {
  _$EditUserErrorCopyWithImpl(this._self, this._then);

  final EditUserError _self;
  final $Res Function(EditUserError) _then;

/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(EditUserError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
