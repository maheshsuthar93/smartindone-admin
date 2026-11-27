// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_driver_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShipmentDriverModel {

 String get id; String get name; String get phone; String get vehicleNumber; String get licenseNo; String get vehicleType;
/// Create a copy of ShipmentDriverModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentDriverModelCopyWith<ShipmentDriverModel> get copyWith => _$ShipmentDriverModelCopyWithImpl<ShipmentDriverModel>(this as ShipmentDriverModel, _$identity);

  /// Serializes this ShipmentDriverModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShipmentDriverModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShipmentDriverModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.vehicleNumber, _this.vehicleNumber) || other.vehicleNumber == _this.vehicleNumber)&&(identical(other.licenseNo, _this.licenseNo) || other.licenseNo == _this.licenseNo)&&(identical(other.vehicleType, _this.vehicleType) || other.vehicleType == _this.vehicleType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShipmentDriverModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.vehicleNumber,_this.licenseNo,_this.vehicleType);
}

@override
String toString() {
  final _this = this as ShipmentDriverModel;
  return 'ShipmentDriverModel(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, vehicleNumber: ${_this.vehicleNumber}, licenseNo: ${_this.licenseNo}, vehicleType: ${_this.vehicleType})';
}


}

/// @nodoc
abstract mixin class $ShipmentDriverModelCopyWith<$Res>  {
  factory $ShipmentDriverModelCopyWith(ShipmentDriverModel value, $Res Function(ShipmentDriverModel) _then) = _$ShipmentDriverModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone, String vehicleNumber, String licenseNo, String vehicleType
});




}
/// @nodoc
class _$ShipmentDriverModelCopyWithImpl<$Res>
    implements $ShipmentDriverModelCopyWith<$Res> {
  _$ShipmentDriverModelCopyWithImpl(this._self, this._then);

  final ShipmentDriverModel _self;
  final $Res Function(ShipmentDriverModel) _then;

/// Create a copy of ShipmentDriverModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? vehicleNumber = null,Object? licenseNo = null,Object? vehicleType = null,}) {
  return _then(ShipmentDriverModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,licenseNo: null == licenseNo ? _self.licenseNo : licenseNo // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShipmentDriverModel].
extension ShipmentDriverModelPatterns on ShipmentDriverModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShipmentDriverModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShipmentDriverModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShipmentDriverModel value)  $default,){
final _that = this;
switch (_that) {
case _ShipmentDriverModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShipmentDriverModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShipmentDriverModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String vehicleNumber,  String licenseNo,  String vehicleType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShipmentDriverModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.vehicleNumber,_that.licenseNo,_that.vehicleType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String vehicleNumber,  String licenseNo,  String vehicleType)  $default,) {final _that = this;
switch (_that) {
case _ShipmentDriverModel():
return $default(_that.id,_that.name,_that.phone,_that.vehicleNumber,_that.licenseNo,_that.vehicleType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone,  String vehicleNumber,  String licenseNo,  String vehicleType)?  $default,) {final _that = this;
switch (_that) {
case _ShipmentDriverModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.vehicleNumber,_that.licenseNo,_that.vehicleType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShipmentDriverModel implements ShipmentDriverModel {
  const _ShipmentDriverModel({required this.id, required this.name, required this.phone, required this.vehicleNumber, required this.licenseNo, required this.vehicleType});
  factory _ShipmentDriverModel.fromJson(Map<String, dynamic> json) => _$ShipmentDriverModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String phone;
@override final  String vehicleNumber;
@override final  String licenseNo;
@override final  String vehicleType;

/// Create a copy of ShipmentDriverModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentDriverModelCopyWith<_ShipmentDriverModel> get copyWith => __$ShipmentDriverModelCopyWithImpl<_ShipmentDriverModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShipmentDriverModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShipmentDriverModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.vehicleNumber, vehicleNumber) || other.vehicleNumber == vehicleNumber)&&(identical(other.licenseNo, licenseNo) || other.licenseNo == licenseNo)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,vehicleNumber,licenseNo,vehicleType);
}

@override
String toString() {
    return 'ShipmentDriverModel(id: $id, name: $name, phone: $phone, vehicleNumber: $vehicleNumber, licenseNo: $licenseNo, vehicleType: $vehicleType)';
}


}

/// @nodoc
abstract mixin class _$ShipmentDriverModelCopyWith<$Res> implements $ShipmentDriverModelCopyWith<$Res> {
  factory _$ShipmentDriverModelCopyWith(_ShipmentDriverModel value, $Res Function(_ShipmentDriverModel) _then) = __$ShipmentDriverModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone, String vehicleNumber, String licenseNo, String vehicleType
});




}
/// @nodoc
class __$ShipmentDriverModelCopyWithImpl<$Res>
    implements _$ShipmentDriverModelCopyWith<$Res> {
  __$ShipmentDriverModelCopyWithImpl(this._self, this._then);

  final _ShipmentDriverModel _self;
  final $Res Function(_ShipmentDriverModel) _then;

/// Create a copy of ShipmentDriverModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? vehicleNumber = null,Object? licenseNo = null,Object? vehicleType = null,}) {
  return _then(_ShipmentDriverModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleNumber: null == vehicleNumber ? _self.vehicleNumber : vehicleNumber // ignore: cast_nullable_to_non_nullable
as String,licenseNo: null == licenseNo ? _self.licenseNo : licenseNo // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
