// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeveloperStates<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperStates<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperStates<$T>()';
}


}

/// @nodoc
class $DeveloperStatesCopyWith<T,$Res>  {
$DeveloperStatesCopyWith(DeveloperStates<T> _, $Res Function(DeveloperStates<T>) __);
}


/// Adds pattern-matching-related methods to [DeveloperStates].
extension DeveloperStatesPatterns<T> on DeveloperStates<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeveloperStatesInitial<T> value)?  initial,TResult Function( DeveloperStatesLoading<T> value)?  loading,TResult Function( DeveloperStatesLoaded<T> value)?  loaded,TResult Function( DeveloperStatesError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeveloperStatesInitial() when initial != null:
return initial(_that);case DeveloperStatesLoading() when loading != null:
return loading(_that);case DeveloperStatesLoaded() when loaded != null:
return loaded(_that);case DeveloperStatesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeveloperStatesInitial<T> value)  initial,required TResult Function( DeveloperStatesLoading<T> value)  loading,required TResult Function( DeveloperStatesLoaded<T> value)  loaded,required TResult Function( DeveloperStatesError<T> value)  error,}){
final _that = this;
switch (_that) {
case DeveloperStatesInitial():
return initial(_that);case DeveloperStatesLoading():
return loading(_that);case DeveloperStatesLoaded():
return loaded(_that);case DeveloperStatesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeveloperStatesInitial<T> value)?  initial,TResult? Function( DeveloperStatesLoading<T> value)?  loading,TResult? Function( DeveloperStatesLoaded<T> value)?  loaded,TResult? Function( DeveloperStatesError<T> value)?  error,}){
final _that = this;
switch (_that) {
case DeveloperStatesInitial() when initial != null:
return initial(_that);case DeveloperStatesLoading() when loading != null:
return loading(_that);case DeveloperStatesLoaded() when loaded != null:
return loaded(_that);case DeveloperStatesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DeveloperCompany> companies)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeveloperStatesInitial() when initial != null:
return initial();case DeveloperStatesLoading() when loading != null:
return loading();case DeveloperStatesLoaded() when loaded != null:
return loaded(_that.companies);case DeveloperStatesError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DeveloperCompany> companies)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DeveloperStatesInitial():
return initial();case DeveloperStatesLoading():
return loading();case DeveloperStatesLoaded():
return loaded(_that.companies);case DeveloperStatesError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DeveloperCompany> companies)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DeveloperStatesInitial() when initial != null:
return initial();case DeveloperStatesLoading() when loading != null:
return loading();case DeveloperStatesLoaded() when loaded != null:
return loaded(_that.companies);case DeveloperStatesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DeveloperStatesInitial<T> implements DeveloperStates<T> {
  const DeveloperStatesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperStatesInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperStates<$T>.initial()';
}


}




/// @nodoc


class DeveloperStatesLoading<T> implements DeveloperStates<T> {
  const DeveloperStatesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperStatesLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperStates<$T>.loading()';
}


}




/// @nodoc


class DeveloperStatesLoaded<T> implements DeveloperStates<T> {
  const DeveloperStatesLoaded(final  List<DeveloperCompany> companies): _companies = companies;
  

 final  List<DeveloperCompany> _companies;
 List<DeveloperCompany> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}


/// Create a copy of DeveloperStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperStatesLoadedCopyWith<T, DeveloperStatesLoaded<T>> get copyWith => _$DeveloperStatesLoadedCopyWithImpl<T, DeveloperStatesLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperStatesLoaded<T>&&const DeepCollectionEquality().equals(other._companies, _companies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_companies));

@override
String toString() {
  return 'DeveloperStates<$T>.loaded(companies: $companies)';
}


}

/// @nodoc
abstract mixin class $DeveloperStatesLoadedCopyWith<T,$Res> implements $DeveloperStatesCopyWith<T, $Res> {
  factory $DeveloperStatesLoadedCopyWith(DeveloperStatesLoaded<T> value, $Res Function(DeveloperStatesLoaded<T>) _then) = _$DeveloperStatesLoadedCopyWithImpl;
@useResult
$Res call({
 List<DeveloperCompany> companies
});




}
/// @nodoc
class _$DeveloperStatesLoadedCopyWithImpl<T,$Res>
    implements $DeveloperStatesLoadedCopyWith<T, $Res> {
  _$DeveloperStatesLoadedCopyWithImpl(this._self, this._then);

  final DeveloperStatesLoaded<T> _self;
  final $Res Function(DeveloperStatesLoaded<T>) _then;

/// Create a copy of DeveloperStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companies = null,}) {
  return _then(DeveloperStatesLoaded<T>(
null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<DeveloperCompany>,
  ));
}


}

/// @nodoc


class DeveloperStatesError<T> implements DeveloperStates<T> {
  const DeveloperStatesError(this.message);
  

 final  String message;

/// Create a copy of DeveloperStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperStatesErrorCopyWith<T, DeveloperStatesError<T>> get copyWith => _$DeveloperStatesErrorCopyWithImpl<T, DeveloperStatesError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperStatesError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DeveloperStates<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeveloperStatesErrorCopyWith<T,$Res> implements $DeveloperStatesCopyWith<T, $Res> {
  factory $DeveloperStatesErrorCopyWith(DeveloperStatesError<T> value, $Res Function(DeveloperStatesError<T>) _then) = _$DeveloperStatesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeveloperStatesErrorCopyWithImpl<T,$Res>
    implements $DeveloperStatesErrorCopyWith<T, $Res> {
  _$DeveloperStatesErrorCopyWithImpl(this._self, this._then);

  final DeveloperStatesError<T> _self;
  final $Res Function(DeveloperStatesError<T>) _then;

/// Create a copy of DeveloperStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeveloperStatesError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
