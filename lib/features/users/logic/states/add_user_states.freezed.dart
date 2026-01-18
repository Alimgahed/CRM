// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_user_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddUserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddUserState()';
}


}

/// @nodoc
class $AddUserStateCopyWith<$Res>  {
$AddUserStateCopyWith(AddUserState _, $Res Function(AddUserState) __);
}


/// Adds pattern-matching-related methods to [AddUserState].
extension AddUserStatePatterns on AddUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddUserInitial value)?  initial,TResult Function( AddUserLoading value)?  loading,TResult Function( AddUserLoaded value)?  loaded,TResult Function( AddUserError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddUserInitial() when initial != null:
return initial(_that);case AddUserLoading() when loading != null:
return loading(_that);case AddUserLoaded() when loaded != null:
return loaded(_that);case AddUserError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddUserInitial value)  initial,required TResult Function( AddUserLoading value)  loading,required TResult Function( AddUserLoaded value)  loaded,required TResult Function( AddUserError value)  error,}){
final _that = this;
switch (_that) {
case AddUserInitial():
return initial(_that);case AddUserLoading():
return loading(_that);case AddUserLoaded():
return loaded(_that);case AddUserError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddUserInitial value)?  initial,TResult? Function( AddUserLoading value)?  loading,TResult? Function( AddUserLoaded value)?  loaded,TResult? Function( AddUserError value)?  error,}){
final _that = this;
switch (_that) {
case AddUserInitial() when initial != null:
return initial(_that);case AddUserLoading() when loading != null:
return loading(_that);case AddUserLoaded() when loaded != null:
return loaded(_that);case AddUserError() when error != null:
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
case AddUserInitial() when initial != null:
return initial();case AddUserLoading() when loading != null:
return loading();case AddUserLoaded() when loaded != null:
return loaded(_that.dsata);case AddUserError() when error != null:
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
case AddUserInitial():
return initial();case AddUserLoading():
return loading();case AddUserLoaded():
return loaded(_that.dsata);case AddUserError():
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
case AddUserInitial() when initial != null:
return initial();case AddUserLoading() when loading != null:
return loading();case AddUserLoaded() when loaded != null:
return loaded(_that.dsata);case AddUserError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class AddUserInitial implements AddUserState {
  const AddUserInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUserInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddUserState.initial()';
}


}




/// @nodoc


class AddUserLoading implements AddUserState {
  const AddUserLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUserLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddUserState.loading()';
}


}




/// @nodoc


class AddUserLoaded implements AddUserState {
  const AddUserLoaded(this.dsata);
  

 final  String dsata;

/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddUserLoadedCopyWith<AddUserLoaded> get copyWith => _$AddUserLoadedCopyWithImpl<AddUserLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUserLoaded&&(identical(other.dsata, dsata) || other.dsata == dsata));
}


@override
int get hashCode => Object.hash(runtimeType,dsata);

@override
String toString() {
  return 'AddUserState.loaded(dsata: $dsata)';
}


}

/// @nodoc
abstract mixin class $AddUserLoadedCopyWith<$Res> implements $AddUserStateCopyWith<$Res> {
  factory $AddUserLoadedCopyWith(AddUserLoaded value, $Res Function(AddUserLoaded) _then) = _$AddUserLoadedCopyWithImpl;
@useResult
$Res call({
 String dsata
});




}
/// @nodoc
class _$AddUserLoadedCopyWithImpl<$Res>
    implements $AddUserLoadedCopyWith<$Res> {
  _$AddUserLoadedCopyWithImpl(this._self, this._then);

  final AddUserLoaded _self;
  final $Res Function(AddUserLoaded) _then;

/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dsata = null,}) {
  return _then(AddUserLoaded(
null == dsata ? _self.dsata : dsata // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddUserError implements AddUserState {
  const AddUserError(this.error);
  

 final  String error;

/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddUserErrorCopyWith<AddUserError> get copyWith => _$AddUserErrorCopyWithImpl<AddUserError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddUserError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AddUserState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AddUserErrorCopyWith<$Res> implements $AddUserStateCopyWith<$Res> {
  factory $AddUserErrorCopyWith(AddUserError value, $Res Function(AddUserError) _then) = _$AddUserErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AddUserErrorCopyWithImpl<$Res>
    implements $AddUserErrorCopyWith<$Res> {
  _$AddUserErrorCopyWithImpl(this._self, this._then);

  final AddUserError _self;
  final $Res Function(AddUserError) _then;

/// Create a copy of AddUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AddUserError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
