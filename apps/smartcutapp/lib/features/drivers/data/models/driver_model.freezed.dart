// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverModel {

 String get id; String get companyId; String get name; String get phone; String? get email; String get licenseNo; String get vehicleNumber; String get vehicleType; String get status; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverModelCopyWith<DriverModel> get copyWith => _$DriverModelCopyWithImpl<DriverModel>(this as DriverModel, _$identity);

  /// Serializes this DriverModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DriverModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.companyId, _this.companyId) || other.companyId == _this.companyId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.licenseNo, _this.licenseNo) || other.licenseNo == _this.licenseNo)&&(identical(other.vehicleNumber, _this.vehicleNumber) || other.vehicleNumber == _this.vehicleNumber)&&(identical(other.vehicleType, _this.vehicleType) || other.vehicleType == _this.vehicleType)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DriverModel;
  return Object.hash(runtimeType,_this.id,_this.companyId,_this.name,_this.phone,_this.email,_this.licenseNo,_this.vehicleNumber,_this.vehicleType,_this.status,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as DriverModel;
  return 'DriverModel(id: ${_this.id}, companyId: ${_this.companyId}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email}, licenseNo: ${_this.licenseNo}, vehicleNumber: ${_this.vehicleNumber}, vehicleType: ${_this.vehicleType}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $DriverModelCopyWith<$Res>  {
  factory $DriverModelCopyWith(DriverModel value, $Res Function(DriverModel) _then) = _$DriverModelCopyWithImpl;
@useResult
$Res call({
 String id, String companyId, String name, String phone, String? email, String licenseNo, String vehicleNumber, String vehicleType, String status, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$DriverModelCopyWithImpl<$Res>
    implements $DriverModelCopyWith<$Res> {
  _$DriverModelCopyWithImpl(this._self, this._then);

  final DriverModel _self;
  final $Res Function(DriverModel) _then;

/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? licenseNo = null,Object? vehicleNumber = null,Object? vehicleType = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(DriverModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,licenseNo: null == licenseNo ? _self.licenseNo : licenseNo // ignore: cast_nullable_to_non_nullable
as String,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverModel].
extension DriverModelPatterns on DriverModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String companyId,  String name,  String phone,  String? email,  String licenseNo,  String vehicleNumber,  String vehicleType,  String status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
return $default(_that.id,_that.companyId,_that.name,_that.phone,_that.email,_that.licenseNo,_that.vehicleNumber,_that.vehicleType,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String companyId,  String name,  String phone,  String? email,  String licenseNo,  String vehicleNumber,  String vehicleType,  String status,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DriverModel():
return $default(_that.id,_that.companyId,_that.name,_that.phone,_that.email,_that.licenseNo,_that.vehicleNumber,_that.vehicleType,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String companyId,  String name,  String phone,  String? email,  String licenseNo,  String vehicleNumber,  String vehicleType,  String status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DriverModel() when $default != null:
return $default(_that.id,_that.companyId,_that.name,_that.phone,_that.email,_that.licenseNo,_that.vehicleNumber,_that.vehicleType,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverModel implements DriverModel {
  const _DriverModel({required this.id, required this.companyId, required this.name, required this.phone, this.email, required this.licenseNo, required this.vehicleNumber, required this.vehicleType, required this.status, this.createdAt, this.updatedAt});
  factory _DriverModel.fromJson(Map<String, dynamic> json) => _$DriverModelFromJson(json);

@override final  String id;
@override final  String companyId;
@override final  String name;
@override final  String phone;
@override final  String? email;
@override final  String licenseNo;
@override final  String vehicleNumber;
@override final  String vehicleType;
@override final  String status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverModelCopyWith<_DriverModel> get copyWith => __$DriverModelCopyWithImpl<_DriverModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.licenseNo, licenseNo) || other.licenseNo == licenseNo)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,companyId,name,phone,email,licenseNo,vehicleNumber,vehicleType,status,createdAt,updatedAt);
}

@override
String toString() {
    return 'DriverModel(id: $id, companyId: $companyId, name: $name, phone: $phone, email: $email, licenseNo: $licenseNo, vehicleNumber: $vehicleNumber, vehicleType: $vehicleType, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DriverModelCopyWith<$Res> implements $DriverModelCopyWith<$Res> {
  factory _$DriverModelCopyWith(_DriverModel value, $Res Function(_DriverModel) _then) = __$DriverModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String companyId, String name, String phone, String? email, String licenseNo, String vehicleNumber, String vehicleType, String status, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$DriverModelCopyWithImpl<$Res>
    implements _$DriverModelCopyWith<$Res> {
  __$DriverModelCopyWithImpl(this._self, this._then);

  final _DriverModel _self;
  final $Res Function(_DriverModel) _then;

/// Create a copy of DriverModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? licenseNo = null,Object? vehicleNumber = null,Object? vehicleType = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DriverModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,licenseNo: null == licenseNo ? _self.licenseNo : licenseNo // ignore: cast_nullable_to_non_nullable
as String,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
