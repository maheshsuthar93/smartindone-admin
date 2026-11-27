// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_package_hardware_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailablePackageHardwareModel {

 String get id; String get code; String get name; String get type; String get unit; int get availableStock; String? get brand; String? get finish; String? get specification;
/// Create a copy of AvailablePackageHardwareModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailablePackageHardwareModelCopyWith<AvailablePackageHardwareModel> get copyWith => _$AvailablePackageHardwareModelCopyWithImpl<AvailablePackageHardwareModel>(this as AvailablePackageHardwareModel, _$identity);

  /// Serializes this AvailablePackageHardwareModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AvailablePackageHardwareModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailablePackageHardwareModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.availableStock, _this.availableStock) || other.availableStock == _this.availableStock)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.finish, _this.finish) || other.finish == _this.finish)&&(identical(other.specification, _this.specification) || other.specification == _this.specification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AvailablePackageHardwareModel;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.type,_this.unit,_this.availableStock,_this.brand,_this.finish,_this.specification);
}

@override
String toString() {
  final _this = this as AvailablePackageHardwareModel;
  return 'AvailablePackageHardwareModel(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, type: ${_this.type}, unit: ${_this.unit}, availableStock: ${_this.availableStock}, brand: ${_this.brand}, finish: ${_this.finish}, specification: ${_this.specification})';
}


}

/// @nodoc
abstract mixin class $AvailablePackageHardwareModelCopyWith<$Res>  {
  factory $AvailablePackageHardwareModelCopyWith(AvailablePackageHardwareModel value, $Res Function(AvailablePackageHardwareModel) _then) = _$AvailablePackageHardwareModelCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, String type, String unit, int availableStock, String? brand, String? finish, String? specification
});




}
/// @nodoc
class _$AvailablePackageHardwareModelCopyWithImpl<$Res>
    implements $AvailablePackageHardwareModelCopyWith<$Res> {
  _$AvailablePackageHardwareModelCopyWithImpl(this._self, this._then);

  final AvailablePackageHardwareModel _self;
  final $Res Function(AvailablePackageHardwareModel) _then;

/// Create a copy of AvailablePackageHardwareModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? type = null,Object? unit = null,Object? availableStock = null,Object? brand = freezed,Object? finish = freezed,Object? specification = freezed,}) {
  return _then(AvailablePackageHardwareModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,availableStock: null == availableStock ? _self.availableStock : availableStock // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,finish: freezed == finish ? _self.finish : finish // ignore: cast_nullable_to_non_nullable
as String?,specification: freezed == specification ? _self.specification : specification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailablePackageHardwareModel].
extension AvailablePackageHardwareModelPatterns on AvailablePackageHardwareModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailablePackageHardwareModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailablePackageHardwareModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailablePackageHardwareModel value)  $default,){
final _that = this;
switch (_that) {
case _AvailablePackageHardwareModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailablePackageHardwareModel value)?  $default,){
final _that = this;
switch (_that) {
case _AvailablePackageHardwareModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String type,  String unit,  int availableStock,  String? brand,  String? finish,  String? specification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailablePackageHardwareModel() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.type,_that.unit,_that.availableStock,_that.brand,_that.finish,_that.specification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  String type,  String unit,  int availableStock,  String? brand,  String? finish,  String? specification)  $default,) {final _that = this;
switch (_that) {
case _AvailablePackageHardwareModel():
return $default(_that.id,_that.code,_that.name,_that.type,_that.unit,_that.availableStock,_that.brand,_that.finish,_that.specification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  String type,  String unit,  int availableStock,  String? brand,  String? finish,  String? specification)?  $default,) {final _that = this;
switch (_that) {
case _AvailablePackageHardwareModel() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.type,_that.unit,_that.availableStock,_that.brand,_that.finish,_that.specification);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailablePackageHardwareModel implements AvailablePackageHardwareModel {
  const _AvailablePackageHardwareModel({required this.id, required this.code, required this.name, required this.type, required this.unit, this.availableStock = 0, this.brand, this.finish, this.specification});
  factory _AvailablePackageHardwareModel.fromJson(Map<String, dynamic> json) => _$AvailablePackageHardwareModelFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override final  String type;
@override final  String unit;
@override@JsonKey() final  int availableStock;
@override final  String? brand;
@override final  String? finish;
@override final  String? specification;

/// Create a copy of AvailablePackageHardwareModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailablePackageHardwareModelCopyWith<_AvailablePackageHardwareModel> get copyWith => __$AvailablePackageHardwareModelCopyWithImpl<_AvailablePackageHardwareModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailablePackageHardwareModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailablePackageHardwareModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.availableStock, availableStock) || other.availableStock == availableStock)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.finish, finish) || other.finish == finish)&&(identical(other.specification, specification) || other.specification == specification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,type,unit,availableStock,brand,finish,specification);
}

@override
String toString() {
    return 'AvailablePackageHardwareModel(id: $id, code: $code, name: $name, type: $type, unit: $unit, availableStock: $availableStock, brand: $brand, finish: $finish, specification: $specification)';
}


}

/// @nodoc
abstract mixin class _$AvailablePackageHardwareModelCopyWith<$Res> implements $AvailablePackageHardwareModelCopyWith<$Res> {
  factory _$AvailablePackageHardwareModelCopyWith(_AvailablePackageHardwareModel value, $Res Function(_AvailablePackageHardwareModel) _then) = __$AvailablePackageHardwareModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, String type, String unit, int availableStock, String? brand, String? finish, String? specification
});




}
/// @nodoc
class __$AvailablePackageHardwareModelCopyWithImpl<$Res>
    implements _$AvailablePackageHardwareModelCopyWith<$Res> {
  __$AvailablePackageHardwareModelCopyWithImpl(this._self, this._then);

  final _AvailablePackageHardwareModel _self;
  final $Res Function(_AvailablePackageHardwareModel) _then;

/// Create a copy of AvailablePackageHardwareModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? type = null,Object? unit = null,Object? availableStock = null,Object? brand = freezed,Object? finish = freezed,Object? specification = freezed,}) {
  return _then(_AvailablePackageHardwareModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,availableStock: null == availableStock ? _self.availableStock : availableStock // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,finish: freezed == finish ? _self.finish : finish // ignore: cast_nullable_to_non_nullable
as String?,specification: freezed == specification ? _self.specification : specification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
