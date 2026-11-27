// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShipmentPackageModel {

 String get id; int get pieceNumber; String get pieceCode; String? get status; int? get itemsCount; int? get hardwareCount; num? get weight; num? get length; num? get width; num? get height;
/// Create a copy of ShipmentPackageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentPackageModelCopyWith<ShipmentPackageModel> get copyWith => _$ShipmentPackageModelCopyWithImpl<ShipmentPackageModel>(this as ShipmentPackageModel, _$identity);

  /// Serializes this ShipmentPackageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShipmentPackageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShipmentPackageModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pieceNumber, _this.pieceNumber) || other.pieceNumber == _this.pieceNumber)&&(identical(other.pieceCode, _this.pieceCode) || other.pieceCode == _this.pieceCode)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.itemsCount, _this.itemsCount) || other.itemsCount == _this.itemsCount)&&(identical(other.hardwareCount, _this.hardwareCount) || other.hardwareCount == _this.hardwareCount)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.length, _this.length) || other.length == _this.length)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShipmentPackageModel;
  return Object.hash(runtimeType,_this.id,_this.pieceNumber,_this.pieceCode,_this.status,_this.itemsCount,_this.hardwareCount,_this.weight,_this.length,_this.width,_this.height);
}

@override
String toString() {
  final _this = this as ShipmentPackageModel;
  return 'ShipmentPackageModel(id: ${_this.id}, pieceNumber: ${_this.pieceNumber}, pieceCode: ${_this.pieceCode}, status: ${_this.status}, itemsCount: ${_this.itemsCount}, hardwareCount: ${_this.hardwareCount}, weight: ${_this.weight}, length: ${_this.length}, width: ${_this.width}, height: ${_this.height})';
}


}

/// @nodoc
abstract mixin class $ShipmentPackageModelCopyWith<$Res>  {
  factory $ShipmentPackageModelCopyWith(ShipmentPackageModel value, $Res Function(ShipmentPackageModel) _then) = _$ShipmentPackageModelCopyWithImpl;
@useResult
$Res call({
 String id, int pieceNumber, String pieceCode, String? status, int? itemsCount, int? hardwareCount, num? weight, num? length, num? width, num? height
});




}
/// @nodoc
class _$ShipmentPackageModelCopyWithImpl<$Res>
    implements $ShipmentPackageModelCopyWith<$Res> {
  _$ShipmentPackageModelCopyWithImpl(this._self, this._then);

  final ShipmentPackageModel _self;
  final $Res Function(ShipmentPackageModel) _then;

/// Create a copy of ShipmentPackageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pieceNumber = null,Object? pieceCode = null,Object? status = freezed,Object? itemsCount = freezed,Object? hardwareCount = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(ShipmentPackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceNumber: null == pieceNumber ? _self.pieceNumber : pieceNumber // ignore: cast_nullable_to_non_nullable
as int,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,itemsCount: freezed == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int?,hardwareCount: freezed == hardwareCount ? _self.hardwareCount : hardwareCount // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as num?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as num?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as num?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShipmentPackageModel].
extension ShipmentPackageModelPatterns on ShipmentPackageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShipmentPackageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShipmentPackageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShipmentPackageModel value)  $default,){
final _that = this;
switch (_that) {
case _ShipmentPackageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShipmentPackageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShipmentPackageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int pieceNumber,  String pieceCode,  String? status,  int? itemsCount,  int? hardwareCount,  num? weight,  num? length,  num? width,  num? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShipmentPackageModel() when $default != null:
return $default(_that.id,_that.pieceNumber,_that.pieceCode,_that.status,_that.itemsCount,_that.hardwareCount,_that.weight,_that.length,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int pieceNumber,  String pieceCode,  String? status,  int? itemsCount,  int? hardwareCount,  num? weight,  num? length,  num? width,  num? height)  $default,) {final _that = this;
switch (_that) {
case _ShipmentPackageModel():
return $default(_that.id,_that.pieceNumber,_that.pieceCode,_that.status,_that.itemsCount,_that.hardwareCount,_that.weight,_that.length,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int pieceNumber,  String pieceCode,  String? status,  int? itemsCount,  int? hardwareCount,  num? weight,  num? length,  num? width,  num? height)?  $default,) {final _that = this;
switch (_that) {
case _ShipmentPackageModel() when $default != null:
return $default(_that.id,_that.pieceNumber,_that.pieceCode,_that.status,_that.itemsCount,_that.hardwareCount,_that.weight,_that.length,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShipmentPackageModel implements ShipmentPackageModel {
  const _ShipmentPackageModel({required this.id, this.pieceNumber = 0, this.pieceCode = '', this.status, this.itemsCount, this.hardwareCount, this.weight, this.length, this.width, this.height});
  factory _ShipmentPackageModel.fromJson(Map<String, dynamic> json) => _$ShipmentPackageModelFromJson(json);

@override final  String id;
@override@JsonKey() final  int pieceNumber;
@override@JsonKey() final  String pieceCode;
@override final  String? status;
@override final  int? itemsCount;
@override final  int? hardwareCount;
@override final  num? weight;
@override final  num? length;
@override final  num? width;
@override final  num? height;

/// Create a copy of ShipmentPackageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentPackageModelCopyWith<_ShipmentPackageModel> get copyWith => __$ShipmentPackageModelCopyWithImpl<_ShipmentPackageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShipmentPackageModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShipmentPackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.pieceNumber, pieceNumber) || other.pieceNumber == pieceNumber)&&(identical(other.pieceCode, pieceCode) || other.pieceCode == pieceCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.hardwareCount, hardwareCount) || other.hardwareCount == hardwareCount)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,pieceNumber,pieceCode,status,itemsCount,hardwareCount,weight,length,width,height);
}

@override
String toString() {
    return 'ShipmentPackageModel(id: $id, pieceNumber: $pieceNumber, pieceCode: $pieceCode, status: $status, itemsCount: $itemsCount, hardwareCount: $hardwareCount, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$ShipmentPackageModelCopyWith<$Res> implements $ShipmentPackageModelCopyWith<$Res> {
  factory _$ShipmentPackageModelCopyWith(_ShipmentPackageModel value, $Res Function(_ShipmentPackageModel) _then) = __$ShipmentPackageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int pieceNumber, String pieceCode, String? status, int? itemsCount, int? hardwareCount, num? weight, num? length, num? width, num? height
});




}
/// @nodoc
class __$ShipmentPackageModelCopyWithImpl<$Res>
    implements _$ShipmentPackageModelCopyWith<$Res> {
  __$ShipmentPackageModelCopyWithImpl(this._self, this._then);

  final _ShipmentPackageModel _self;
  final $Res Function(_ShipmentPackageModel) _then;

/// Create a copy of ShipmentPackageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pieceNumber = null,Object? pieceCode = null,Object? status = freezed,Object? itemsCount = freezed,Object? hardwareCount = freezed,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_ShipmentPackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceNumber: null == pieceNumber ? _self.pieceNumber : pieceNumber // ignore: cast_nullable_to_non_nullable
as int,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,itemsCount: freezed == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int?,hardwareCount: freezed == hardwareCount ? _self.hardwareCount : hardwareCount // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as num?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as num?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as num?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}

// dart format on
