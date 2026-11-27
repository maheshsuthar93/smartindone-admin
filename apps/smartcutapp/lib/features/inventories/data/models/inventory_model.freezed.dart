// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryModel {

 String get id; String? get materialId; String? get hardwareId; int get available; int get onHand; int get reserved; WarehouseModel get warehouse; InventoryMaterialModel? get material; InventoryHardwareModel? get hardware; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryModelCopyWith<InventoryModel> get copyWith => _$InventoryModelCopyWithImpl<InventoryModel>(this as InventoryModel, _$identity);

  /// Serializes this InventoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InventoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.hardwareId, _this.hardwareId) || other.hardwareId == _this.hardwareId)&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.onHand, _this.onHand) || other.onHand == _this.onHand)&&(identical(other.reserved, _this.reserved) || other.reserved == _this.reserved)&&(identical(other.warehouse, _this.warehouse) || other.warehouse == _this.warehouse)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.hardware, _this.hardware) || other.hardware == _this.hardware)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InventoryModel;
  return Object.hash(runtimeType,_this.id,_this.materialId,_this.hardwareId,_this.available,_this.onHand,_this.reserved,_this.warehouse,_this.material,_this.hardware,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as InventoryModel;
  return 'InventoryModel(id: ${_this.id}, materialId: ${_this.materialId}, hardwareId: ${_this.hardwareId}, available: ${_this.available}, onHand: ${_this.onHand}, reserved: ${_this.reserved}, warehouse: ${_this.warehouse}, material: ${_this.material}, hardware: ${_this.hardware}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $InventoryModelCopyWith<$Res>  {
  factory $InventoryModelCopyWith(InventoryModel value, $Res Function(InventoryModel) _then) = _$InventoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String? materialId, String? hardwareId, int available, int onHand, int reserved, WarehouseModel warehouse, InventoryMaterialModel? material, InventoryHardwareModel? hardware, DateTime? createdAt, DateTime? updatedAt
});


$WarehouseModelCopyWith<$Res> get warehouse;$InventoryMaterialModelCopyWith<$Res>? get material;$InventoryHardwareModelCopyWith<$Res>? get hardware;

}
/// @nodoc
class _$InventoryModelCopyWithImpl<$Res>
    implements $InventoryModelCopyWith<$Res> {
  _$InventoryModelCopyWithImpl(this._self, this._then);

  final InventoryModel _self;
  final $Res Function(InventoryModel) _then;

/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? materialId = freezed,Object? hardwareId = freezed,Object? available = null,Object? onHand = null,Object? reserved = null,Object? warehouse = null,Object? material = freezed,Object? hardware = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(InventoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,hardwareId: freezed == hardwareId ? _self.hardwareId : hardwareId // ignore: cast_nullable_to_non_nullable
as String?,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,onHand: null == onHand ? _self.onHand : onHand // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,warehouse: null == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as WarehouseModel,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as InventoryMaterialModel?,hardware: freezed == hardware ? _self.hardware : hardware // ignore: cast_nullable_to_non_nullable
as InventoryHardwareModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarehouseModelCopyWith<$Res> get warehouse {
  
  return $WarehouseModelCopyWith<$Res>(_self.warehouse, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InventoryMaterialModelCopyWith<$Res>? get material {
    if (_self.material == null) {
    return null;
  }

  return $InventoryMaterialModelCopyWith<$Res>(_self.material!, (value) {
    return _then(_self.copyWith(material: value));
  });
}/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InventoryHardwareModelCopyWith<$Res>? get hardware {
    if (_self.hardware == null) {
    return null;
  }

  return $InventoryHardwareModelCopyWith<$Res>(_self.hardware!, (value) {
    return _then(_self.copyWith(hardware: value));
  });
}
}


/// Adds pattern-matching-related methods to [InventoryModel].
extension InventoryModelPatterns on InventoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryModel value)  $default,){
final _that = this;
switch (_that) {
case _InventoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? materialId,  String? hardwareId,  int available,  int onHand,  int reserved,  WarehouseModel warehouse,  InventoryMaterialModel? material,  InventoryHardwareModel? hardware,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
return $default(_that.id,_that.materialId,_that.hardwareId,_that.available,_that.onHand,_that.reserved,_that.warehouse,_that.material,_that.hardware,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? materialId,  String? hardwareId,  int available,  int onHand,  int reserved,  WarehouseModel warehouse,  InventoryMaterialModel? material,  InventoryHardwareModel? hardware,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _InventoryModel():
return $default(_that.id,_that.materialId,_that.hardwareId,_that.available,_that.onHand,_that.reserved,_that.warehouse,_that.material,_that.hardware,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? materialId,  String? hardwareId,  int available,  int onHand,  int reserved,  WarehouseModel warehouse,  InventoryMaterialModel? material,  InventoryHardwareModel? hardware,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _InventoryModel() when $default != null:
return $default(_that.id,_that.materialId,_that.hardwareId,_that.available,_that.onHand,_that.reserved,_that.warehouse,_that.material,_that.hardware,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventoryModel implements InventoryModel {
  const _InventoryModel({required this.id, this.materialId, this.hardwareId, required this.available, required this.onHand, required this.reserved, required this.warehouse, this.material, this.hardware, this.createdAt, this.updatedAt});
  factory _InventoryModel.fromJson(Map<String, dynamic> json) => _$InventoryModelFromJson(json);

@override final  String id;
@override final  String? materialId;
@override final  String? hardwareId;
@override final  int available;
@override final  int onHand;
@override final  int reserved;
@override final  WarehouseModel warehouse;
@override final  InventoryMaterialModel? material;
@override final  InventoryHardwareModel? hardware;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryModelCopyWith<_InventoryModel> get copyWith => __$InventoryModelCopyWithImpl<_InventoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.hardwareId, hardwareId) || other.hardwareId == hardwareId)&&(identical(other.available, available) || other.available == available)&&(identical(other.onHand, onHand) || other.onHand == onHand)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse)&&(identical(other.material, material) || other.material == material)&&(identical(other.hardware, hardware) || other.hardware == hardware)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,materialId,hardwareId,available,onHand,reserved,warehouse,material,hardware,createdAt,updatedAt);
}

@override
String toString() {
    return 'InventoryModel(id: $id, materialId: $materialId, hardwareId: $hardwareId, available: $available, onHand: $onHand, reserved: $reserved, warehouse: $warehouse, material: $material, hardware: $hardware, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$InventoryModelCopyWith<$Res> implements $InventoryModelCopyWith<$Res> {
  factory _$InventoryModelCopyWith(_InventoryModel value, $Res Function(_InventoryModel) _then) = __$InventoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? materialId, String? hardwareId, int available, int onHand, int reserved, WarehouseModel warehouse, InventoryMaterialModel? material, InventoryHardwareModel? hardware, DateTime? createdAt, DateTime? updatedAt
});


@override $WarehouseModelCopyWith<$Res> get warehouse;@override $InventoryMaterialModelCopyWith<$Res>? get material;@override $InventoryHardwareModelCopyWith<$Res>? get hardware;

}
/// @nodoc
class __$InventoryModelCopyWithImpl<$Res>
    implements _$InventoryModelCopyWith<$Res> {
  __$InventoryModelCopyWithImpl(this._self, this._then);

  final _InventoryModel _self;
  final $Res Function(_InventoryModel) _then;

/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? materialId = freezed,Object? hardwareId = freezed,Object? available = null,Object? onHand = null,Object? reserved = null,Object? warehouse = null,Object? material = freezed,Object? hardware = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_InventoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,hardwareId: freezed == hardwareId ? _self.hardwareId : hardwareId // ignore: cast_nullable_to_non_nullable
as String?,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,onHand: null == onHand ? _self.onHand : onHand // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,warehouse: null == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as WarehouseModel,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as InventoryMaterialModel?,hardware: freezed == hardware ? _self.hardware : hardware // ignore: cast_nullable_to_non_nullable
as InventoryHardwareModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarehouseModelCopyWith<$Res> get warehouse {
  
  return $WarehouseModelCopyWith<$Res>(_self.warehouse, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InventoryMaterialModelCopyWith<$Res>? get material {
    if (_self.material == null) {
    return null;
  }

  return $InventoryMaterialModelCopyWith<$Res>(_self.material!, (value) {
    return _then(_self.copyWith(material: value));
  });
}/// Create a copy of InventoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InventoryHardwareModelCopyWith<$Res>? get hardware {
    if (_self.hardware == null) {
    return null;
  }

  return $InventoryHardwareModelCopyWith<$Res>(_self.hardware!, (value) {
    return _then(_self.copyWith(hardware: value));
  });
}
}


/// @nodoc
mixin _$WarehouseModel {

 String get id; String get name; FactoryModel get factory;
/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarehouseModelCopyWith<WarehouseModel> get copyWith => _$WarehouseModelCopyWithImpl<WarehouseModel>(this as WarehouseModel, _$identity);

  /// Serializes this WarehouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WarehouseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarehouseModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.factory, _this.factory) || other.factory == _this.factory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WarehouseModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.factory);
}

@override
String toString() {
  final _this = this as WarehouseModel;
  return 'WarehouseModel(id: ${_this.id}, name: ${_this.name}, factory: ${_this.factory})';
}


}

/// @nodoc
abstract mixin class $WarehouseModelCopyWith<$Res>  {
  factory $WarehouseModelCopyWith(WarehouseModel value, $Res Function(WarehouseModel) _then) = _$WarehouseModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, FactoryModel factory
});


$FactoryModelCopyWith<$Res> get factory;

}
/// @nodoc
class _$WarehouseModelCopyWithImpl<$Res>
    implements $WarehouseModelCopyWith<$Res> {
  _$WarehouseModelCopyWithImpl(this._self, this._then);

  final WarehouseModel _self;
  final $Res Function(WarehouseModel) _then;

/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? factory = null,}) {
  return _then(WarehouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,factory: null == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as FactoryModel,
  ));
}
/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FactoryModelCopyWith<$Res> get factory {
  
  return $FactoryModelCopyWith<$Res>(_self.factory, (value) {
    return _then(_self.copyWith(factory: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarehouseModel].
extension WarehouseModelPatterns on WarehouseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarehouseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarehouseModel value)  $default,){
final _that = this;
switch (_that) {
case _WarehouseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarehouseModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  FactoryModel factory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
return $default(_that.id,_that.name,_that.factory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  FactoryModel factory)  $default,) {final _that = this;
switch (_that) {
case _WarehouseModel():
return $default(_that.id,_that.name,_that.factory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  FactoryModel factory)?  $default,) {final _that = this;
switch (_that) {
case _WarehouseModel() when $default != null:
return $default(_that.id,_that.name,_that.factory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarehouseModel implements WarehouseModel {
  const _WarehouseModel({required this.id, required this.name, required this.factory});
  factory _WarehouseModel.fromJson(Map<String, dynamic> json) => _$WarehouseModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  FactoryModel factory;

/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarehouseModelCopyWith<_WarehouseModel> get copyWith => __$WarehouseModelCopyWithImpl<_WarehouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarehouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarehouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.factory, factory) || other.factory == factory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,factory);
}

@override
String toString() {
    return 'WarehouseModel(id: $id, name: $name, factory: $factory)';
}


}

/// @nodoc
abstract mixin class _$WarehouseModelCopyWith<$Res> implements $WarehouseModelCopyWith<$Res> {
  factory _$WarehouseModelCopyWith(_WarehouseModel value, $Res Function(_WarehouseModel) _then) = __$WarehouseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, FactoryModel factory
});


@override $FactoryModelCopyWith<$Res> get factory;

}
/// @nodoc
class __$WarehouseModelCopyWithImpl<$Res>
    implements _$WarehouseModelCopyWith<$Res> {
  __$WarehouseModelCopyWithImpl(this._self, this._then);

  final _WarehouseModel _self;
  final $Res Function(_WarehouseModel) _then;

/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? factory = null,}) {
  return _then(_WarehouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,factory: null == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as FactoryModel,
  ));
}

/// Create a copy of WarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FactoryModelCopyWith<$Res> get factory {
  
  return $FactoryModelCopyWith<$Res>(_self.factory, (value) {
    return _then(_self.copyWith(factory: value));
  });
}
}


/// @nodoc
mixin _$FactoryModel {

 String get id; String get name;
/// Create a copy of FactoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactoryModelCopyWith<FactoryModel> get copyWith => _$FactoryModelCopyWithImpl<FactoryModel>(this as FactoryModel, _$identity);

  /// Serializes this FactoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FactoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FactoryModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as FactoryModel;
  return 'FactoryModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $FactoryModelCopyWith<$Res>  {
  factory $FactoryModelCopyWith(FactoryModel value, $Res Function(FactoryModel) _then) = _$FactoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$FactoryModelCopyWithImpl<$Res>
    implements $FactoryModelCopyWith<$Res> {
  _$FactoryModelCopyWithImpl(this._self, this._then);

  final FactoryModel _self;
  final $Res Function(FactoryModel) _then;

/// Create a copy of FactoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(FactoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FactoryModel].
extension FactoryModelPatterns on FactoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactoryModel value)  $default,){
final _that = this;
switch (_that) {
case _FactoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _FactoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactoryModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _FactoryModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _FactoryModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FactoryModel implements FactoryModel {
  const _FactoryModel({required this.id, required this.name});
  factory _FactoryModel.fromJson(Map<String, dynamic> json) => _$FactoryModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of FactoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactoryModelCopyWith<_FactoryModel> get copyWith => __$FactoryModelCopyWithImpl<_FactoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FactoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'FactoryModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$FactoryModelCopyWith<$Res> implements $FactoryModelCopyWith<$Res> {
  factory _$FactoryModelCopyWith(_FactoryModel value, $Res Function(_FactoryModel) _then) = __$FactoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$FactoryModelCopyWithImpl<$Res>
    implements _$FactoryModelCopyWith<$Res> {
  __$FactoryModelCopyWithImpl(this._self, this._then);

  final _FactoryModel _self;
  final $Res Function(_FactoryModel) _then;

/// Create a copy of FactoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_FactoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
