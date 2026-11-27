// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialGroupModel {

 String get id; MaterialGroupStatus get status; MaterialModel get material; int? get pieceCount;
/// Create a copy of MaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialGroupModelCopyWith<MaterialGroupModel> get copyWith => _$MaterialGroupModelCopyWithImpl<MaterialGroupModel>(this as MaterialGroupModel, _$identity);

  /// Serializes this MaterialGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaterialGroupModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialGroupModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.pieceCount, _this.pieceCount) || other.pieceCount == _this.pieceCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaterialGroupModel;
  return Object.hash(runtimeType,_this.id,_this.status,_this.material,_this.pieceCount);
}

@override
String toString() {
  final _this = this as MaterialGroupModel;
  return 'MaterialGroupModel(id: ${_this.id}, status: ${_this.status}, material: ${_this.material}, pieceCount: ${_this.pieceCount})';
}


}

/// @nodoc
abstract mixin class $MaterialGroupModelCopyWith<$Res>  {
  factory $MaterialGroupModelCopyWith(MaterialGroupModel value, $Res Function(MaterialGroupModel) _then) = _$MaterialGroupModelCopyWithImpl;
@useResult
$Res call({
 String id, MaterialGroupStatus status, MaterialModel material, int? pieceCount
});


$MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class _$MaterialGroupModelCopyWithImpl<$Res>
    implements $MaterialGroupModelCopyWith<$Res> {
  _$MaterialGroupModelCopyWithImpl(this._self, this._then);

  final MaterialGroupModel _self;
  final $Res Function(MaterialGroupModel) _then;

/// Create a copy of MaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? material = null,Object? pieceCount = freezed,}) {
  return _then(MaterialGroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaterialGroupStatus,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,pieceCount: freezed == pieceCount ? _self.pieceCount : pieceCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of MaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaterialModelCopyWith<$Res> get material {
  
  return $MaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaterialGroupModel].
extension MaterialGroupModelPatterns on MaterialGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaterialGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaterialGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaterialGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _MaterialGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaterialGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaterialGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MaterialGroupStatus status,  MaterialModel material,  int? pieceCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialGroupModel() when $default != null:
return $default(_that.id,_that.status,_that.material,_that.pieceCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MaterialGroupStatus status,  MaterialModel material,  int? pieceCount)  $default,) {final _that = this;
switch (_that) {
case _MaterialGroupModel():
return $default(_that.id,_that.status,_that.material,_that.pieceCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MaterialGroupStatus status,  MaterialModel material,  int? pieceCount)?  $default,) {final _that = this;
switch (_that) {
case _MaterialGroupModel() when $default != null:
return $default(_that.id,_that.status,_that.material,_that.pieceCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaterialGroupModel implements MaterialGroupModel {
  const _MaterialGroupModel({required this.id, required this.status, required this.material, this.pieceCount});
  factory _MaterialGroupModel.fromJson(Map<String, dynamic> json) => _$MaterialGroupModelFromJson(json);

@override final  String id;
@override final  MaterialGroupStatus status;
@override final  MaterialModel material;
@override final  int? pieceCount;

/// Create a copy of MaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialGroupModelCopyWith<_MaterialGroupModel> get copyWith => __$MaterialGroupModelCopyWithImpl<_MaterialGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.material, material) || other.material == material)&&(identical(other.pieceCount, pieceCount) || other.pieceCount == pieceCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,status,material,pieceCount);
}

@override
String toString() {
    return 'MaterialGroupModel(id: $id, status: $status, material: $material, pieceCount: $pieceCount)';
}


}

/// @nodoc
abstract mixin class _$MaterialGroupModelCopyWith<$Res> implements $MaterialGroupModelCopyWith<$Res> {
  factory _$MaterialGroupModelCopyWith(_MaterialGroupModel value, $Res Function(_MaterialGroupModel) _then) = __$MaterialGroupModelCopyWithImpl;
@override @useResult
$Res call({
 String id, MaterialGroupStatus status, MaterialModel material, int? pieceCount
});


@override $MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class __$MaterialGroupModelCopyWithImpl<$Res>
    implements _$MaterialGroupModelCopyWith<$Res> {
  __$MaterialGroupModelCopyWithImpl(this._self, this._then);

  final _MaterialGroupModel _self;
  final $Res Function(_MaterialGroupModel) _then;

/// Create a copy of MaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? material = null,Object? pieceCount = freezed,}) {
  return _then(_MaterialGroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaterialGroupStatus,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,pieceCount: freezed == pieceCount ? _self.pieceCount : pieceCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of MaterialGroupModel
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

 String get id; String get name; String get code; String get type; int get thickness; String get unit;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.unit, _this.unit) || other.unit == _this.unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaterialModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code,_this.type,_this.thickness,_this.unit);
}

@override
String toString() {
  final _this = this as MaterialModel;
  return 'MaterialModel(id: ${_this.id}, name: ${_this.name}, code: ${_this.code}, type: ${_this.type}, thickness: ${_this.thickness}, unit: ${_this.unit})';
}


}

/// @nodoc
abstract mixin class $MaterialModelCopyWith<$Res>  {
  factory $MaterialModelCopyWith(MaterialModel value, $Res Function(MaterialModel) _then) = _$MaterialModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, String type, int thickness, String unit
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? thickness = null,Object? unit = null,}) {
  return _then(MaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String type,  int thickness,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.thickness,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String type,  int thickness,  String unit)  $default,) {final _that = this;
switch (_that) {
case _MaterialModel():
return $default(_that.id,_that.name,_that.code,_that.type,_that.thickness,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  String type,  int thickness,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.thickness,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaterialModel implements MaterialModel {
  const _MaterialModel({required this.id, required this.name, required this.code, required this.type, required this.thickness, required this.unit});
  factory _MaterialModel.fromJson(Map<String, dynamic> json) => _$MaterialModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  String type;
@override final  int thickness;
@override final  String unit;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code,type,thickness,unit);
}

@override
String toString() {
    return 'MaterialModel(id: $id, name: $name, code: $code, type: $type, thickness: $thickness, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$MaterialModelCopyWith<$Res> implements $MaterialModelCopyWith<$Res> {
  factory _$MaterialModelCopyWith(_MaterialModel value, $Res Function(_MaterialModel) _then) = __$MaterialModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, String type, int thickness, String unit
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? thickness = null,Object? unit = null,}) {
  return _then(_MaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
