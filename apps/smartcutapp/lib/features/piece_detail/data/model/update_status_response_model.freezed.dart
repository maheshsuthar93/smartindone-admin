// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_status_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateStatusResponseModel {

 String get id;
/// Create a copy of UpdateStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateStatusResponseModelCopyWith<UpdateStatusResponseModel> get copyWith => _$UpdateStatusResponseModelCopyWithImpl<UpdateStatusResponseModel>(this as UpdateStatusResponseModel, _$identity);

  /// Serializes this UpdateStatusResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UpdateStatusResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateStatusResponseModel&&(identical(other.id, _this.id) || other.id == _this.id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UpdateStatusResponseModel;
  return Object.hash(runtimeType,_this.id);
}

@override
String toString() {
  final _this = this as UpdateStatusResponseModel;
  return 'UpdateStatusResponseModel(id: ${_this.id})';
}


}

/// @nodoc
abstract mixin class $UpdateStatusResponseModelCopyWith<$Res>  {
  factory $UpdateStatusResponseModelCopyWith(UpdateStatusResponseModel value, $Res Function(UpdateStatusResponseModel) _then) = _$UpdateStatusResponseModelCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$UpdateStatusResponseModelCopyWithImpl<$Res>
    implements $UpdateStatusResponseModelCopyWith<$Res> {
  _$UpdateStatusResponseModelCopyWithImpl(this._self, this._then);

  final UpdateStatusResponseModel _self;
  final $Res Function(UpdateStatusResponseModel) _then;

/// Create a copy of UpdateStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(UpdateStatusResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateStatusResponseModel].
extension UpdateStatusResponseModelPatterns on UpdateStatusResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateStatusResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateStatusResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateStatusResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateStatusResponseModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateStatusResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateStatusResponseModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateStatusResponseModel() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _UpdateStatusResponseModel():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _UpdateStatusResponseModel() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateStatusResponseModel implements UpdateStatusResponseModel {
  const _UpdateStatusResponseModel({required this.id});
  factory _UpdateStatusResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateStatusResponseModelFromJson(json);

@override final  String id;

/// Create a copy of UpdateStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateStatusResponseModelCopyWith<_UpdateStatusResponseModel> get copyWith => __$UpdateStatusResponseModelCopyWithImpl<_UpdateStatusResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateStatusResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateStatusResponseModel&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'UpdateStatusResponseModel(id: $id)';
}


}

/// @nodoc
abstract mixin class _$UpdateStatusResponseModelCopyWith<$Res> implements $UpdateStatusResponseModelCopyWith<$Res> {
  factory _$UpdateStatusResponseModelCopyWith(_UpdateStatusResponseModel value, $Res Function(_UpdateStatusResponseModel) _then) = __$UpdateStatusResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$UpdateStatusResponseModelCopyWithImpl<$Res>
    implements _$UpdateStatusResponseModelCopyWith<$Res> {
  __$UpdateStatusResponseModelCopyWithImpl(this._self, this._then);

  final _UpdateStatusResponseModel _self;
  final $Res Function(_UpdateStatusResponseModel) _then;

/// Create a copy of UpdateStatusResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_UpdateStatusResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
