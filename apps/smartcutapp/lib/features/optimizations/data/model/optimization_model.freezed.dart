// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'optimization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OptimizationModel {

 String get id; String get optimizationNo; OptimizationStatus get status; double? get kerf; String? get contactPhone; String? get contactEmail;
/// Create a copy of OptimizationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationModelCopyWith<OptimizationModel> get copyWith => _$OptimizationModelCopyWithImpl<OptimizationModel>(this as OptimizationModel, _$identity);

  /// Serializes this OptimizationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptimizationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptimizationModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.optimizationNo, _this.optimizationNo) || other.optimizationNo == _this.optimizationNo)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.kerf, _this.kerf) || other.kerf == _this.kerf)&&(identical(other.contactPhone, _this.contactPhone) || other.contactPhone == _this.contactPhone)&&(identical(other.contactEmail, _this.contactEmail) || other.contactEmail == _this.contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptimizationModel;
  return Object.hash(runtimeType,_this.id,_this.optimizationNo,_this.status,_this.kerf,_this.contactPhone,_this.contactEmail);
}

@override
String toString() {
  final _this = this as OptimizationModel;
  return 'OptimizationModel(id: ${_this.id}, optimizationNo: ${_this.optimizationNo}, status: ${_this.status}, kerf: ${_this.kerf}, contactPhone: ${_this.contactPhone}, contactEmail: ${_this.contactEmail})';
}


}

/// @nodoc
abstract mixin class $OptimizationModelCopyWith<$Res>  {
  factory $OptimizationModelCopyWith(OptimizationModel value, $Res Function(OptimizationModel) _then) = _$OptimizationModelCopyWithImpl;
@useResult
$Res call({
 String id, String optimizationNo, OptimizationStatus status, double? kerf, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class _$OptimizationModelCopyWithImpl<$Res>
    implements $OptimizationModelCopyWith<$Res> {
  _$OptimizationModelCopyWithImpl(this._self, this._then);

  final OptimizationModel _self;
  final $Res Function(OptimizationModel) _then;

/// Create a copy of OptimizationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? optimizationNo = null,Object? status = null,Object? kerf = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(OptimizationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationNo: null == optimizationNo ? _self.optimizationNo : optimizationNo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OptimizationStatus,kerf: freezed == kerf ? _self.kerf : kerf // ignore: cast_nullable_to_non_nullable
as double?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OptimizationModel].
extension OptimizationModelPatterns on OptimizationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptimizationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptimizationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptimizationModel value)  $default,){
final _that = this;
switch (_that) {
case _OptimizationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptimizationModel value)?  $default,){
final _that = this;
switch (_that) {
case _OptimizationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String optimizationNo,  OptimizationStatus status,  double? kerf,  String? contactPhone,  String? contactEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptimizationModel() when $default != null:
return $default(_that.id,_that.optimizationNo,_that.status,_that.kerf,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String optimizationNo,  OptimizationStatus status,  double? kerf,  String? contactPhone,  String? contactEmail)  $default,) {final _that = this;
switch (_that) {
case _OptimizationModel():
return $default(_that.id,_that.optimizationNo,_that.status,_that.kerf,_that.contactPhone,_that.contactEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String optimizationNo,  OptimizationStatus status,  double? kerf,  String? contactPhone,  String? contactEmail)?  $default,) {final _that = this;
switch (_that) {
case _OptimizationModel() when $default != null:
return $default(_that.id,_that.optimizationNo,_that.status,_that.kerf,_that.contactPhone,_that.contactEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptimizationModel implements OptimizationModel {
  const _OptimizationModel({required this.id, required this.optimizationNo, required this.status, this.kerf, this.contactPhone, this.contactEmail});
  factory _OptimizationModel.fromJson(Map<String, dynamic> json) => _$OptimizationModelFromJson(json);

@override final  String id;
@override final  String optimizationNo;
@override final  OptimizationStatus status;
@override final  double? kerf;
@override final  String? contactPhone;
@override final  String? contactEmail;

/// Create a copy of OptimizationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationModelCopyWith<_OptimizationModel> get copyWith => __$OptimizationModelCopyWithImpl<_OptimizationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptimizationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.optimizationNo, optimizationNo) || other.optimizationNo == optimizationNo)&&(identical(other.status, status) || other.status == status)&&(identical(other.kerf, kerf) || other.kerf == kerf)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,optimizationNo,status,kerf,contactPhone,contactEmail);
}

@override
String toString() {
    return 'OptimizationModel(id: $id, optimizationNo: $optimizationNo, status: $status, kerf: $kerf, contactPhone: $contactPhone, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class _$OptimizationModelCopyWith<$Res> implements $OptimizationModelCopyWith<$Res> {
  factory _$OptimizationModelCopyWith(_OptimizationModel value, $Res Function(_OptimizationModel) _then) = __$OptimizationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String optimizationNo, OptimizationStatus status, double? kerf, String? contactPhone, String? contactEmail
});




}
/// @nodoc
class __$OptimizationModelCopyWithImpl<$Res>
    implements _$OptimizationModelCopyWith<$Res> {
  __$OptimizationModelCopyWithImpl(this._self, this._then);

  final _OptimizationModel _self;
  final $Res Function(_OptimizationModel) _then;

/// Create a copy of OptimizationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? optimizationNo = null,Object? status = null,Object? kerf = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,}) {
  return _then(_OptimizationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationNo: null == optimizationNo ? _self.optimizationNo : optimizationNo // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OptimizationStatus,kerf: freezed == kerf ? _self.kerf : kerf // ignore: cast_nullable_to_non_nullable
as double?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
