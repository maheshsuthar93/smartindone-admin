// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartModel {

 String get id; String get orderItemId; String get name; double get width; double get height; double get thickness; bool get grain; int get quantity; GrainDirection get grainDirection; String? get materialId; DateTime get createdAt; MaterialModel get material;
/// Create a copy of PartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartModelCopyWith<PartModel> get copyWith => _$PartModelCopyWithImpl<PartModel>(this as PartModel, _$identity);

  /// Serializes this PartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PartModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderItemId, _this.orderItemId) || other.orderItemId == _this.orderItemId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.grain, _this.grain) || other.grain == _this.grain)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.grainDirection, _this.grainDirection) || other.grainDirection == _this.grainDirection)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.material, _this.material) || other.material == _this.material));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PartModel;
  return Object.hash(runtimeType,_this.id,_this.orderItemId,_this.name,_this.width,_this.height,_this.thickness,_this.grain,_this.quantity,_this.grainDirection,_this.materialId,_this.createdAt,_this.material);
}

@override
String toString() {
  final _this = this as PartModel;
  return 'PartModel(id: ${_this.id}, orderItemId: ${_this.orderItemId}, name: ${_this.name}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, grain: ${_this.grain}, quantity: ${_this.quantity}, grainDirection: ${_this.grainDirection}, materialId: ${_this.materialId}, createdAt: ${_this.createdAt}, material: ${_this.material})';
}


}

/// @nodoc
abstract mixin class $PartModelCopyWith<$Res>  {
  factory $PartModelCopyWith(PartModel value, $Res Function(PartModel) _then) = _$PartModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderItemId, String name, double width, double height, double thickness, bool grain, int quantity, GrainDirection grainDirection, String? materialId, DateTime createdAt, MaterialModel material
});


$MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class _$PartModelCopyWithImpl<$Res>
    implements $PartModelCopyWith<$Res> {
  _$PartModelCopyWithImpl(this._self, this._then);

  final PartModel _self;
  final $Res Function(PartModel) _then;

/// Create a copy of PartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderItemId = null,Object? name = null,Object? width = null,Object? height = null,Object? thickness = null,Object? grain = null,Object? quantity = null,Object? grainDirection = null,Object? materialId = freezed,Object? createdAt = null,Object? material = null,}) {
  return _then(PartModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,
  ));
}
/// Create a copy of PartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaterialModelCopyWith<$Res> get material {
  
  return $MaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartModel].
extension PartModelPatterns on PartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartModel value)  $default,){
final _that = this;
switch (_that) {
case _PartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderItemId,  String name,  double width,  double height,  double thickness,  bool grain,  int quantity,  GrainDirection grainDirection,  String? materialId,  DateTime createdAt,  MaterialModel material)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartModel() when $default != null:
return $default(_that.id,_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.grain,_that.quantity,_that.grainDirection,_that.materialId,_that.createdAt,_that.material);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderItemId,  String name,  double width,  double height,  double thickness,  bool grain,  int quantity,  GrainDirection grainDirection,  String? materialId,  DateTime createdAt,  MaterialModel material)  $default,) {final _that = this;
switch (_that) {
case _PartModel():
return $default(_that.id,_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.grain,_that.quantity,_that.grainDirection,_that.materialId,_that.createdAt,_that.material);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderItemId,  String name,  double width,  double height,  double thickness,  bool grain,  int quantity,  GrainDirection grainDirection,  String? materialId,  DateTime createdAt,  MaterialModel material)?  $default,) {final _that = this;
switch (_that) {
case _PartModel() when $default != null:
return $default(_that.id,_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.grain,_that.quantity,_that.grainDirection,_that.materialId,_that.createdAt,_that.material);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartModel implements PartModel {
  const _PartModel({required this.id, required this.orderItemId, required this.name, required this.width, required this.height, required this.thickness, required this.grain, required this.quantity, required this.grainDirection, this.materialId, required this.createdAt, required this.material});
  factory _PartModel.fromJson(Map<String, dynamic> json) => _$PartModelFromJson(json);

@override final  String id;
@override final  String orderItemId;
@override final  String name;
@override final  double width;
@override final  double height;
@override final  double thickness;
@override final  bool grain;
@override final  int quantity;
@override final  GrainDirection grainDirection;
@override final  String? materialId;
@override final  DateTime createdAt;
@override final  MaterialModel material;

/// Create a copy of PartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartModelCopyWith<_PartModel> get copyWith => __$PartModelCopyWithImpl<_PartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderItemId, orderItemId) || other.orderItemId == orderItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.grain, grain) || other.grain == grain)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grainDirection, grainDirection) || other.grainDirection == grainDirection)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.material, material) || other.material == material));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderItemId,name,width,height,thickness,grain,quantity,grainDirection,materialId,createdAt,material);
}

@override
String toString() {
    return 'PartModel(id: $id, orderItemId: $orderItemId, name: $name, width: $width, height: $height, thickness: $thickness, grain: $grain, quantity: $quantity, grainDirection: $grainDirection, materialId: $materialId, createdAt: $createdAt, material: $material)';
}


}

/// @nodoc
abstract mixin class _$PartModelCopyWith<$Res> implements $PartModelCopyWith<$Res> {
  factory _$PartModelCopyWith(_PartModel value, $Res Function(_PartModel) _then) = __$PartModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderItemId, String name, double width, double height, double thickness, bool grain, int quantity, GrainDirection grainDirection, String? materialId, DateTime createdAt, MaterialModel material
});


@override $MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class __$PartModelCopyWithImpl<$Res>
    implements _$PartModelCopyWith<$Res> {
  __$PartModelCopyWithImpl(this._self, this._then);

  final _PartModel _self;
  final $Res Function(_PartModel) _then;

/// Create a copy of PartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderItemId = null,Object? name = null,Object? width = null,Object? height = null,Object? thickness = null,Object? grain = null,Object? quantity = null,Object? grainDirection = null,Object? materialId = freezed,Object? createdAt = null,Object? material = null,}) {
  return _then(_PartModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,materialId: freezed == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,
  ));
}

/// Create a copy of PartModel
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

 String get name; String get code; MaterialType get type;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.type, _this.type) || other.type == _this.type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaterialModel;
  return Object.hash(runtimeType,_this.name,_this.code,_this.type);
}

@override
String toString() {
  final _this = this as MaterialModel;
  return 'MaterialModel(name: ${_this.name}, code: ${_this.code}, type: ${_this.type})';
}


}

/// @nodoc
abstract mixin class $MaterialModelCopyWith<$Res>  {
  factory $MaterialModelCopyWith(MaterialModel value, $Res Function(MaterialModel) _then) = _$MaterialModelCopyWithImpl;
@useResult
$Res call({
 String name, String code, MaterialType type
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? type = null,}) {
  return _then(MaterialModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MaterialType,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  MaterialType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.name,_that.code,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  MaterialType type)  $default,) {final _that = this;
switch (_that) {
case _MaterialModel():
return $default(_that.name,_that.code,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  MaterialType type)?  $default,) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.name,_that.code,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaterialModel implements MaterialModel {
  const _MaterialModel({required this.name, required this.code, required this.type});
  factory _MaterialModel.fromJson(Map<String, dynamic> json) => _$MaterialModelFromJson(json);

@override final  String name;
@override final  String code;
@override final  MaterialType type;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialModel&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,code,type);
}

@override
String toString() {
    return 'MaterialModel(name: $name, code: $code, type: $type)';
}


}

/// @nodoc
abstract mixin class _$MaterialModelCopyWith<$Res> implements $MaterialModelCopyWith<$Res> {
  factory _$MaterialModelCopyWith(_MaterialModel value, $Res Function(_MaterialModel) _then) = __$MaterialModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, MaterialType type
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? type = null,}) {
  return _then(_MaterialModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MaterialType,
  ));
}


}

// dart format on
