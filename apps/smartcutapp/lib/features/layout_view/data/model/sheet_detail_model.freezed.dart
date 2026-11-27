// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sheet_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SheetDetailModel {

 String get id; String get materialId; String get warehouseId; double get width; double get height; double get thickness; SheetType get type; SheetStatus get status; bool get isOffcut; String? get projectId; String get createdAt; String get updatedAt; String? get parentId; SheetMaterialModel get material;
/// Create a copy of SheetDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SheetDetailModelCopyWith<SheetDetailModel> get copyWith => _$SheetDetailModelCopyWithImpl<SheetDetailModel>(this as SheetDetailModel, _$identity);

  /// Serializes this SheetDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SheetDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SheetDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.warehouseId, _this.warehouseId) || other.warehouseId == _this.warehouseId)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.isOffcut, _this.isOffcut) || other.isOffcut == _this.isOffcut)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.material, _this.material) || other.material == _this.material));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SheetDetailModel;
  return Object.hash(runtimeType,_this.id,_this.materialId,_this.warehouseId,_this.width,_this.height,_this.thickness,_this.type,_this.status,_this.isOffcut,_this.projectId,_this.createdAt,_this.updatedAt,_this.parentId,_this.material);
}

@override
String toString() {
  final _this = this as SheetDetailModel;
  return 'SheetDetailModel(id: ${_this.id}, materialId: ${_this.materialId}, warehouseId: ${_this.warehouseId}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, type: ${_this.type}, status: ${_this.status}, isOffcut: ${_this.isOffcut}, projectId: ${_this.projectId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, parentId: ${_this.parentId}, material: ${_this.material})';
}


}

/// @nodoc
abstract mixin class $SheetDetailModelCopyWith<$Res>  {
  factory $SheetDetailModelCopyWith(SheetDetailModel value, $Res Function(SheetDetailModel) _then) = _$SheetDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String materialId, String warehouseId, double width, double height, double thickness, SheetType type, SheetStatus status, bool isOffcut, String? projectId, String createdAt, String updatedAt, String? parentId, SheetMaterialModel material
});


$SheetMaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class _$SheetDetailModelCopyWithImpl<$Res>
    implements $SheetDetailModelCopyWith<$Res> {
  _$SheetDetailModelCopyWithImpl(this._self, this._then);

  final SheetDetailModel _self;
  final $Res Function(SheetDetailModel) _then;

/// Create a copy of SheetDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? materialId = null,Object? warehouseId = null,Object? width = null,Object? height = null,Object? thickness = null,Object? type = null,Object? status = null,Object? isOffcut = null,Object? projectId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? parentId = freezed,Object? material = null,}) {
  return _then(SheetDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SheetType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SheetStatus,isOffcut: null == isOffcut ? _self.isOffcut : isOffcut // ignore: cast_nullable_to_non_nullable
as bool,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as SheetMaterialModel,
  ));
}
/// Create a copy of SheetDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SheetMaterialModelCopyWith<$Res> get material {
  
  return $SheetMaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}
}


/// Adds pattern-matching-related methods to [SheetDetailModel].
extension SheetDetailModelPatterns on SheetDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SheetDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SheetDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SheetDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _SheetDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SheetDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _SheetDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String materialId,  String warehouseId,  double width,  double height,  double thickness,  SheetType type,  SheetStatus status,  bool isOffcut,  String? projectId,  String createdAt,  String updatedAt,  String? parentId,  SheetMaterialModel material)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SheetDetailModel() when $default != null:
return $default(_that.id,_that.materialId,_that.warehouseId,_that.width,_that.height,_that.thickness,_that.type,_that.status,_that.isOffcut,_that.projectId,_that.createdAt,_that.updatedAt,_that.parentId,_that.material);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String materialId,  String warehouseId,  double width,  double height,  double thickness,  SheetType type,  SheetStatus status,  bool isOffcut,  String? projectId,  String createdAt,  String updatedAt,  String? parentId,  SheetMaterialModel material)  $default,) {final _that = this;
switch (_that) {
case _SheetDetailModel():
return $default(_that.id,_that.materialId,_that.warehouseId,_that.width,_that.height,_that.thickness,_that.type,_that.status,_that.isOffcut,_that.projectId,_that.createdAt,_that.updatedAt,_that.parentId,_that.material);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String materialId,  String warehouseId,  double width,  double height,  double thickness,  SheetType type,  SheetStatus status,  bool isOffcut,  String? projectId,  String createdAt,  String updatedAt,  String? parentId,  SheetMaterialModel material)?  $default,) {final _that = this;
switch (_that) {
case _SheetDetailModel() when $default != null:
return $default(_that.id,_that.materialId,_that.warehouseId,_that.width,_that.height,_that.thickness,_that.type,_that.status,_that.isOffcut,_that.projectId,_that.createdAt,_that.updatedAt,_that.parentId,_that.material);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SheetDetailModel implements SheetDetailModel {
  const _SheetDetailModel({required this.id, required this.materialId, required this.warehouseId, required this.width, required this.height, required this.thickness, required this.type, required this.status, required this.isOffcut, this.projectId, required this.createdAt, required this.updatedAt, this.parentId, required this.material});
  factory _SheetDetailModel.fromJson(Map<String, dynamic> json) => _$SheetDetailModelFromJson(json);

@override final  String id;
@override final  String materialId;
@override final  String warehouseId;
@override final  double width;
@override final  double height;
@override final  double thickness;
@override final  SheetType type;
@override final  SheetStatus status;
@override final  bool isOffcut;
@override final  String? projectId;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? parentId;
@override final  SheetMaterialModel material;

/// Create a copy of SheetDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SheetDetailModelCopyWith<_SheetDetailModel> get copyWith => __$SheetDetailModelCopyWithImpl<_SheetDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SheetDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SheetDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.isOffcut, isOffcut) || other.isOffcut == isOffcut)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.material, material) || other.material == material));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,materialId,warehouseId,width,height,thickness,type,status,isOffcut,projectId,createdAt,updatedAt,parentId,material);
}

@override
String toString() {
    return 'SheetDetailModel(id: $id, materialId: $materialId, warehouseId: $warehouseId, width: $width, height: $height, thickness: $thickness, type: $type, status: $status, isOffcut: $isOffcut, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt, parentId: $parentId, material: $material)';
}


}

/// @nodoc
abstract mixin class _$SheetDetailModelCopyWith<$Res> implements $SheetDetailModelCopyWith<$Res> {
  factory _$SheetDetailModelCopyWith(_SheetDetailModel value, $Res Function(_SheetDetailModel) _then) = __$SheetDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String materialId, String warehouseId, double width, double height, double thickness, SheetType type, SheetStatus status, bool isOffcut, String? projectId, String createdAt, String updatedAt, String? parentId, SheetMaterialModel material
});


@override $SheetMaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class __$SheetDetailModelCopyWithImpl<$Res>
    implements _$SheetDetailModelCopyWith<$Res> {
  __$SheetDetailModelCopyWithImpl(this._self, this._then);

  final _SheetDetailModel _self;
  final $Res Function(_SheetDetailModel) _then;

/// Create a copy of SheetDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? materialId = null,Object? warehouseId = null,Object? width = null,Object? height = null,Object? thickness = null,Object? type = null,Object? status = null,Object? isOffcut = null,Object? projectId = freezed,Object? createdAt = null,Object? updatedAt = null,Object? parentId = freezed,Object? material = null,}) {
  return _then(_SheetDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SheetType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SheetStatus,isOffcut: null == isOffcut ? _self.isOffcut : isOffcut // ignore: cast_nullable_to_non_nullable
as bool,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as SheetMaterialModel,
  ));
}

/// Create a copy of SheetDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SheetMaterialModelCopyWith<$Res> get material {
  
  return $SheetMaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}
}


/// @nodoc
mixin _$SheetMaterialModel {

 String get id; String get name; String get code; double get thickness; double? get density; String get createdAt; String get updatedAt; double? get defaultHeight; double? get defaultLength; double? get defaultWidth; String get unit;
/// Create a copy of SheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SheetMaterialModelCopyWith<SheetMaterialModel> get copyWith => _$SheetMaterialModelCopyWithImpl<SheetMaterialModel>(this as SheetMaterialModel, _$identity);

  /// Serializes this SheetMaterialModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SheetMaterialModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SheetMaterialModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.density, _this.density) || other.density == _this.density)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.defaultHeight, _this.defaultHeight) || other.defaultHeight == _this.defaultHeight)&&(identical(other.defaultLength, _this.defaultLength) || other.defaultLength == _this.defaultLength)&&(identical(other.defaultWidth, _this.defaultWidth) || other.defaultWidth == _this.defaultWidth)&&(identical(other.unit, _this.unit) || other.unit == _this.unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SheetMaterialModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code,_this.thickness,_this.density,_this.createdAt,_this.updatedAt,_this.defaultHeight,_this.defaultLength,_this.defaultWidth,_this.unit);
}

@override
String toString() {
  final _this = this as SheetMaterialModel;
  return 'SheetMaterialModel(id: ${_this.id}, name: ${_this.name}, code: ${_this.code}, thickness: ${_this.thickness}, density: ${_this.density}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, defaultHeight: ${_this.defaultHeight}, defaultLength: ${_this.defaultLength}, defaultWidth: ${_this.defaultWidth}, unit: ${_this.unit})';
}


}

/// @nodoc
abstract mixin class $SheetMaterialModelCopyWith<$Res>  {
  factory $SheetMaterialModelCopyWith(SheetMaterialModel value, $Res Function(SheetMaterialModel) _then) = _$SheetMaterialModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, double thickness, double? density, String createdAt, String updatedAt, double? defaultHeight, double? defaultLength, double? defaultWidth, String unit
});




}
/// @nodoc
class _$SheetMaterialModelCopyWithImpl<$Res>
    implements $SheetMaterialModelCopyWith<$Res> {
  _$SheetMaterialModelCopyWithImpl(this._self, this._then);

  final SheetMaterialModel _self;
  final $Res Function(SheetMaterialModel) _then;

/// Create a copy of SheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? thickness = null,Object? density = freezed,Object? createdAt = null,Object? updatedAt = null,Object? defaultHeight = freezed,Object? defaultLength = freezed,Object? defaultWidth = freezed,Object? unit = null,}) {
  return _then(SheetMaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,density: freezed == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,defaultHeight: freezed == defaultHeight ? _self.defaultHeight : defaultHeight // ignore: cast_nullable_to_non_nullable
as double?,defaultLength: freezed == defaultLength ? _self.defaultLength : defaultLength // ignore: cast_nullable_to_non_nullable
as double?,defaultWidth: freezed == defaultWidth ? _self.defaultWidth : defaultWidth // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SheetMaterialModel].
extension SheetMaterialModelPatterns on SheetMaterialModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SheetMaterialModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SheetMaterialModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SheetMaterialModel value)  $default,){
final _that = this;
switch (_that) {
case _SheetMaterialModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SheetMaterialModel value)?  $default,){
final _that = this;
switch (_that) {
case _SheetMaterialModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  double thickness,  double? density,  String createdAt,  String updatedAt,  double? defaultHeight,  double? defaultLength,  double? defaultWidth,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SheetMaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.thickness,_that.density,_that.createdAt,_that.updatedAt,_that.defaultHeight,_that.defaultLength,_that.defaultWidth,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  double thickness,  double? density,  String createdAt,  String updatedAt,  double? defaultHeight,  double? defaultLength,  double? defaultWidth,  String unit)  $default,) {final _that = this;
switch (_that) {
case _SheetMaterialModel():
return $default(_that.id,_that.name,_that.code,_that.thickness,_that.density,_that.createdAt,_that.updatedAt,_that.defaultHeight,_that.defaultLength,_that.defaultWidth,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  double thickness,  double? density,  String createdAt,  String updatedAt,  double? defaultHeight,  double? defaultLength,  double? defaultWidth,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _SheetMaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.thickness,_that.density,_that.createdAt,_that.updatedAt,_that.defaultHeight,_that.defaultLength,_that.defaultWidth,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SheetMaterialModel implements SheetMaterialModel {
  const _SheetMaterialModel({required this.id, required this.name, required this.code, required this.thickness, this.density, required this.createdAt, required this.updatedAt, this.defaultHeight, this.defaultLength, this.defaultWidth, required this.unit});
  factory _SheetMaterialModel.fromJson(Map<String, dynamic> json) => _$SheetMaterialModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  double thickness;
@override final  double? density;
@override final  String createdAt;
@override final  String updatedAt;
@override final  double? defaultHeight;
@override final  double? defaultLength;
@override final  double? defaultWidth;
@override final  String unit;

/// Create a copy of SheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SheetMaterialModelCopyWith<_SheetMaterialModel> get copyWith => __$SheetMaterialModelCopyWithImpl<_SheetMaterialModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SheetMaterialModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SheetMaterialModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.density, density) || other.density == density)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.defaultHeight, defaultHeight) || other.defaultHeight == defaultHeight)&&(identical(other.defaultLength, defaultLength) || other.defaultLength == defaultLength)&&(identical(other.defaultWidth, defaultWidth) || other.defaultWidth == defaultWidth)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code,thickness,density,createdAt,updatedAt,defaultHeight,defaultLength,defaultWidth,unit);
}

@override
String toString() {
    return 'SheetMaterialModel(id: $id, name: $name, code: $code, thickness: $thickness, density: $density, createdAt: $createdAt, updatedAt: $updatedAt, defaultHeight: $defaultHeight, defaultLength: $defaultLength, defaultWidth: $defaultWidth, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$SheetMaterialModelCopyWith<$Res> implements $SheetMaterialModelCopyWith<$Res> {
  factory _$SheetMaterialModelCopyWith(_SheetMaterialModel value, $Res Function(_SheetMaterialModel) _then) = __$SheetMaterialModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, double thickness, double? density, String createdAt, String updatedAt, double? defaultHeight, double? defaultLength, double? defaultWidth, String unit
});




}
/// @nodoc
class __$SheetMaterialModelCopyWithImpl<$Res>
    implements _$SheetMaterialModelCopyWith<$Res> {
  __$SheetMaterialModelCopyWithImpl(this._self, this._then);

  final _SheetMaterialModel _self;
  final $Res Function(_SheetMaterialModel) _then;

/// Create a copy of SheetMaterialModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? thickness = null,Object? density = freezed,Object? createdAt = null,Object? updatedAt = null,Object? defaultHeight = freezed,Object? defaultLength = freezed,Object? defaultWidth = freezed,Object? unit = null,}) {
  return _then(_SheetMaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,density: freezed == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,defaultHeight: freezed == defaultHeight ? _self.defaultHeight : defaultHeight // ignore: cast_nullable_to_non_nullable
as double?,defaultLength: freezed == defaultLength ? _self.defaultLength : defaultLength // ignore: cast_nullable_to_non_nullable
as double?,defaultWidth: freezed == defaultWidth ? _self.defaultWidth : defaultWidth // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
