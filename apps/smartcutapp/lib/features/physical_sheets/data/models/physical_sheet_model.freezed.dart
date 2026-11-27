// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'physical_sheet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhysicalSheetModel {

 String get id; String get sheetCode; String get companyId; String get materialId; String get warehouseId; double get width; double get height; String get type; String get status; String get grainDirection; String? get parentId; DateTime? get createdAt; DateTime? get updatedAt; PhysicalSheetMaterialModel get material; WarehouseModel get warehouse;
/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhysicalSheetModelCopyWith<PhysicalSheetModel> get copyWith => _$PhysicalSheetModelCopyWithImpl<PhysicalSheetModel>(this as PhysicalSheetModel, _$identity);

  /// Serializes this PhysicalSheetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhysicalSheetModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhysicalSheetModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sheetCode, _this.sheetCode) || other.sheetCode == _this.sheetCode)&&(identical(other.companyId, _this.companyId) || other.companyId == _this.companyId)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.warehouseId, _this.warehouseId) || other.warehouseId == _this.warehouseId)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.grainDirection, _this.grainDirection) || other.grainDirection == _this.grainDirection)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.warehouse, _this.warehouse) || other.warehouse == _this.warehouse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhysicalSheetModel;
  return Object.hash(runtimeType,_this.id,_this.sheetCode,_this.companyId,_this.materialId,_this.warehouseId,_this.width,_this.height,_this.type,_this.status,_this.grainDirection,_this.parentId,_this.createdAt,_this.updatedAt,_this.material,_this.warehouse);
}

@override
String toString() {
  final _this = this as PhysicalSheetModel;
  return 'PhysicalSheetModel(id: ${_this.id}, sheetCode: ${_this.sheetCode}, companyId: ${_this.companyId}, materialId: ${_this.materialId}, warehouseId: ${_this.warehouseId}, width: ${_this.width}, height: ${_this.height}, type: ${_this.type}, status: ${_this.status}, grainDirection: ${_this.grainDirection}, parentId: ${_this.parentId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, material: ${_this.material}, warehouse: ${_this.warehouse})';
}


}

/// @nodoc
abstract mixin class $PhysicalSheetModelCopyWith<$Res>  {
  factory $PhysicalSheetModelCopyWith(PhysicalSheetModel value, $Res Function(PhysicalSheetModel) _then) = _$PhysicalSheetModelCopyWithImpl;
@useResult
$Res call({
 String id, String sheetCode, String companyId, String materialId, String warehouseId, double width, double height, String type, String status, String grainDirection, String? parentId, DateTime? createdAt, DateTime? updatedAt, PhysicalSheetMaterialModel material, WarehouseModel warehouse
});


$PhysicalSheetMaterialModelCopyWith<$Res> get material;$WarehouseModelCopyWith<$Res> get warehouse;

}
/// @nodoc
class _$PhysicalSheetModelCopyWithImpl<$Res>
    implements $PhysicalSheetModelCopyWith<$Res> {
  _$PhysicalSheetModelCopyWithImpl(this._self, this._then);

  final PhysicalSheetModel _self;
  final $Res Function(PhysicalSheetModel) _then;

/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sheetCode = null,Object? companyId = null,Object? materialId = null,Object? warehouseId = null,Object? width = null,Object? height = null,Object? type = null,Object? status = null,Object? grainDirection = null,Object? parentId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? material = null,Object? warehouse = null,}) {
  return _then(PhysicalSheetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sheetCode: null == sheetCode ? _self.sheetCode : sheetCode // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as PhysicalSheetMaterialModel,warehouse: null == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as WarehouseModel,
  ));
}
/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhysicalSheetMaterialModelCopyWith<$Res> get material {
  
  return $PhysicalSheetMaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarehouseModelCopyWith<$Res> get warehouse {
  
  return $WarehouseModelCopyWith<$Res>(_self.warehouse, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhysicalSheetModel].
extension PhysicalSheetModelPatterns on PhysicalSheetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhysicalSheetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhysicalSheetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhysicalSheetModel value)  $default,){
final _that = this;
switch (_that) {
case _PhysicalSheetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhysicalSheetModel value)?  $default,){
final _that = this;
switch (_that) {
case _PhysicalSheetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sheetCode,  String companyId,  String materialId,  String warehouseId,  double width,  double height,  String type,  String status,  String grainDirection,  String? parentId,  DateTime? createdAt,  DateTime? updatedAt,  PhysicalSheetMaterialModel material,  WarehouseModel warehouse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhysicalSheetModel() when $default != null:
return $default(_that.id,_that.sheetCode,_that.companyId,_that.materialId,_that.warehouseId,_that.width,_that.height,_that.type,_that.status,_that.grainDirection,_that.parentId,_that.createdAt,_that.updatedAt,_that.material,_that.warehouse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sheetCode,  String companyId,  String materialId,  String warehouseId,  double width,  double height,  String type,  String status,  String grainDirection,  String? parentId,  DateTime? createdAt,  DateTime? updatedAt,  PhysicalSheetMaterialModel material,  WarehouseModel warehouse)  $default,) {final _that = this;
switch (_that) {
case _PhysicalSheetModel():
return $default(_that.id,_that.sheetCode,_that.companyId,_that.materialId,_that.warehouseId,_that.width,_that.height,_that.type,_that.status,_that.grainDirection,_that.parentId,_that.createdAt,_that.updatedAt,_that.material,_that.warehouse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sheetCode,  String companyId,  String materialId,  String warehouseId,  double width,  double height,  String type,  String status,  String grainDirection,  String? parentId,  DateTime? createdAt,  DateTime? updatedAt,  PhysicalSheetMaterialModel material,  WarehouseModel warehouse)?  $default,) {final _that = this;
switch (_that) {
case _PhysicalSheetModel() when $default != null:
return $default(_that.id,_that.sheetCode,_that.companyId,_that.materialId,_that.warehouseId,_that.width,_that.height,_that.type,_that.status,_that.grainDirection,_that.parentId,_that.createdAt,_that.updatedAt,_that.material,_that.warehouse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhysicalSheetModel implements PhysicalSheetModel {
  const _PhysicalSheetModel({required this.id, required this.sheetCode, required this.companyId, required this.materialId, required this.warehouseId, required this.width, required this.height, required this.type, required this.status, required this.grainDirection, this.parentId, this.createdAt, this.updatedAt, required this.material, required this.warehouse});
  factory _PhysicalSheetModel.fromJson(Map<String, dynamic> json) => _$PhysicalSheetModelFromJson(json);

@override final  String id;
@override final  String sheetCode;
@override final  String companyId;
@override final  String materialId;
@override final  String warehouseId;
@override final  double width;
@override final  double height;
@override final  String type;
@override final  String status;
@override final  String grainDirection;
@override final  String? parentId;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  PhysicalSheetMaterialModel material;
@override final  WarehouseModel warehouse;

/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhysicalSheetModelCopyWith<_PhysicalSheetModel> get copyWith => __$PhysicalSheetModelCopyWithImpl<_PhysicalSheetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhysicalSheetModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhysicalSheetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sheetCode, sheetCode) || other.sheetCode == sheetCode)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.grainDirection, grainDirection) || other.grainDirection == grainDirection)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.material, material) || other.material == material)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,sheetCode,companyId,materialId,warehouseId,width,height,type,status,grainDirection,parentId,createdAt,updatedAt,material,warehouse);
}

@override
String toString() {
    return 'PhysicalSheetModel(id: $id, sheetCode: $sheetCode, companyId: $companyId, materialId: $materialId, warehouseId: $warehouseId, width: $width, height: $height, type: $type, status: $status, grainDirection: $grainDirection, parentId: $parentId, createdAt: $createdAt, updatedAt: $updatedAt, material: $material, warehouse: $warehouse)';
}


}

/// @nodoc
abstract mixin class _$PhysicalSheetModelCopyWith<$Res> implements $PhysicalSheetModelCopyWith<$Res> {
  factory _$PhysicalSheetModelCopyWith(_PhysicalSheetModel value, $Res Function(_PhysicalSheetModel) _then) = __$PhysicalSheetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String sheetCode, String companyId, String materialId, String warehouseId, double width, double height, String type, String status, String grainDirection, String? parentId, DateTime? createdAt, DateTime? updatedAt, PhysicalSheetMaterialModel material, WarehouseModel warehouse
});


@override $PhysicalSheetMaterialModelCopyWith<$Res> get material;@override $WarehouseModelCopyWith<$Res> get warehouse;

}
/// @nodoc
class __$PhysicalSheetModelCopyWithImpl<$Res>
    implements _$PhysicalSheetModelCopyWith<$Res> {
  __$PhysicalSheetModelCopyWithImpl(this._self, this._then);

  final _PhysicalSheetModel _self;
  final $Res Function(_PhysicalSheetModel) _then;

/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sheetCode = null,Object? companyId = null,Object? materialId = null,Object? warehouseId = null,Object? width = null,Object? height = null,Object? type = null,Object? status = null,Object? grainDirection = null,Object? parentId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? material = null,Object? warehouse = null,}) {
  return _then(_PhysicalSheetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sheetCode: null == sheetCode ? _self.sheetCode : sheetCode // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as PhysicalSheetMaterialModel,warehouse: null == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as WarehouseModel,
  ));
}

/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhysicalSheetMaterialModelCopyWith<$Res> get material {
  
  return $PhysicalSheetMaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}/// Create a copy of PhysicalSheetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarehouseModelCopyWith<$Res> get warehouse {
  
  return $WarehouseModelCopyWith<$Res>(_self.warehouse, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}
}


/// @nodoc
mixin _$PhysicalSheetMaterialModel {

 String get id; String get name; String? get code;
/// Create a copy of PhysicalSheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhysicalSheetMaterialModelCopyWith<PhysicalSheetMaterialModel> get copyWith => _$PhysicalSheetMaterialModelCopyWithImpl<PhysicalSheetMaterialModel>(this as PhysicalSheetMaterialModel, _$identity);

  /// Serializes this PhysicalSheetMaterialModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhysicalSheetMaterialModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhysicalSheetMaterialModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhysicalSheetMaterialModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code);
}

@override
String toString() {
  final _this = this as PhysicalSheetMaterialModel;
  return 'PhysicalSheetMaterialModel(id: ${_this.id}, name: ${_this.name}, code: ${_this.code})';
}


}

/// @nodoc
abstract mixin class $PhysicalSheetMaterialModelCopyWith<$Res>  {
  factory $PhysicalSheetMaterialModelCopyWith(PhysicalSheetMaterialModel value, $Res Function(PhysicalSheetMaterialModel) _then) = _$PhysicalSheetMaterialModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? code
});




}
/// @nodoc
class _$PhysicalSheetMaterialModelCopyWithImpl<$Res>
    implements $PhysicalSheetMaterialModelCopyWith<$Res> {
  _$PhysicalSheetMaterialModelCopyWithImpl(this._self, this._then);

  final PhysicalSheetMaterialModel _self;
  final $Res Function(PhysicalSheetMaterialModel) _then;

/// Create a copy of PhysicalSheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(PhysicalSheetMaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhysicalSheetMaterialModel].
extension PhysicalSheetMaterialModelPatterns on PhysicalSheetMaterialModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhysicalSheetMaterialModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhysicalSheetMaterialModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhysicalSheetMaterialModel value)  $default,){
final _that = this;
switch (_that) {
case _PhysicalSheetMaterialModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhysicalSheetMaterialModel value)?  $default,){
final _that = this;
switch (_that) {
case _PhysicalSheetMaterialModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhysicalSheetMaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? code)  $default,) {final _that = this;
switch (_that) {
case _PhysicalSheetMaterialModel():
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? code)?  $default,) {final _that = this;
switch (_that) {
case _PhysicalSheetMaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhysicalSheetMaterialModel implements PhysicalSheetMaterialModel {
  const _PhysicalSheetMaterialModel({required this.id, required this.name, this.code});
  factory _PhysicalSheetMaterialModel.fromJson(Map<String, dynamic> json) => _$PhysicalSheetMaterialModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? code;

/// Create a copy of PhysicalSheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhysicalSheetMaterialModelCopyWith<_PhysicalSheetMaterialModel> get copyWith => __$PhysicalSheetMaterialModelCopyWithImpl<_PhysicalSheetMaterialModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhysicalSheetMaterialModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhysicalSheetMaterialModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code);
}

@override
String toString() {
    return 'PhysicalSheetMaterialModel(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$PhysicalSheetMaterialModelCopyWith<$Res> implements $PhysicalSheetMaterialModelCopyWith<$Res> {
  factory _$PhysicalSheetMaterialModelCopyWith(_PhysicalSheetMaterialModel value, $Res Function(_PhysicalSheetMaterialModel) _then) = __$PhysicalSheetMaterialModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? code
});




}
/// @nodoc
class __$PhysicalSheetMaterialModelCopyWithImpl<$Res>
    implements _$PhysicalSheetMaterialModelCopyWith<$Res> {
  __$PhysicalSheetMaterialModelCopyWithImpl(this._self, this._then);

  final _PhysicalSheetMaterialModel _self;
  final $Res Function(_PhysicalSheetMaterialModel) _then;

/// Create a copy of PhysicalSheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(_PhysicalSheetMaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
