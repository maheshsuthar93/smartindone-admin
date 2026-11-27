// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryTransactionModel {

 String get id; String? get materialId; String? get hardwareId; String get warehouseId; double get quantityChange; String get transactionType; String? get notes; String? get referenceType; String? get referenceId; DateTime? get createdAt; TransactionItemModel? get material; TransactionItemModel? get hardware; TransactionWarehouseModel? get warehouse;
/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryTransactionModelCopyWith<InventoryTransactionModel> get copyWith => _$InventoryTransactionModelCopyWithImpl<InventoryTransactionModel>(this as InventoryTransactionModel, _$identity);

  /// Serializes this InventoryTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as InventoryTransactionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryTransactionModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.hardwareId, _this.hardwareId) || other.hardwareId == _this.hardwareId)&&(identical(other.warehouseId, _this.warehouseId) || other.warehouseId == _this.warehouseId)&&(identical(other.quantityChange, _this.quantityChange) || other.quantityChange == _this.quantityChange)&&(identical(other.transactionType, _this.transactionType) || other.transactionType == _this.transactionType)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.referenceType, _this.referenceType) || other.referenceType == _this.referenceType)&&(identical(other.referenceId, _this.referenceId) || other.referenceId == _this.referenceId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.hardware, _this.hardware) || other.hardware == _this.hardware)&&(identical(other.warehouse, _this.warehouse) || other.warehouse == _this.warehouse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as InventoryTransactionModel;
  return Object.hash(runtimeType,_this.id,_this.materialId,_this.hardwareId,_this.warehouseId,_this.quantityChange,_this.transactionType,_this.notes,_this.referenceType,_this.referenceId,_this.createdAt,_this.material,_this.hardware,_this.warehouse);
}

@override
String toString() {
  final _this = this as InventoryTransactionModel;
  return 'InventoryTransactionModel(id: ${_this.id}, materialId: ${_this.materialId}, hardwareId: ${_this.hardwareId}, warehouseId: ${_this.warehouseId}, quantityChange: ${_this.quantityChange}, transactionType: ${_this.transactionType}, notes: ${_this.notes}, referenceType: ${_this.referenceType}, referenceId: ${_this.referenceId}, createdAt: ${_this.createdAt}, material: ${_this.material}, hardware: ${_this.hardware}, warehouse: ${_this.warehouse})';
}


}

/// @nodoc
abstract mixin class $InventoryTransactionModelCopyWith<$Res>  {
  factory $InventoryTransactionModelCopyWith(InventoryTransactionModel value, $Res Function(InventoryTransactionModel) _then) = _$InventoryTransactionModelCopyWithImpl;
@useResult
$Res call({
 String id, String? materialId, String? hardwareId, String warehouseId, double quantityChange, String transactionType, String? notes, String? referenceType, String? referenceId, DateTime? createdAt, TransactionItemModel? material, TransactionItemModel? hardware, TransactionWarehouseModel? warehouse
});


$TransactionItemModelCopyWith<$Res>? get material;$TransactionItemModelCopyWith<$Res>? get hardware;$TransactionWarehouseModelCopyWith<$Res>? get warehouse;

}
/// @nodoc
class _$InventoryTransactionModelCopyWithImpl<$Res>
    implements $InventoryTransactionModelCopyWith<$Res> {
  _$InventoryTransactionModelCopyWithImpl(this._self, this._then);

  final InventoryTransactionModel _self;
  final $Res Function(InventoryTransactionModel) _then;

/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? materialId = freezed,Object? hardwareId = freezed,Object? warehouseId = null,Object? quantityChange = null,Object? transactionType = null,Object? notes = freezed,Object? referenceType = freezed,Object? referenceId = freezed,Object? createdAt = freezed,Object? material = freezed,Object? hardware = freezed,Object? warehouse = freezed,}) {
  return _then(InventoryTransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,hardwareId: freezed == hardwareId ? _self.hardwareId : hardwareId // ignore: cast_nullable_to_non_nullable
as String?,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,quantityChange: null == quantityChange ? _self.quantityChange : quantityChange // ignore: cast_nullable_to_non_nullable
as double,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,referenceType: freezed == referenceType ? _self.referenceType : referenceType // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as TransactionItemModel?,hardware: freezed == hardware ? _self.hardware : hardware // ignore: cast_nullable_to_non_nullable
as TransactionItemModel?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as TransactionWarehouseModel?,
  ));
}
/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<$Res>? get material {
    if (_self.material == null) {
    return null;
  }

  return $TransactionItemModelCopyWith<$Res>(_self.material!, (value) {
    return _then(_self.copyWith(material: value));
  });
}/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<$Res>? get hardware {
    if (_self.hardware == null) {
    return null;
  }

  return $TransactionItemModelCopyWith<$Res>(_self.hardware!, (value) {
    return _then(_self.copyWith(hardware: value));
  });
}/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionWarehouseModelCopyWith<$Res>? get warehouse {
    if (_self.warehouse == null) {
    return null;
  }

  return $TransactionWarehouseModelCopyWith<$Res>(_self.warehouse!, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}
}


/// Adds pattern-matching-related methods to [InventoryTransactionModel].
extension InventoryTransactionModelPatterns on InventoryTransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryTransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryTransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryTransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _InventoryTransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryTransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryTransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? materialId,  String? hardwareId,  String warehouseId,  double quantityChange,  String transactionType,  String? notes,  String? referenceType,  String? referenceId,  DateTime? createdAt,  TransactionItemModel? material,  TransactionItemModel? hardware,  TransactionWarehouseModel? warehouse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryTransactionModel() when $default != null:
return $default(_that.id,_that.materialId,_that.hardwareId,_that.warehouseId,_that.quantityChange,_that.transactionType,_that.notes,_that.referenceType,_that.referenceId,_that.createdAt,_that.material,_that.hardware,_that.warehouse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? materialId,  String? hardwareId,  String warehouseId,  double quantityChange,  String transactionType,  String? notes,  String? referenceType,  String? referenceId,  DateTime? createdAt,  TransactionItemModel? material,  TransactionItemModel? hardware,  TransactionWarehouseModel? warehouse)  $default,) {final _that = this;
switch (_that) {
case _InventoryTransactionModel():
return $default(_that.id,_that.materialId,_that.hardwareId,_that.warehouseId,_that.quantityChange,_that.transactionType,_that.notes,_that.referenceType,_that.referenceId,_that.createdAt,_that.material,_that.hardware,_that.warehouse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? materialId,  String? hardwareId,  String warehouseId,  double quantityChange,  String transactionType,  String? notes,  String? referenceType,  String? referenceId,  DateTime? createdAt,  TransactionItemModel? material,  TransactionItemModel? hardware,  TransactionWarehouseModel? warehouse)?  $default,) {final _that = this;
switch (_that) {
case _InventoryTransactionModel() when $default != null:
return $default(_that.id,_that.materialId,_that.hardwareId,_that.warehouseId,_that.quantityChange,_that.transactionType,_that.notes,_that.referenceType,_that.referenceId,_that.createdAt,_that.material,_that.hardware,_that.warehouse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventoryTransactionModel implements InventoryTransactionModel {
  const _InventoryTransactionModel({required this.id, this.materialId, this.hardwareId, required this.warehouseId, required this.quantityChange, required this.transactionType, this.notes, this.referenceType, this.referenceId, this.createdAt, this.material, this.hardware, this.warehouse});
  factory _InventoryTransactionModel.fromJson(Map<String, dynamic> json) => _$InventoryTransactionModelFromJson(json);

@override final  String id;
@override final  String? materialId;
@override final  String? hardwareId;
@override final  String warehouseId;
@override final  double quantityChange;
@override final  String transactionType;
@override final  String? notes;
@override final  String? referenceType;
@override final  String? referenceId;
@override final  DateTime? createdAt;
@override final  TransactionItemModel? material;
@override final  TransactionItemModel? hardware;
@override final  TransactionWarehouseModel? warehouse;

/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryTransactionModelCopyWith<_InventoryTransactionModel> get copyWith => __$InventoryTransactionModelCopyWithImpl<_InventoryTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.hardwareId, hardwareId) || other.hardwareId == hardwareId)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.quantityChange, quantityChange) || other.quantityChange == quantityChange)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.referenceType, referenceType) || other.referenceType == referenceType)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.material, material) || other.material == material)&&(identical(other.hardware, hardware) || other.hardware == hardware)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,materialId,hardwareId,warehouseId,quantityChange,transactionType,notes,referenceType,referenceId,createdAt,material,hardware,warehouse);
}

@override
String toString() {
    return 'InventoryTransactionModel(id: $id, materialId: $materialId, hardwareId: $hardwareId, warehouseId: $warehouseId, quantityChange: $quantityChange, transactionType: $transactionType, notes: $notes, referenceType: $referenceType, referenceId: $referenceId, createdAt: $createdAt, material: $material, hardware: $hardware, warehouse: $warehouse)';
}


}

/// @nodoc
abstract mixin class _$InventoryTransactionModelCopyWith<$Res> implements $InventoryTransactionModelCopyWith<$Res> {
  factory _$InventoryTransactionModelCopyWith(_InventoryTransactionModel value, $Res Function(_InventoryTransactionModel) _then) = __$InventoryTransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? materialId, String? hardwareId, String warehouseId, double quantityChange, String transactionType, String? notes, String? referenceType, String? referenceId, DateTime? createdAt, TransactionItemModel? material, TransactionItemModel? hardware, TransactionWarehouseModel? warehouse
});


@override $TransactionItemModelCopyWith<$Res>? get material;@override $TransactionItemModelCopyWith<$Res>? get hardware;@override $TransactionWarehouseModelCopyWith<$Res>? get warehouse;

}
/// @nodoc
class __$InventoryTransactionModelCopyWithImpl<$Res>
    implements _$InventoryTransactionModelCopyWith<$Res> {
  __$InventoryTransactionModelCopyWithImpl(this._self, this._then);

  final _InventoryTransactionModel _self;
  final $Res Function(_InventoryTransactionModel) _then;

/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? materialId = freezed,Object? hardwareId = freezed,Object? warehouseId = null,Object? quantityChange = null,Object? transactionType = null,Object? notes = freezed,Object? referenceType = freezed,Object? referenceId = freezed,Object? createdAt = freezed,Object? material = freezed,Object? hardware = freezed,Object? warehouse = freezed,}) {
  return _then(_InventoryTransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,hardwareId: freezed == hardwareId ? _self.hardwareId : hardwareId // ignore: cast_nullable_to_non_nullable
as String?,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,quantityChange: null == quantityChange ? _self.quantityChange : quantityChange // ignore: cast_nullable_to_non_nullable
as double,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,referenceType: freezed == referenceType ? _self.referenceType : referenceType // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,material: freezed == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as TransactionItemModel?,hardware: freezed == hardware ? _self.hardware : hardware // ignore: cast_nullable_to_non_nullable
as TransactionItemModel?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as TransactionWarehouseModel?,
  ));
}

/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<$Res>? get material {
    if (_self.material == null) {
    return null;
  }

  return $TransactionItemModelCopyWith<$Res>(_self.material!, (value) {
    return _then(_self.copyWith(material: value));
  });
}/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<$Res>? get hardware {
    if (_self.hardware == null) {
    return null;
  }

  return $TransactionItemModelCopyWith<$Res>(_self.hardware!, (value) {
    return _then(_self.copyWith(hardware: value));
  });
}/// Create a copy of InventoryTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionWarehouseModelCopyWith<$Res>? get warehouse {
    if (_self.warehouse == null) {
    return null;
  }

  return $TransactionWarehouseModelCopyWith<$Res>(_self.warehouse!, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}
}


/// @nodoc
mixin _$TransactionItemModel {

 String get id; String get name; String? get code; String? get unit;
/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<TransactionItemModel> get copyWith => _$TransactionItemModelCopyWithImpl<TransactionItemModel>(this as TransactionItemModel, _$identity);

  /// Serializes this TransactionItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransactionItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.unit, _this.unit) || other.unit == _this.unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransactionItemModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code,_this.unit);
}

@override
String toString() {
  final _this = this as TransactionItemModel;
  return 'TransactionItemModel(id: ${_this.id}, name: ${_this.name}, code: ${_this.code}, unit: ${_this.unit})';
}


}

/// @nodoc
abstract mixin class $TransactionItemModelCopyWith<$Res>  {
  factory $TransactionItemModelCopyWith(TransactionItemModel value, $Res Function(TransactionItemModel) _then) = _$TransactionItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? code, String? unit
});




}
/// @nodoc
class _$TransactionItemModelCopyWithImpl<$Res>
    implements $TransactionItemModelCopyWith<$Res> {
  _$TransactionItemModelCopyWithImpl(this._self, this._then);

  final TransactionItemModel _self;
  final $Res Function(TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? unit = freezed,}) {
  return _then(TransactionItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemModel].
extension TransactionItemModelPatterns on TransactionItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? code,  String? unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? code,  String? unit)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel():
return $default(_that.id,_that.name,_that.code,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? code,  String? unit)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionItemModel implements TransactionItemModel {
  const _TransactionItemModel({required this.id, required this.name, this.code, this.unit});
  factory _TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? code;
@override final  String? unit;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemModelCopyWith<_TransactionItemModel> get copyWith => __$TransactionItemModelCopyWithImpl<_TransactionItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code,unit);
}

@override
String toString() {
    return 'TransactionItemModel(id: $id, name: $name, code: $code, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemModelCopyWith<$Res> implements $TransactionItemModelCopyWith<$Res> {
  factory _$TransactionItemModelCopyWith(_TransactionItemModel value, $Res Function(_TransactionItemModel) _then) = __$TransactionItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? code, String? unit
});




}
/// @nodoc
class __$TransactionItemModelCopyWithImpl<$Res>
    implements _$TransactionItemModelCopyWith<$Res> {
  __$TransactionItemModelCopyWithImpl(this._self, this._then);

  final _TransactionItemModel _self;
  final $Res Function(_TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? unit = freezed,}) {
  return _then(_TransactionItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TransactionWarehouseModel {

 String get id; String get name;
/// Create a copy of TransactionWarehouseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionWarehouseModelCopyWith<TransactionWarehouseModel> get copyWith => _$TransactionWarehouseModelCopyWithImpl<TransactionWarehouseModel>(this as TransactionWarehouseModel, _$identity);

  /// Serializes this TransactionWarehouseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransactionWarehouseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionWarehouseModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransactionWarehouseModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as TransactionWarehouseModel;
  return 'TransactionWarehouseModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $TransactionWarehouseModelCopyWith<$Res>  {
  factory $TransactionWarehouseModelCopyWith(TransactionWarehouseModel value, $Res Function(TransactionWarehouseModel) _then) = _$TransactionWarehouseModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$TransactionWarehouseModelCopyWithImpl<$Res>
    implements $TransactionWarehouseModelCopyWith<$Res> {
  _$TransactionWarehouseModelCopyWithImpl(this._self, this._then);

  final TransactionWarehouseModel _self;
  final $Res Function(TransactionWarehouseModel) _then;

/// Create a copy of TransactionWarehouseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(TransactionWarehouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionWarehouseModel].
extension TransactionWarehouseModelPatterns on TransactionWarehouseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionWarehouseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionWarehouseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionWarehouseModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionWarehouseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionWarehouseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionWarehouseModel() when $default != null:
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
case _TransactionWarehouseModel() when $default != null:
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
case _TransactionWarehouseModel():
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
case _TransactionWarehouseModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionWarehouseModel implements TransactionWarehouseModel {
  const _TransactionWarehouseModel({required this.id, required this.name});
  factory _TransactionWarehouseModel.fromJson(Map<String, dynamic> json) => _$TransactionWarehouseModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of TransactionWarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionWarehouseModelCopyWith<_TransactionWarehouseModel> get copyWith => __$TransactionWarehouseModelCopyWithImpl<_TransactionWarehouseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionWarehouseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionWarehouseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'TransactionWarehouseModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TransactionWarehouseModelCopyWith<$Res> implements $TransactionWarehouseModelCopyWith<$Res> {
  factory _$TransactionWarehouseModelCopyWith(_TransactionWarehouseModel value, $Res Function(_TransactionWarehouseModel) _then) = __$TransactionWarehouseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$TransactionWarehouseModelCopyWithImpl<$Res>
    implements _$TransactionWarehouseModelCopyWith<$Res> {
  __$TransactionWarehouseModelCopyWithImpl(this._self, this._then);

  final _TransactionWarehouseModel _self;
  final $Res Function(_TransactionWarehouseModel) _then;

/// Create a copy of TransactionWarehouseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TransactionWarehouseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
