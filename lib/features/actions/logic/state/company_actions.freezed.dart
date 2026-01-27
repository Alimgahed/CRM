// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyActionState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyActionState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyActionState<$T>()';
}


}

/// @nodoc
class $CompanyActionStateCopyWith<T,$Res>  {
$CompanyActionStateCopyWith(CompanyActionState<T> _, $Res Function(CompanyActionState<T>) __);
}


/// Adds pattern-matching-related methods to [CompanyActionState].
extension CompanyActionStatePatterns<T> on CompanyActionState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompanyActionStateInitial<T> value)?  initial,TResult Function( CompanyActionStateLoading<T> value)?  loading,TResult Function( CompanyActionStateLoaded<T> value)?  loaded,TResult Function( CompanyActionStateError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompanyActionStateInitial() when initial != null:
return initial(_that);case CompanyActionStateLoading() when loading != null:
return loading(_that);case CompanyActionStateLoaded() when loaded != null:
return loaded(_that);case CompanyActionStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompanyActionStateInitial<T> value)  initial,required TResult Function( CompanyActionStateLoading<T> value)  loading,required TResult Function( CompanyActionStateLoaded<T> value)  loaded,required TResult Function( CompanyActionStateError<T> value)  error,}){
final _that = this;
switch (_that) {
case CompanyActionStateInitial():
return initial(_that);case CompanyActionStateLoading():
return loading(_that);case CompanyActionStateLoaded():
return loaded(_that);case CompanyActionStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompanyActionStateInitial<T> value)?  initial,TResult? Function( CompanyActionStateLoading<T> value)?  loading,TResult? Function( CompanyActionStateLoaded<T> value)?  loaded,TResult? Function( CompanyActionStateError<T> value)?  error,}){
final _that = this;
switch (_that) {
case CompanyActionStateInitial() when initial != null:
return initial(_that);case CompanyActionStateLoading() when loading != null:
return loading(_that);case CompanyActionStateLoaded() when loaded != null:
return loaded(_that);case CompanyActionStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CompanyActionsModel> data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompanyActionStateInitial() when initial != null:
return initial();case CompanyActionStateLoading() when loading != null:
return loading();case CompanyActionStateLoaded() when loaded != null:
return loaded(_that.data);case CompanyActionStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CompanyActionsModel> data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CompanyActionStateInitial():
return initial();case CompanyActionStateLoading():
return loading();case CompanyActionStateLoaded():
return loaded(_that.data);case CompanyActionStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CompanyActionsModel> data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CompanyActionStateInitial() when initial != null:
return initial();case CompanyActionStateLoading() when loading != null:
return loading();case CompanyActionStateLoaded() when loaded != null:
return loaded(_that.data);case CompanyActionStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CompanyActionStateInitial<T> implements CompanyActionState<T> {
  const CompanyActionStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyActionStateInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyActionState<$T>.initial()';
}


}




/// @nodoc


class CompanyActionStateLoading<T> implements CompanyActionState<T> {
  const CompanyActionStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyActionStateLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyActionState<$T>.loading()';
}


}




/// @nodoc


class CompanyActionStateLoaded<T> implements CompanyActionState<T> {
  const CompanyActionStateLoaded(final  List<CompanyActionsModel> data): _data = data;
  

 final  List<CompanyActionsModel> _data;
 List<CompanyActionsModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CompanyActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyActionStateLoadedCopyWith<T, CompanyActionStateLoaded<T>> get copyWith => _$CompanyActionStateLoadedCopyWithImpl<T, CompanyActionStateLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyActionStateLoaded<T>&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CompanyActionState<$T>.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $CompanyActionStateLoadedCopyWith<T,$Res> implements $CompanyActionStateCopyWith<T, $Res> {
  factory $CompanyActionStateLoadedCopyWith(CompanyActionStateLoaded<T> value, $Res Function(CompanyActionStateLoaded<T>) _then) = _$CompanyActionStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<CompanyActionsModel> data
});




}
/// @nodoc
class _$CompanyActionStateLoadedCopyWithImpl<T,$Res>
    implements $CompanyActionStateLoadedCopyWith<T, $Res> {
  _$CompanyActionStateLoadedCopyWithImpl(this._self, this._then);

  final CompanyActionStateLoaded<T> _self;
  final $Res Function(CompanyActionStateLoaded<T>) _then;

/// Create a copy of CompanyActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CompanyActionStateLoaded<T>(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CompanyActionsModel>,
  ));
}


}

/// @nodoc


class CompanyActionStateError<T> implements CompanyActionState<T> {
  const CompanyActionStateError(this.message);
  

 final  String message;

/// Create a copy of CompanyActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyActionStateErrorCopyWith<T, CompanyActionStateError<T>> get copyWith => _$CompanyActionStateErrorCopyWithImpl<T, CompanyActionStateError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyActionStateError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CompanyActionState<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CompanyActionStateErrorCopyWith<T,$Res> implements $CompanyActionStateCopyWith<T, $Res> {
  factory $CompanyActionStateErrorCopyWith(CompanyActionStateError<T> value, $Res Function(CompanyActionStateError<T>) _then) = _$CompanyActionStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CompanyActionStateErrorCopyWithImpl<T,$Res>
    implements $CompanyActionStateErrorCopyWith<T, $Res> {
  _$CompanyActionStateErrorCopyWithImpl(this._self, this._then);

  final CompanyActionStateError<T> _self;
  final $Res Function(CompanyActionStateError<T>) _then;

/// Create a copy of CompanyActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CompanyActionStateError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
