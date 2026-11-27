// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartDetailModel {

 String get id; int get partNumber; String get orderItemId; String get name; double get width; double get height; double get thickness; bool get grain; bool get rotatable; bool? get isDeleted; int get quantity; String? get materialId; GrainDirection? get grainDirection; double? get edgeBandTop; double? get edgeBandBottom; double? get edgeBandLeft; double? get edgeBandRight; DateTime get createdAt; DateTime? get updatedAt; MaterialModel get material;
/// Create a copy of PartDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartDetailModelCopyWith<PartDetailModel> get copyWith => _$PartDetailModelCopyWithImpl<PartDetailModel>(this as PartDetailModel, _$identity);

  /// Serializes this PartDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PartDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.partNumber, _this.partNumber) || other.partNumber == _this.partNumber)&&(identical(other.orderItemId, _this.orderItemId) || other.orderItemId == _this.orderItemId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.grain, _this.grain) || other.grain == _this.grain)&&(identical(other.rotatable, _this.rotatable) || other.rotatable == _this.rotatable)&&(identical(other.isDeleted, _this.isDeleted) || other.isDeleted == _this.isDeleted)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.grainDirection, _this.grainDirection) || other.grainDirection == _this.grainDirection)&&(identical(other.edgeBandTop, _this.edgeBandTop) || other.edgeBandTop == _this.edgeBandTop)&&(identical(other.edgeBandBottom, _this.edgeBandBottom) || other.edgeBandBottom == _this.edgeBandBottom)&&(identical(other.edgeBandLeft, _this.edgeBandLeft) || other.edgeBandLeft == _this.edgeBandLeft)&&(identical(other.edgeBandRight, _this.edgeBandRight) || other.edgeBandRight == _this.edgeBandRight)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.material, _this.material) || other.material == _this.material));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PartDetailModel;
  return Object.hashAll([runtimeType,_this.id,_this.partNumber,_this.orderItemId,_this.name,_this.width,_this.height,_this.thickness,_this.grain,_this.rotatable,_this.isDeleted,_this.quantity,_this.materialId,_this.grainDirection,_this.edgeBandTop,_this.edgeBandBottom,_this.edgeBandLeft,_this.edgeBandRight,_this.createdAt,_this.updatedAt,_this.material]);
}

@override
String toString() {
  final _this = this as PartDetailModel;
  return 'PartDetailModel(id: ${_this.id}, partNumber: ${_this.partNumber}, orderItemId: ${_this.orderItemId}, name: ${_this.name}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, grain: ${_this.grain}, rotatable: ${_this.rotatable}, isDeleted: ${_this.isDeleted}, quantity: ${_this.quantity}, materialId: ${_this.materialId}, grainDirection: ${_this.grainDirection}, edgeBandTop: ${_this.edgeBandTop}, edgeBandBottom: ${_this.edgeBandBottom}, edgeBandLeft: ${_this.edgeBandLeft}, edgeBandRight: ${_this.edgeBandRight}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, material: ${_this.material})';
}


}

/// @nodoc
abstract mixin class $PartDetailModelCopyWith<$Res>  {
  factory $PartDetailModelCopyWith(PartDetailModel value, $Res Function(PartDetailModel) _then) = _$PartDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, int partNumber, String orderItemId, String name, double width, double height, double thickness, bool grain, bool rotatable, bool? isDeleted, int quantity, String? materialId, GrainDirection? grainDirection, double? edgeBandTop, double? edgeBandBottom, double? edgeBandLeft, double? edgeBandRight, DateTime createdAt, DateTime? updatedAt, MaterialModel material
});


$MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class _$PartDetailModelCopyWithImpl<$Res>
    implements $PartDetailModelCopyWith<$Res> {
  _$PartDetailModelCopyWithImpl(this._self, this._then);

  final PartDetailModel _self;
  final $Res Function(PartDetailModel) _then;

/// Create a copy of PartDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? partNumber = null,Object? orderItemId = null,Object? name = null,Object? width = null,Object? height = null,Object? thickness = null,Object? grain = null,Object? rotatable = null,Object? isDeleted = freezed,Object? quantity = null,Object? materialId = freezed,Object? grainDirection = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? material = null,}) {
  return _then(PartDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as int,orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,grainDirection: freezed == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as double?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as double?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as double?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,
  ));
}
/// Create a copy of PartDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaterialModelCopyWith<$Res> get material {
  
  return $MaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartDetailModel].
extension PartDetailModelPatterns on PartDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _PartDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int partNumber,  String orderItemId,  String name,  double width,  double height,  double thickness,  bool grain,  bool rotatable,  bool? isDeleted,  int quantity,  String? materialId,  GrainDirection? grainDirection,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  DateTime createdAt,  DateTime? updatedAt,  MaterialModel material)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartDetailModel() when $default != null:
return $default(_that.id,_that.partNumber,_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.grain,_that.rotatable,_that.isDeleted,_that.quantity,_that.materialId,_that.grainDirection,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.createdAt,_that.updatedAt,_that.material);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int partNumber,  String orderItemId,  String name,  double width,  double height,  double thickness,  bool grain,  bool rotatable,  bool? isDeleted,  int quantity,  String? materialId,  GrainDirection? grainDirection,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  DateTime createdAt,  DateTime? updatedAt,  MaterialModel material)  $default,) {final _that = this;
switch (_that) {
case _PartDetailModel():
return $default(_that.id,_that.partNumber,_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.grain,_that.rotatable,_that.isDeleted,_that.quantity,_that.materialId,_that.grainDirection,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.createdAt,_that.updatedAt,_that.material);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int partNumber,  String orderItemId,  String name,  double width,  double height,  double thickness,  bool grain,  bool rotatable,  bool? isDeleted,  int quantity,  String? materialId,  GrainDirection? grainDirection,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  DateTime createdAt,  DateTime? updatedAt,  MaterialModel material)?  $default,) {final _that = this;
switch (_that) {
case _PartDetailModel() when $default != null:
return $default(_that.id,_that.partNumber,_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.grain,_that.rotatable,_that.isDeleted,_that.quantity,_that.materialId,_that.grainDirection,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.createdAt,_that.updatedAt,_that.material);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartDetailModel implements PartDetailModel {
  const _PartDetailModel({required this.id, required this.partNumber, required this.orderItemId, required this.name, required this.width, required this.height, required this.thickness, required this.grain, this.rotatable = true, this.isDeleted, required this.quantity, this.materialId, this.grainDirection, this.edgeBandTop, this.edgeBandBottom, this.edgeBandLeft, this.edgeBandRight, required this.createdAt, this.updatedAt, required this.material});
  factory _PartDetailModel.fromJson(Map<String, dynamic> json) => _$PartDetailModelFromJson(json);

@override final  String id;
@override final  int partNumber;
@override final  String orderItemId;
@override final  String name;
@override final  double width;
@override final  double height;
@override final  double thickness;
@override final  bool grain;
@override@JsonKey() final  bool rotatable;
@override final  bool? isDeleted;
@override final  int quantity;
@override final  String? materialId;
@override final  GrainDirection? grainDirection;
@override final  double? edgeBandTop;
@override final  double? edgeBandBottom;
@override final  double? edgeBandLeft;
@override final  double? edgeBandRight;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  MaterialModel material;

/// Create a copy of PartDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartDetailModelCopyWith<_PartDetailModel> get copyWith => __$PartDetailModelCopyWithImpl<_PartDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.orderItemId, orderItemId) || other.orderItemId == orderItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.grain, grain) || other.grain == grain)&&(identical(other.rotatable, rotatable) || other.rotatable == rotatable)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.grainDirection, grainDirection) || other.grainDirection == grainDirection)&&(identical(other.edgeBandTop, edgeBandTop) || other.edgeBandTop == edgeBandTop)&&(identical(other.edgeBandBottom, edgeBandBottom) || other.edgeBandBottom == edgeBandBottom)&&(identical(other.edgeBandLeft, edgeBandLeft) || other.edgeBandLeft == edgeBandLeft)&&(identical(other.edgeBandRight, edgeBandRight) || other.edgeBandRight == edgeBandRight)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.material, material) || other.material == material));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,partNumber,orderItemId,name,width,height,thickness,grain,rotatable,isDeleted,quantity,materialId,grainDirection,edgeBandTop,edgeBandBottom,edgeBandLeft,edgeBandRight,createdAt,updatedAt,material]);
}

@override
String toString() {
    return 'PartDetailModel(id: $id, partNumber: $partNumber, orderItemId: $orderItemId, name: $name, width: $width, height: $height, thickness: $thickness, grain: $grain, rotatable: $rotatable, isDeleted: $isDeleted, quantity: $quantity, materialId: $materialId, grainDirection: $grainDirection, edgeBandTop: $edgeBandTop, edgeBandBottom: $edgeBandBottom, edgeBandLeft: $edgeBandLeft, edgeBandRight: $edgeBandRight, createdAt: $createdAt, updatedAt: $updatedAt, material: $material)';
}


}

/// @nodoc
abstract mixin class _$PartDetailModelCopyWith<$Res> implements $PartDetailModelCopyWith<$Res> {
  factory _$PartDetailModelCopyWith(_PartDetailModel value, $Res Function(_PartDetailModel) _then) = __$PartDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int partNumber, String orderItemId, String name, double width, double height, double thickness, bool grain, bool rotatable, bool? isDeleted, int quantity, String? materialId, GrainDirection? grainDirection, double? edgeBandTop, double? edgeBandBottom, double? edgeBandLeft, double? edgeBandRight, DateTime createdAt, DateTime? updatedAt, MaterialModel material
});


@override $MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class __$PartDetailModelCopyWithImpl<$Res>
    implements _$PartDetailModelCopyWith<$Res> {
  __$PartDetailModelCopyWithImpl(this._self, this._then);

  final _PartDetailModel _self;
  final $Res Function(_PartDetailModel) _then;

/// Create a copy of PartDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? partNumber = null,Object? orderItemId = null,Object? name = null,Object? width = null,Object? height = null,Object? thickness = null,Object? grain = null,Object? rotatable = null,Object? isDeleted = freezed,Object? quantity = null,Object? materialId = freezed,Object? grainDirection = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? material = null,}) {
  return _then(_PartDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partNumber: null == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as int,orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: freezed == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,grainDirection: freezed == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as double?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as double?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as double?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,
  ));
}

/// Create a copy of PartDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaterialModelCopyWith<$Res> get material {
  
  return $MaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}
}


/// @nodoc
mixin _$MaterialModel {

 String get id; String get name; double get thickness; String get type;
/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialModelCopyWith<MaterialModel> get copyWith => _$MaterialModelCopyWithImpl<MaterialModel>(this as MaterialModel, _$identity);

  /// Serializes this MaterialModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaterialModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.type, _this.type) || other.type == _this.type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaterialModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.thickness,_this.type);
}

@override
String toString() {
  final _this = this as MaterialModel;
  return 'MaterialModel(id: ${_this.id}, name: ${_this.name}, thickness: ${_this.thickness}, type: ${_this.type})';
}


}

/// @nodoc
abstract mixin class $MaterialModelCopyWith<$Res>  {
  factory $MaterialModelCopyWith(MaterialModel value, $Res Function(MaterialModel) _then) = _$MaterialModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, double thickness, String type
});




}
/// @nodoc
class _$MaterialModelCopyWithImpl<$Res>
    implements $MaterialModelCopyWith<$Res> {
  _$MaterialModelCopyWithImpl(this._self, this._then);

  final MaterialModel _self;
  final $Res Function(MaterialModel) _then;

/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? thickness = null,Object? type = null,}) {
  return _then(MaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MaterialModel].
extension MaterialModelPatterns on MaterialModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaterialModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaterialModel value)  $default,){
final _that = this;
switch (_that) {
case _MaterialModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaterialModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double thickness,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.thickness,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double thickness,  String type)  $default,) {final _that = this;
switch (_that) {
case _MaterialModel():
return $default(_that.id,_that.name,_that.thickness,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double thickness,  String type)?  $default,) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.thickness,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaterialModel implements MaterialModel {
  const _MaterialModel({required this.id, required this.name, required this.thickness, required this.type});
  factory _MaterialModel.fromJson(Map<String, dynamic> json) => _$MaterialModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  double thickness;
@override final  String type;

/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialModelCopyWith<_MaterialModel> get copyWith => __$MaterialModelCopyWithImpl<_MaterialModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,thickness,type);
}

@override
String toString() {
    return 'MaterialModel(id: $id, name: $name, thickness: $thickness, type: $type)';
}


}

/// @nodoc
abstract mixin class _$MaterialModelCopyWith<$Res> implements $MaterialModelCopyWith<$Res> {
  factory _$MaterialModelCopyWith(_MaterialModel value, $Res Function(_MaterialModel) _then) = __$MaterialModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double thickness, String type
});




}
/// @nodoc
class __$MaterialModelCopyWithImpl<$Res>
    implements _$MaterialModelCopyWith<$Res> {
  __$MaterialModelCopyWithImpl(this._self, this._then);

  final _MaterialModel _self;
  final $Res Function(_MaterialModel) _then;

/// Create a copy of MaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? thickness = null,Object? type = null,}) {
  return _then(_MaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
