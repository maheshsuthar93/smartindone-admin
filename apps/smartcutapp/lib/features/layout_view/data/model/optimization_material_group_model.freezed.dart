// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'optimization_material_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OptimizationMaterialGroupModel {

 String get id; String get optimizationId; String get materialId; DateTime get createdAt; DateTime get updatedAt; String get status; Optimization get optimization; MaterialModel get material; List<OptimizationPiece> get pieces; List<OptimizationLayoutModel> get layouts;
/// Create a copy of OptimizationMaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationMaterialGroupModelCopyWith<OptimizationMaterialGroupModel> get copyWith => _$OptimizationMaterialGroupModelCopyWithImpl<OptimizationMaterialGroupModel>(this as OptimizationMaterialGroupModel, _$identity);

  /// Serializes this OptimizationMaterialGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptimizationMaterialGroupModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptimizationMaterialGroupModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.optimizationId, _this.optimizationId) || other.optimizationId == _this.optimizationId)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.optimization, _this.optimization) || other.optimization == _this.optimization)&&(identical(other.material, _this.material) || other.material == _this.material)&&const DeepCollectionEquality().equals(other.pieces, _this.pieces)&&const DeepCollectionEquality().equals(other.layouts, _this.layouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptimizationMaterialGroupModel;
  return Object.hash(runtimeType,_this.id,_this.optimizationId,_this.materialId,_this.createdAt,_this.updatedAt,_this.status,_this.optimization,_this.material,const DeepCollectionEquality().hash(_this.pieces),const DeepCollectionEquality().hash(_this.layouts));
}

@override
String toString() {
  final _this = this as OptimizationMaterialGroupModel;
  return 'OptimizationMaterialGroupModel(id: ${_this.id}, optimizationId: ${_this.optimizationId}, materialId: ${_this.materialId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, status: ${_this.status}, optimization: ${_this.optimization}, material: ${_this.material}, pieces: ${_this.pieces}, layouts: ${_this.layouts})';
}


}

/// @nodoc
abstract mixin class $OptimizationMaterialGroupModelCopyWith<$Res>  {
  factory $OptimizationMaterialGroupModelCopyWith(OptimizationMaterialGroupModel value, $Res Function(OptimizationMaterialGroupModel) _then) = _$OptimizationMaterialGroupModelCopyWithImpl;
@useResult
$Res call({
 String id, String optimizationId, String materialId, DateTime createdAt, DateTime updatedAt, String status, Optimization optimization, MaterialModel material, List<OptimizationPiece> pieces, List<OptimizationLayoutModel> layouts
});


$OptimizationCopyWith<$Res> get optimization;$MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class _$OptimizationMaterialGroupModelCopyWithImpl<$Res>
    implements $OptimizationMaterialGroupModelCopyWith<$Res> {
  _$OptimizationMaterialGroupModelCopyWithImpl(this._self, this._then);

  final OptimizationMaterialGroupModel _self;
  final $Res Function(OptimizationMaterialGroupModel) _then;

/// Create a copy of OptimizationMaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? optimizationId = null,Object? materialId = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? optimization = null,Object? material = null,Object? pieces = null,Object? layouts = null,}) {
  return _then(OptimizationMaterialGroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationId: null == optimizationId ? _self.optimizationId : optimizationId // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,optimization: null == optimization ? _self.optimization : optimization // ignore: cast_nullable_to_non_nullable
as Optimization,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,pieces: null == pieces ? _self.pieces : pieces // ignore: cast_nullable_to_non_nullable
as List<OptimizationPiece>,layouts: null == layouts ? _self.layouts : layouts // ignore: cast_nullable_to_non_nullable
as List<OptimizationLayoutModel>,
  ));
}
/// Create a copy of OptimizationMaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptimizationCopyWith<$Res> get optimization {
  
  return $OptimizationCopyWith<$Res>(_self.optimization, (value) {
    return _then(_self.copyWith(optimization: value));
  });
}/// Create a copy of OptimizationMaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaterialModelCopyWith<$Res> get material {
  
  return $MaterialModelCopyWith<$Res>(_self.material, (value) {
    return _then(_self.copyWith(material: value));
  });
}
}


/// Adds pattern-matching-related methods to [OptimizationMaterialGroupModel].
extension OptimizationMaterialGroupModelPatterns on OptimizationMaterialGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptimizationMaterialGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptimizationMaterialGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptimizationMaterialGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _OptimizationMaterialGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptimizationMaterialGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _OptimizationMaterialGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String optimizationId,  String materialId,  DateTime createdAt,  DateTime updatedAt,  String status,  Optimization optimization,  MaterialModel material,  List<OptimizationPiece> pieces,  List<OptimizationLayoutModel> layouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptimizationMaterialGroupModel() when $default != null:
return $default(_that.id,_that.optimizationId,_that.materialId,_that.createdAt,_that.updatedAt,_that.status,_that.optimization,_that.material,_that.pieces,_that.layouts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String optimizationId,  String materialId,  DateTime createdAt,  DateTime updatedAt,  String status,  Optimization optimization,  MaterialModel material,  List<OptimizationPiece> pieces,  List<OptimizationLayoutModel> layouts)  $default,) {final _that = this;
switch (_that) {
case _OptimizationMaterialGroupModel():
return $default(_that.id,_that.optimizationId,_that.materialId,_that.createdAt,_that.updatedAt,_that.status,_that.optimization,_that.material,_that.pieces,_that.layouts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String optimizationId,  String materialId,  DateTime createdAt,  DateTime updatedAt,  String status,  Optimization optimization,  MaterialModel material,  List<OptimizationPiece> pieces,  List<OptimizationLayoutModel> layouts)?  $default,) {final _that = this;
switch (_that) {
case _OptimizationMaterialGroupModel() when $default != null:
return $default(_that.id,_that.optimizationId,_that.materialId,_that.createdAt,_that.updatedAt,_that.status,_that.optimization,_that.material,_that.pieces,_that.layouts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptimizationMaterialGroupModel implements OptimizationMaterialGroupModel {
  const _OptimizationMaterialGroupModel({required this.id, required this.optimizationId, required this.materialId, required this.createdAt, required this.updatedAt, required this.status, required this.optimization, required this.material, required  List<OptimizationPiece> pieces, required  List<OptimizationLayoutModel> layouts}): _pieces = pieces,_layouts = layouts;
  factory _OptimizationMaterialGroupModel.fromJson(Map<String, dynamic> json) => _$OptimizationMaterialGroupModelFromJson(json);

@override final  String id;
@override final  String optimizationId;
@override final  String materialId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String status;
@override final  Optimization optimization;
@override final  MaterialModel material;
 final  List<OptimizationPiece> _pieces;
@override List<OptimizationPiece> get pieces {
  if (_pieces is EqualUnmodifiableListView) return _pieces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pieces);
}

 final  List<OptimizationLayoutModel> _layouts;
@override List<OptimizationLayoutModel> get layouts {
  if (_layouts is EqualUnmodifiableListView) return _layouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_layouts);
}


/// Create a copy of OptimizationMaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationMaterialGroupModelCopyWith<_OptimizationMaterialGroupModel> get copyWith => __$OptimizationMaterialGroupModelCopyWithImpl<_OptimizationMaterialGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationMaterialGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptimizationMaterialGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.optimizationId, optimizationId) || other.optimizationId == optimizationId)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.optimization, optimization) || other.optimization == optimization)&&(identical(other.material, material) || other.material == material)&&const DeepCollectionEquality().equals(other.pieces, _pieces)&&const DeepCollectionEquality().equals(other.layouts, _layouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,optimizationId,materialId,createdAt,updatedAt,status,optimization,material,const DeepCollectionEquality().hash(_pieces),const DeepCollectionEquality().hash(_layouts));
}

@override
String toString() {
    return 'OptimizationMaterialGroupModel(id: $id, optimizationId: $optimizationId, materialId: $materialId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, optimization: $optimization, material: $material, pieces: $pieces, layouts: $layouts)';
}


}

/// @nodoc
abstract mixin class _$OptimizationMaterialGroupModelCopyWith<$Res> implements $OptimizationMaterialGroupModelCopyWith<$Res> {
  factory _$OptimizationMaterialGroupModelCopyWith(_OptimizationMaterialGroupModel value, $Res Function(_OptimizationMaterialGroupModel) _then) = __$OptimizationMaterialGroupModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String optimizationId, String materialId, DateTime createdAt, DateTime updatedAt, String status, Optimization optimization, MaterialModel material, List<OptimizationPiece> pieces, List<OptimizationLayoutModel> layouts
});


@override $OptimizationCopyWith<$Res> get optimization;@override $MaterialModelCopyWith<$Res> get material;

}
/// @nodoc
class __$OptimizationMaterialGroupModelCopyWithImpl<$Res>
    implements _$OptimizationMaterialGroupModelCopyWith<$Res> {
  __$OptimizationMaterialGroupModelCopyWithImpl(this._self, this._then);

  final _OptimizationMaterialGroupModel _self;
  final $Res Function(_OptimizationMaterialGroupModel) _then;

/// Create a copy of OptimizationMaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? optimizationId = null,Object? materialId = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? optimization = null,Object? material = null,Object? pieces = null,Object? layouts = null,}) {
  return _then(_OptimizationMaterialGroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationId: null == optimizationId ? _self.optimizationId : optimizationId // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,optimization: null == optimization ? _self.optimization : optimization // ignore: cast_nullable_to_non_nullable
as Optimization,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as MaterialModel,pieces: null == pieces ? _self._pieces : pieces // ignore: cast_nullable_to_non_nullable
as List<OptimizationPiece>,layouts: null == layouts ? _self._layouts : layouts // ignore: cast_nullable_to_non_nullable
as List<OptimizationLayoutModel>,
  ));
}

/// Create a copy of OptimizationMaterialGroupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptimizationCopyWith<$Res> get optimization {
  
  return $OptimizationCopyWith<$Res>(_self.optimization, (value) {
    return _then(_self.copyWith(optimization: value));
  });
}/// Create a copy of OptimizationMaterialGroupModel
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
mixin _$Optimization {

 String get id; String get optimizationNo; String get orderId; String get status;
/// Create a copy of Optimization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationCopyWith<Optimization> get copyWith => _$OptimizationCopyWithImpl<Optimization>(this as Optimization, _$identity);

  /// Serializes this Optimization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Optimization;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Optimization&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.optimizationNo, _this.optimizationNo) || other.optimizationNo == _this.optimizationNo)&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Optimization;
  return Object.hash(runtimeType,_this.id,_this.optimizationNo,_this.orderId,_this.status);
}

@override
String toString() {
  final _this = this as Optimization;
  return 'Optimization(id: ${_this.id}, optimizationNo: ${_this.optimizationNo}, orderId: ${_this.orderId}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $OptimizationCopyWith<$Res>  {
  factory $OptimizationCopyWith(Optimization value, $Res Function(Optimization) _then) = _$OptimizationCopyWithImpl;
@useResult
$Res call({
 String id, String optimizationNo, String orderId, String status
});




}
/// @nodoc
class _$OptimizationCopyWithImpl<$Res>
    implements $OptimizationCopyWith<$Res> {
  _$OptimizationCopyWithImpl(this._self, this._then);

  final Optimization _self;
  final $Res Function(Optimization) _then;

/// Create a copy of Optimization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? optimizationNo = null,Object? orderId = null,Object? status = null,}) {
  return _then(Optimization(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationNo: null == optimizationNo ? _self.optimizationNo : optimizationNo // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Optimization].
extension OptimizationPatterns on Optimization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Optimization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Optimization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Optimization value)  $default,){
final _that = this;
switch (_that) {
case _Optimization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Optimization value)?  $default,){
final _that = this;
switch (_that) {
case _Optimization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String optimizationNo,  String orderId,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Optimization() when $default != null:
return $default(_that.id,_that.optimizationNo,_that.orderId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String optimizationNo,  String orderId,  String status)  $default,) {final _that = this;
switch (_that) {
case _Optimization():
return $default(_that.id,_that.optimizationNo,_that.orderId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String optimizationNo,  String orderId,  String status)?  $default,) {final _that = this;
switch (_that) {
case _Optimization() when $default != null:
return $default(_that.id,_that.optimizationNo,_that.orderId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Optimization implements Optimization {
  const _Optimization({required this.id, required this.optimizationNo, required this.orderId, required this.status});
  factory _Optimization.fromJson(Map<String, dynamic> json) => _$OptimizationFromJson(json);

@override final  String id;
@override final  String optimizationNo;
@override final  String orderId;
@override final  String status;

/// Create a copy of Optimization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationCopyWith<_Optimization> get copyWith => __$OptimizationCopyWithImpl<_Optimization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Optimization&&(identical(other.id, id) || other.id == id)&&(identical(other.optimizationNo, optimizationNo) || other.optimizationNo == optimizationNo)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,optimizationNo,orderId,status);
}

@override
String toString() {
    return 'Optimization(id: $id, optimizationNo: $optimizationNo, orderId: $orderId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OptimizationCopyWith<$Res> implements $OptimizationCopyWith<$Res> {
  factory _$OptimizationCopyWith(_Optimization value, $Res Function(_Optimization) _then) = __$OptimizationCopyWithImpl;
@override @useResult
$Res call({
 String id, String optimizationNo, String orderId, String status
});




}
/// @nodoc
class __$OptimizationCopyWithImpl<$Res>
    implements _$OptimizationCopyWith<$Res> {
  __$OptimizationCopyWithImpl(this._self, this._then);

  final _Optimization _self;
  final $Res Function(_Optimization) _then;

/// Create a copy of Optimization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? optimizationNo = null,Object? orderId = null,Object? status = null,}) {
  return _then(_Optimization(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationNo: null == optimizationNo ? _self.optimizationNo : optimizationNo // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MaterialModel {

 String get id; String get name; String get code; MaterialType get type; int get thickness; double? get density; DateTime get createdAt; DateTime get updatedAt; double? get defaultHeight; double? get defaultLength; double? get defaultWidth; String get unit;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.density, _this.density) || other.density == _this.density)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.defaultHeight, _this.defaultHeight) || other.defaultHeight == _this.defaultHeight)&&(identical(other.defaultLength, _this.defaultLength) || other.defaultLength == _this.defaultLength)&&(identical(other.defaultWidth, _this.defaultWidth) || other.defaultWidth == _this.defaultWidth)&&(identical(other.unit, _this.unit) || other.unit == _this.unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaterialModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code,_this.type,_this.thickness,_this.density,_this.createdAt,_this.updatedAt,_this.defaultHeight,_this.defaultLength,_this.defaultWidth,_this.unit);
}

@override
String toString() {
  final _this = this as MaterialModel;
  return 'MaterialModel(id: ${_this.id}, name: ${_this.name}, code: ${_this.code}, type: ${_this.type}, thickness: ${_this.thickness}, density: ${_this.density}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, defaultHeight: ${_this.defaultHeight}, defaultLength: ${_this.defaultLength}, defaultWidth: ${_this.defaultWidth}, unit: ${_this.unit})';
}


}

/// @nodoc
abstract mixin class $MaterialModelCopyWith<$Res>  {
  factory $MaterialModelCopyWith(MaterialModel value, $Res Function(MaterialModel) _then) = _$MaterialModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, MaterialType type, int thickness, double? density, DateTime createdAt, DateTime updatedAt, double? defaultHeight, double? defaultLength, double? defaultWidth, String unit
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? thickness = null,Object? density = freezed,Object? createdAt = null,Object? updatedAt = null,Object? defaultHeight = freezed,Object? defaultLength = freezed,Object? defaultWidth = freezed,Object? unit = null,}) {
  return _then(MaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MaterialType,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,density: freezed == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,defaultHeight: freezed == defaultHeight ? _self.defaultHeight : defaultHeight // ignore: cast_nullable_to_non_nullable
as double?,defaultLength: freezed == defaultLength ? _self.defaultLength : defaultLength // ignore: cast_nullable_to_non_nullable
as double?,defaultWidth: freezed == defaultWidth ? _self.defaultWidth : defaultWidth // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  MaterialType type,  int thickness,  double? density,  DateTime createdAt,  DateTime updatedAt,  double? defaultHeight,  double? defaultLength,  double? defaultWidth,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.thickness,_that.density,_that.createdAt,_that.updatedAt,_that.defaultHeight,_that.defaultLength,_that.defaultWidth,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  MaterialType type,  int thickness,  double? density,  DateTime createdAt,  DateTime updatedAt,  double? defaultHeight,  double? defaultLength,  double? defaultWidth,  String unit)  $default,) {final _that = this;
switch (_that) {
case _MaterialModel():
return $default(_that.id,_that.name,_that.code,_that.type,_that.thickness,_that.density,_that.createdAt,_that.updatedAt,_that.defaultHeight,_that.defaultLength,_that.defaultWidth,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  MaterialType type,  int thickness,  double? density,  DateTime createdAt,  DateTime updatedAt,  double? defaultHeight,  double? defaultLength,  double? defaultWidth,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _MaterialModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.thickness,_that.density,_that.createdAt,_that.updatedAt,_that.defaultHeight,_that.defaultLength,_that.defaultWidth,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaterialModel implements MaterialModel {
  const _MaterialModel({required this.id, required this.name, required this.code, required this.type, required this.thickness, this.density, required this.createdAt, required this.updatedAt, this.defaultHeight, this.defaultLength, this.defaultWidth, required this.unit});
  factory _MaterialModel.fromJson(Map<String, dynamic> json) => _$MaterialModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  MaterialType type;
@override final  int thickness;
@override final  double? density;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  double? defaultHeight;
@override final  double? defaultLength;
@override final  double? defaultWidth;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.density, density) || other.density == density)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.defaultHeight, defaultHeight) || other.defaultHeight == defaultHeight)&&(identical(other.defaultLength, defaultLength) || other.defaultLength == defaultLength)&&(identical(other.defaultWidth, defaultWidth) || other.defaultWidth == defaultWidth)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code,type,thickness,density,createdAt,updatedAt,defaultHeight,defaultLength,defaultWidth,unit);
}

@override
String toString() {
    return 'MaterialModel(id: $id, name: $name, code: $code, type: $type, thickness: $thickness, density: $density, createdAt: $createdAt, updatedAt: $updatedAt, defaultHeight: $defaultHeight, defaultLength: $defaultLength, defaultWidth: $defaultWidth, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$MaterialModelCopyWith<$Res> implements $MaterialModelCopyWith<$Res> {
  factory _$MaterialModelCopyWith(_MaterialModel value, $Res Function(_MaterialModel) _then) = __$MaterialModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, MaterialType type, int thickness, double? density, DateTime createdAt, DateTime updatedAt, double? defaultHeight, double? defaultLength, double? defaultWidth, String unit
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? thickness = null,Object? density = freezed,Object? createdAt = null,Object? updatedAt = null,Object? defaultHeight = freezed,Object? defaultLength = freezed,Object? defaultWidth = freezed,Object? unit = null,}) {
  return _then(_MaterialModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MaterialType,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,density: freezed == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,defaultHeight: freezed == defaultHeight ? _self.defaultHeight : defaultHeight // ignore: cast_nullable_to_non_nullable
as double?,defaultLength: freezed == defaultLength ? _self.defaultLength : defaultLength // ignore: cast_nullable_to_non_nullable
as double?,defaultWidth: freezed == defaultWidth ? _self.defaultWidth : defaultWidth // ignore: cast_nullable_to_non_nullable
as double?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Part {

 String get id; String get name; String get materialId; bool get grain; GrainDirection get grainDirection; bool get rotatable;
/// Create a copy of Part
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartCopyWith<Part> get copyWith => _$PartCopyWithImpl<Part>(this as Part, _$identity);

  /// Serializes this Part to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Part;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Part&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.grain, _this.grain) || other.grain == _this.grain)&&(identical(other.grainDirection, _this.grainDirection) || other.grainDirection == _this.grainDirection)&&(identical(other.rotatable, _this.rotatable) || other.rotatable == _this.rotatable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Part;
  return Object.hash(runtimeType,_this.id,_this.name,_this.materialId,_this.grain,_this.grainDirection,_this.rotatable);
}

@override
String toString() {
  final _this = this as Part;
  return 'Part(id: ${_this.id}, name: ${_this.name}, materialId: ${_this.materialId}, grain: ${_this.grain}, grainDirection: ${_this.grainDirection}, rotatable: ${_this.rotatable})';
}


}

/// @nodoc
abstract mixin class $PartCopyWith<$Res>  {
  factory $PartCopyWith(Part value, $Res Function(Part) _then) = _$PartCopyWithImpl;
@useResult
$Res call({
 String id, String name, String materialId, bool grain, GrainDirection grainDirection, bool rotatable
});




}
/// @nodoc
class _$PartCopyWithImpl<$Res>
    implements $PartCopyWith<$Res> {
  _$PartCopyWithImpl(this._self, this._then);

  final Part _self;
  final $Res Function(Part) _then;

/// Create a copy of Part
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? materialId = null,Object? grain = null,Object? grainDirection = null,Object? rotatable = null,}) {
  return _then(Part(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Part].
extension PartPatterns on Part {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Part value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Part() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Part value)  $default,){
final _that = this;
switch (_that) {
case _Part():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Part value)?  $default,){
final _that = this;
switch (_that) {
case _Part() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String materialId,  bool grain,  GrainDirection grainDirection,  bool rotatable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Part() when $default != null:
return $default(_that.id,_that.name,_that.materialId,_that.grain,_that.grainDirection,_that.rotatable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String materialId,  bool grain,  GrainDirection grainDirection,  bool rotatable)  $default,) {final _that = this;
switch (_that) {
case _Part():
return $default(_that.id,_that.name,_that.materialId,_that.grain,_that.grainDirection,_that.rotatable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String materialId,  bool grain,  GrainDirection grainDirection,  bool rotatable)?  $default,) {final _that = this;
switch (_that) {
case _Part() when $default != null:
return $default(_that.id,_that.name,_that.materialId,_that.grain,_that.grainDirection,_that.rotatable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Part implements Part {
  const _Part({required this.id, required this.name, required this.materialId, required this.grain, required this.grainDirection, required this.rotatable});
  factory _Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

@override final  String id;
@override final  String name;
@override final  String materialId;
@override final  bool grain;
@override final  GrainDirection grainDirection;
@override final  bool rotatable;

/// Create a copy of Part
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartCopyWith<_Part> get copyWith => __$PartCopyWithImpl<_Part>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Part&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.grain, grain) || other.grain == grain)&&(identical(other.grainDirection, grainDirection) || other.grainDirection == grainDirection)&&(identical(other.rotatable, rotatable) || other.rotatable == rotatable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,materialId,grain,grainDirection,rotatable);
}

@override
String toString() {
    return 'Part(id: $id, name: $name, materialId: $materialId, grain: $grain, grainDirection: $grainDirection, rotatable: $rotatable)';
}


}

/// @nodoc
abstract mixin class _$PartCopyWith<$Res> implements $PartCopyWith<$Res> {
  factory _$PartCopyWith(_Part value, $Res Function(_Part) _then) = __$PartCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String materialId, bool grain, GrainDirection grainDirection, bool rotatable
});




}
/// @nodoc
class __$PartCopyWithImpl<$Res>
    implements _$PartCopyWith<$Res> {
  __$PartCopyWithImpl(this._self, this._then);

  final _Part _self;
  final $Res Function(_Part) _then;

/// Create a copy of Part
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? materialId = null,Object? grain = null,Object? grainDirection = null,Object? rotatable = null,}) {
  return _then(_Part(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Piece2 {

 String get id; String get pieceCode; String? get serialNo; int get width; int get height; int get thickness; bool get isDeleted; DateTime get createdAt; DateTime get updatedAt; String get partId; String? get barcode; String? get qrCode; int? get edgeBandTop; int? get edgeBandBottom; int? get edgeBandLeft; int? get edgeBandRight; List<OptimizationPieceProcess> get pieceProcesses; Part? get part;
/// Create a copy of Piece2
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Piece2CopyWith<Piece2> get copyWith => _$Piece2CopyWithImpl<Piece2>(this as Piece2, _$identity);

  /// Serializes this Piece2 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Piece2;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Piece2&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pieceCode, _this.pieceCode) || other.pieceCode == _this.pieceCode)&&(identical(other.serialNo, _this.serialNo) || other.serialNo == _this.serialNo)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.isDeleted, _this.isDeleted) || other.isDeleted == _this.isDeleted)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.partId, _this.partId) || other.partId == _this.partId)&&(identical(other.barcode, _this.barcode) || other.barcode == _this.barcode)&&(identical(other.qrCode, _this.qrCode) || other.qrCode == _this.qrCode)&&(identical(other.edgeBandTop, _this.edgeBandTop) || other.edgeBandTop == _this.edgeBandTop)&&(identical(other.edgeBandBottom, _this.edgeBandBottom) || other.edgeBandBottom == _this.edgeBandBottom)&&(identical(other.edgeBandLeft, _this.edgeBandLeft) || other.edgeBandLeft == _this.edgeBandLeft)&&(identical(other.edgeBandRight, _this.edgeBandRight) || other.edgeBandRight == _this.edgeBandRight)&&const DeepCollectionEquality().equals(other.pieceProcesses, _this.pieceProcesses)&&(identical(other.part, _this.part) || other.part == _this.part));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Piece2;
  return Object.hash(runtimeType,_this.id,_this.pieceCode,_this.serialNo,_this.width,_this.height,_this.thickness,_this.isDeleted,_this.createdAt,_this.updatedAt,_this.partId,_this.barcode,_this.qrCode,_this.edgeBandTop,_this.edgeBandBottom,_this.edgeBandLeft,_this.edgeBandRight,const DeepCollectionEquality().hash(_this.pieceProcesses),_this.part);
}

@override
String toString() {
  final _this = this as Piece2;
  return 'Piece2(id: ${_this.id}, pieceCode: ${_this.pieceCode}, serialNo: ${_this.serialNo}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, isDeleted: ${_this.isDeleted}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, partId: ${_this.partId}, barcode: ${_this.barcode}, qrCode: ${_this.qrCode}, edgeBandTop: ${_this.edgeBandTop}, edgeBandBottom: ${_this.edgeBandBottom}, edgeBandLeft: ${_this.edgeBandLeft}, edgeBandRight: ${_this.edgeBandRight}, pieceProcesses: ${_this.pieceProcesses}, part: ${_this.part})';
}


}

/// @nodoc
abstract mixin class $Piece2CopyWith<$Res>  {
  factory $Piece2CopyWith(Piece2 value, $Res Function(Piece2) _then) = _$Piece2CopyWithImpl;
@useResult
$Res call({
 String id, String pieceCode, String? serialNo, int width, int height, int thickness, bool isDeleted, DateTime createdAt, DateTime updatedAt, String partId, String? barcode, String? qrCode, int? edgeBandTop, int? edgeBandBottom, int? edgeBandLeft, int? edgeBandRight, List<OptimizationPieceProcess> pieceProcesses, Part? part
});


$PartCopyWith<$Res>? get part;

}
/// @nodoc
class _$Piece2CopyWithImpl<$Res>
    implements $Piece2CopyWith<$Res> {
  _$Piece2CopyWithImpl(this._self, this._then);

  final Piece2 _self;
  final $Res Function(Piece2) _then;

/// Create a copy of Piece2
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pieceCode = null,Object? serialNo = freezed,Object? width = null,Object? height = null,Object? thickness = null,Object? isDeleted = null,Object? createdAt = null,Object? updatedAt = null,Object? partId = null,Object? barcode = freezed,Object? qrCode = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? pieceProcesses = null,Object? part = freezed,}) {
  return _then(Piece2(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,serialNo: freezed == serialNo ? _self.serialNo : serialNo // ignore: cast_nullable_to_non_nullable
as String?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,partId: null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as int?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as int?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as int?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as int?,pieceProcesses: null == pieceProcesses ? _self.pieceProcesses : pieceProcesses // ignore: cast_nullable_to_non_nullable
as List<OptimizationPieceProcess>,part: freezed == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as Part?,
  ));
}
/// Create a copy of Piece2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartCopyWith<$Res>? get part {
    if (_self.part == null) {
    return null;
  }

  return $PartCopyWith<$Res>(_self.part!, (value) {
    return _then(_self.copyWith(part: value));
  });
}
}


/// Adds pattern-matching-related methods to [Piece2].
extension Piece2Patterns on Piece2 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Piece2 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Piece2() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Piece2 value)  $default,){
final _that = this;
switch (_that) {
case _Piece2():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Piece2 value)?  $default,){
final _that = this;
switch (_that) {
case _Piece2() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pieceCode,  String? serialNo,  int width,  int height,  int thickness,  bool isDeleted,  DateTime createdAt,  DateTime updatedAt,  String partId,  String? barcode,  String? qrCode,  int? edgeBandTop,  int? edgeBandBottom,  int? edgeBandLeft,  int? edgeBandRight,  List<OptimizationPieceProcess> pieceProcesses,  Part? part)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Piece2() when $default != null:
return $default(_that.id,_that.pieceCode,_that.serialNo,_that.width,_that.height,_that.thickness,_that.isDeleted,_that.createdAt,_that.updatedAt,_that.partId,_that.barcode,_that.qrCode,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.pieceProcesses,_that.part);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pieceCode,  String? serialNo,  int width,  int height,  int thickness,  bool isDeleted,  DateTime createdAt,  DateTime updatedAt,  String partId,  String? barcode,  String? qrCode,  int? edgeBandTop,  int? edgeBandBottom,  int? edgeBandLeft,  int? edgeBandRight,  List<OptimizationPieceProcess> pieceProcesses,  Part? part)  $default,) {final _that = this;
switch (_that) {
case _Piece2():
return $default(_that.id,_that.pieceCode,_that.serialNo,_that.width,_that.height,_that.thickness,_that.isDeleted,_that.createdAt,_that.updatedAt,_that.partId,_that.barcode,_that.qrCode,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.pieceProcesses,_that.part);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pieceCode,  String? serialNo,  int width,  int height,  int thickness,  bool isDeleted,  DateTime createdAt,  DateTime updatedAt,  String partId,  String? barcode,  String? qrCode,  int? edgeBandTop,  int? edgeBandBottom,  int? edgeBandLeft,  int? edgeBandRight,  List<OptimizationPieceProcess> pieceProcesses,  Part? part)?  $default,) {final _that = this;
switch (_that) {
case _Piece2() when $default != null:
return $default(_that.id,_that.pieceCode,_that.serialNo,_that.width,_that.height,_that.thickness,_that.isDeleted,_that.createdAt,_that.updatedAt,_that.partId,_that.barcode,_that.qrCode,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.pieceProcesses,_that.part);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Piece2 implements Piece2 {
  const _Piece2({required this.id, required this.pieceCode, this.serialNo, required this.width, required this.height, required this.thickness, required this.isDeleted, required this.createdAt, required this.updatedAt, required this.partId, this.barcode, this.qrCode, this.edgeBandTop, this.edgeBandBottom, this.edgeBandLeft, this.edgeBandRight,  List<OptimizationPieceProcess> pieceProcesses = const [], this.part}): _pieceProcesses = pieceProcesses;
  factory _Piece2.fromJson(Map<String, dynamic> json) => _$Piece2FromJson(json);

@override final  String id;
@override final  String pieceCode;
@override final  String? serialNo;
@override final  int width;
@override final  int height;
@override final  int thickness;
@override final  bool isDeleted;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String partId;
@override final  String? barcode;
@override final  String? qrCode;
@override final  int? edgeBandTop;
@override final  int? edgeBandBottom;
@override final  int? edgeBandLeft;
@override final  int? edgeBandRight;
 final  List<OptimizationPieceProcess> _pieceProcesses;
@override@JsonKey() List<OptimizationPieceProcess> get pieceProcesses {
  if (_pieceProcesses is EqualUnmodifiableListView) return _pieceProcesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pieceProcesses);
}

@override final  Part? part;

/// Create a copy of Piece2
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Piece2CopyWith<_Piece2> get copyWith => __$Piece2CopyWithImpl<_Piece2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Piece2ToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Piece2&&(identical(other.id, id) || other.id == id)&&(identical(other.pieceCode, pieceCode) || other.pieceCode == pieceCode)&&(identical(other.serialNo, serialNo) || other.serialNo == serialNo)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.partId, partId) || other.partId == partId)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.edgeBandTop, edgeBandTop) || other.edgeBandTop == edgeBandTop)&&(identical(other.edgeBandBottom, edgeBandBottom) || other.edgeBandBottom == edgeBandBottom)&&(identical(other.edgeBandLeft, edgeBandLeft) || other.edgeBandLeft == edgeBandLeft)&&(identical(other.edgeBandRight, edgeBandRight) || other.edgeBandRight == edgeBandRight)&&const DeepCollectionEquality().equals(other.pieceProcesses, _pieceProcesses)&&(identical(other.part, part) || other.part == part));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,pieceCode,serialNo,width,height,thickness,isDeleted,createdAt,updatedAt,partId,barcode,qrCode,edgeBandTop,edgeBandBottom,edgeBandLeft,edgeBandRight,const DeepCollectionEquality().hash(_pieceProcesses),part);
}

@override
String toString() {
    return 'Piece2(id: $id, pieceCode: $pieceCode, serialNo: $serialNo, width: $width, height: $height, thickness: $thickness, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, partId: $partId, barcode: $barcode, qrCode: $qrCode, edgeBandTop: $edgeBandTop, edgeBandBottom: $edgeBandBottom, edgeBandLeft: $edgeBandLeft, edgeBandRight: $edgeBandRight, pieceProcesses: $pieceProcesses, part: $part)';
}


}

/// @nodoc
abstract mixin class _$Piece2CopyWith<$Res> implements $Piece2CopyWith<$Res> {
  factory _$Piece2CopyWith(_Piece2 value, $Res Function(_Piece2) _then) = __$Piece2CopyWithImpl;
@override @useResult
$Res call({
 String id, String pieceCode, String? serialNo, int width, int height, int thickness, bool isDeleted, DateTime createdAt, DateTime updatedAt, String partId, String? barcode, String? qrCode, int? edgeBandTop, int? edgeBandBottom, int? edgeBandLeft, int? edgeBandRight, List<OptimizationPieceProcess> pieceProcesses, Part? part
});


@override $PartCopyWith<$Res>? get part;

}
/// @nodoc
class __$Piece2CopyWithImpl<$Res>
    implements _$Piece2CopyWith<$Res> {
  __$Piece2CopyWithImpl(this._self, this._then);

  final _Piece2 _self;
  final $Res Function(_Piece2) _then;

/// Create a copy of Piece2
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pieceCode = null,Object? serialNo = freezed,Object? width = null,Object? height = null,Object? thickness = null,Object? isDeleted = null,Object? createdAt = null,Object? updatedAt = null,Object? partId = null,Object? barcode = freezed,Object? qrCode = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? pieceProcesses = null,Object? part = freezed,}) {
  return _then(_Piece2(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,serialNo: freezed == serialNo ? _self.serialNo : serialNo // ignore: cast_nullable_to_non_nullable
as String?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,partId: null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as int?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as int?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as int?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as int?,pieceProcesses: null == pieceProcesses ? _self._pieceProcesses : pieceProcesses // ignore: cast_nullable_to_non_nullable
as List<OptimizationPieceProcess>,part: freezed == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as Part?,
  ));
}

/// Create a copy of Piece2
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartCopyWith<$Res>? get part {
    if (_self.part == null) {
    return null;
  }

  return $PartCopyWith<$Res>(_self.part!, (value) {
    return _then(_self.copyWith(part: value));
  });
}
}


/// @nodoc
mixin _$OptimizationPieceProcess {

 String get processTypeId; ProcessStatus get status;
/// Create a copy of OptimizationPieceProcess
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationPieceProcessCopyWith<OptimizationPieceProcess> get copyWith => _$OptimizationPieceProcessCopyWithImpl<OptimizationPieceProcess>(this as OptimizationPieceProcess, _$identity);

  /// Serializes this OptimizationPieceProcess to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptimizationPieceProcess;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptimizationPieceProcess&&(identical(other.processTypeId, _this.processTypeId) || other.processTypeId == _this.processTypeId)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptimizationPieceProcess;
  return Object.hash(runtimeType,_this.processTypeId,_this.status);
}

@override
String toString() {
  final _this = this as OptimizationPieceProcess;
  return 'OptimizationPieceProcess(processTypeId: ${_this.processTypeId}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $OptimizationPieceProcessCopyWith<$Res>  {
  factory $OptimizationPieceProcessCopyWith(OptimizationPieceProcess value, $Res Function(OptimizationPieceProcess) _then) = _$OptimizationPieceProcessCopyWithImpl;
@useResult
$Res call({
 String processTypeId, ProcessStatus status
});




}
/// @nodoc
class _$OptimizationPieceProcessCopyWithImpl<$Res>
    implements $OptimizationPieceProcessCopyWith<$Res> {
  _$OptimizationPieceProcessCopyWithImpl(this._self, this._then);

  final OptimizationPieceProcess _self;
  final $Res Function(OptimizationPieceProcess) _then;

/// Create a copy of OptimizationPieceProcess
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? processTypeId = null,Object? status = null,}) {
  return _then(OptimizationPieceProcess(
processTypeId: null == processTypeId ? _self.processTypeId : processTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProcessStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [OptimizationPieceProcess].
extension OptimizationPieceProcessPatterns on OptimizationPieceProcess {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptimizationPieceProcess value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptimizationPieceProcess() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptimizationPieceProcess value)  $default,){
final _that = this;
switch (_that) {
case _OptimizationPieceProcess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptimizationPieceProcess value)?  $default,){
final _that = this;
switch (_that) {
case _OptimizationPieceProcess() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String processTypeId,  ProcessStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptimizationPieceProcess() when $default != null:
return $default(_that.processTypeId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String processTypeId,  ProcessStatus status)  $default,) {final _that = this;
switch (_that) {
case _OptimizationPieceProcess():
return $default(_that.processTypeId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String processTypeId,  ProcessStatus status)?  $default,) {final _that = this;
switch (_that) {
case _OptimizationPieceProcess() when $default != null:
return $default(_that.processTypeId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptimizationPieceProcess implements OptimizationPieceProcess {
  const _OptimizationPieceProcess({required this.processTypeId, required this.status});
  factory _OptimizationPieceProcess.fromJson(Map<String, dynamic> json) => _$OptimizationPieceProcessFromJson(json);

@override final  String processTypeId;
@override final  ProcessStatus status;

/// Create a copy of OptimizationPieceProcess
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationPieceProcessCopyWith<_OptimizationPieceProcess> get copyWith => __$OptimizationPieceProcessCopyWithImpl<_OptimizationPieceProcess>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationPieceProcessToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptimizationPieceProcess&&(identical(other.processTypeId, processTypeId) || other.processTypeId == processTypeId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,processTypeId,status);
}

@override
String toString() {
    return 'OptimizationPieceProcess(processTypeId: $processTypeId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OptimizationPieceProcessCopyWith<$Res> implements $OptimizationPieceProcessCopyWith<$Res> {
  factory _$OptimizationPieceProcessCopyWith(_OptimizationPieceProcess value, $Res Function(_OptimizationPieceProcess) _then) = __$OptimizationPieceProcessCopyWithImpl;
@override @useResult
$Res call({
 String processTypeId, ProcessStatus status
});




}
/// @nodoc
class __$OptimizationPieceProcessCopyWithImpl<$Res>
    implements _$OptimizationPieceProcessCopyWith<$Res> {
  __$OptimizationPieceProcessCopyWithImpl(this._self, this._then);

  final _OptimizationPieceProcess _self;
  final $Res Function(_OptimizationPieceProcess) _then;

/// Create a copy of OptimizationPieceProcess
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? processTypeId = null,Object? status = null,}) {
  return _then(_OptimizationPieceProcess(
processTypeId: null == processTypeId ? _self.processTypeId : processTypeId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProcessStatus,
  ));
}


}


/// @nodoc
mixin _$OptimizationProcessType {

 String get id; String get name; int get sequenceOrder; bool get isActive;
/// Create a copy of OptimizationProcessType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationProcessTypeCopyWith<OptimizationProcessType> get copyWith => _$OptimizationProcessTypeCopyWithImpl<OptimizationProcessType>(this as OptimizationProcessType, _$identity);

  /// Serializes this OptimizationProcessType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptimizationProcessType;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptimizationProcessType&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sequenceOrder, _this.sequenceOrder) || other.sequenceOrder == _this.sequenceOrder)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptimizationProcessType;
  return Object.hash(runtimeType,_this.id,_this.name,_this.sequenceOrder,_this.isActive);
}

@override
String toString() {
  final _this = this as OptimizationProcessType;
  return 'OptimizationProcessType(id: ${_this.id}, name: ${_this.name}, sequenceOrder: ${_this.sequenceOrder}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $OptimizationProcessTypeCopyWith<$Res>  {
  factory $OptimizationProcessTypeCopyWith(OptimizationProcessType value, $Res Function(OptimizationProcessType) _then) = _$OptimizationProcessTypeCopyWithImpl;
@useResult
$Res call({
 String id, String name, int sequenceOrder, bool isActive
});




}
/// @nodoc
class _$OptimizationProcessTypeCopyWithImpl<$Res>
    implements $OptimizationProcessTypeCopyWith<$Res> {
  _$OptimizationProcessTypeCopyWithImpl(this._self, this._then);

  final OptimizationProcessType _self;
  final $Res Function(OptimizationProcessType) _then;

/// Create a copy of OptimizationProcessType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sequenceOrder = null,Object? isActive = null,}) {
  return _then(OptimizationProcessType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OptimizationProcessType].
extension OptimizationProcessTypePatterns on OptimizationProcessType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptimizationProcessType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptimizationProcessType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptimizationProcessType value)  $default,){
final _that = this;
switch (_that) {
case _OptimizationProcessType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptimizationProcessType value)?  $default,){
final _that = this;
switch (_that) {
case _OptimizationProcessType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int sequenceOrder,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptimizationProcessType() when $default != null:
return $default(_that.id,_that.name,_that.sequenceOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int sequenceOrder,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _OptimizationProcessType():
return $default(_that.id,_that.name,_that.sequenceOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int sequenceOrder,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _OptimizationProcessType() when $default != null:
return $default(_that.id,_that.name,_that.sequenceOrder,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptimizationProcessType implements OptimizationProcessType {
  const _OptimizationProcessType({required this.id, required this.name, required this.sequenceOrder, this.isActive = true});
  factory _OptimizationProcessType.fromJson(Map<String, dynamic> json) => _$OptimizationProcessTypeFromJson(json);

@override final  String id;
@override final  String name;
@override final  int sequenceOrder;
@override@JsonKey() final  bool isActive;

/// Create a copy of OptimizationProcessType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationProcessTypeCopyWith<_OptimizationProcessType> get copyWith => __$OptimizationProcessTypeCopyWithImpl<_OptimizationProcessType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationProcessTypeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptimizationProcessType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,sequenceOrder,isActive);
}

@override
String toString() {
    return 'OptimizationProcessType(id: $id, name: $name, sequenceOrder: $sequenceOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$OptimizationProcessTypeCopyWith<$Res> implements $OptimizationProcessTypeCopyWith<$Res> {
  factory _$OptimizationProcessTypeCopyWith(_OptimizationProcessType value, $Res Function(_OptimizationProcessType) _then) = __$OptimizationProcessTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int sequenceOrder, bool isActive
});




}
/// @nodoc
class __$OptimizationProcessTypeCopyWithImpl<$Res>
    implements _$OptimizationProcessTypeCopyWith<$Res> {
  __$OptimizationProcessTypeCopyWithImpl(this._self, this._then);

  final _OptimizationProcessType _self;
  final $Res Function(_OptimizationProcessType) _then;

/// Create a copy of OptimizationProcessType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sequenceOrder = null,Object? isActive = null,}) {
  return _then(_OptimizationProcessType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$OptimizationPiece {

 String get id; String get materialGroupId; String get pieceId; Piece2 get piece;
/// Create a copy of OptimizationPiece
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationPieceCopyWith<OptimizationPiece> get copyWith => _$OptimizationPieceCopyWithImpl<OptimizationPiece>(this as OptimizationPiece, _$identity);

  /// Serializes this OptimizationPiece to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptimizationPiece;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptimizationPiece&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.materialGroupId, _this.materialGroupId) || other.materialGroupId == _this.materialGroupId)&&(identical(other.pieceId, _this.pieceId) || other.pieceId == _this.pieceId)&&(identical(other.piece, _this.piece) || other.piece == _this.piece));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptimizationPiece;
  return Object.hash(runtimeType,_this.id,_this.materialGroupId,_this.pieceId,_this.piece);
}

@override
String toString() {
  final _this = this as OptimizationPiece;
  return 'OptimizationPiece(id: ${_this.id}, materialGroupId: ${_this.materialGroupId}, pieceId: ${_this.pieceId}, piece: ${_this.piece})';
}


}

/// @nodoc
abstract mixin class $OptimizationPieceCopyWith<$Res>  {
  factory $OptimizationPieceCopyWith(OptimizationPiece value, $Res Function(OptimizationPiece) _then) = _$OptimizationPieceCopyWithImpl;
@useResult
$Res call({
 String id, String materialGroupId, String pieceId, Piece2 piece
});


$Piece2CopyWith<$Res> get piece;

}
/// @nodoc
class _$OptimizationPieceCopyWithImpl<$Res>
    implements $OptimizationPieceCopyWith<$Res> {
  _$OptimizationPieceCopyWithImpl(this._self, this._then);

  final OptimizationPiece _self;
  final $Res Function(OptimizationPiece) _then;

/// Create a copy of OptimizationPiece
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? materialGroupId = null,Object? pieceId = null,Object? piece = null,}) {
  return _then(OptimizationPiece(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialGroupId: null == materialGroupId ? _self.materialGroupId : materialGroupId // ignore: cast_nullable_to_non_nullable
as String,pieceId: null == pieceId ? _self.pieceId : pieceId // ignore: cast_nullable_to_non_nullable
as String,piece: null == piece ? _self.piece : piece // ignore: cast_nullable_to_non_nullable
as Piece2,
  ));
}
/// Create a copy of OptimizationPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Piece2CopyWith<$Res> get piece {
  
  return $Piece2CopyWith<$Res>(_self.piece, (value) {
    return _then(_self.copyWith(piece: value));
  });
}
}


/// Adds pattern-matching-related methods to [OptimizationPiece].
extension OptimizationPiecePatterns on OptimizationPiece {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptimizationPiece value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptimizationPiece() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptimizationPiece value)  $default,){
final _that = this;
switch (_that) {
case _OptimizationPiece():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptimizationPiece value)?  $default,){
final _that = this;
switch (_that) {
case _OptimizationPiece() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String materialGroupId,  String pieceId,  Piece2 piece)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptimizationPiece() when $default != null:
return $default(_that.id,_that.materialGroupId,_that.pieceId,_that.piece);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String materialGroupId,  String pieceId,  Piece2 piece)  $default,) {final _that = this;
switch (_that) {
case _OptimizationPiece():
return $default(_that.id,_that.materialGroupId,_that.pieceId,_that.piece);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String materialGroupId,  String pieceId,  Piece2 piece)?  $default,) {final _that = this;
switch (_that) {
case _OptimizationPiece() when $default != null:
return $default(_that.id,_that.materialGroupId,_that.pieceId,_that.piece);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptimizationPiece implements OptimizationPiece {
  const _OptimizationPiece({required this.id, required this.materialGroupId, required this.pieceId, required this.piece});
  factory _OptimizationPiece.fromJson(Map<String, dynamic> json) => _$OptimizationPieceFromJson(json);

@override final  String id;
@override final  String materialGroupId;
@override final  String pieceId;
@override final  Piece2 piece;

/// Create a copy of OptimizationPiece
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationPieceCopyWith<_OptimizationPiece> get copyWith => __$OptimizationPieceCopyWithImpl<_OptimizationPiece>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationPieceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptimizationPiece&&(identical(other.id, id) || other.id == id)&&(identical(other.materialGroupId, materialGroupId) || other.materialGroupId == materialGroupId)&&(identical(other.pieceId, pieceId) || other.pieceId == pieceId)&&(identical(other.piece, piece) || other.piece == piece));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,materialGroupId,pieceId,piece);
}

@override
String toString() {
    return 'OptimizationPiece(id: $id, materialGroupId: $materialGroupId, pieceId: $pieceId, piece: $piece)';
}


}

/// @nodoc
abstract mixin class _$OptimizationPieceCopyWith<$Res> implements $OptimizationPieceCopyWith<$Res> {
  factory _$OptimizationPieceCopyWith(_OptimizationPiece value, $Res Function(_OptimizationPiece) _then) = __$OptimizationPieceCopyWithImpl;
@override @useResult
$Res call({
 String id, String materialGroupId, String pieceId, Piece2 piece
});


@override $Piece2CopyWith<$Res> get piece;

}
/// @nodoc
class __$OptimizationPieceCopyWithImpl<$Res>
    implements _$OptimizationPieceCopyWith<$Res> {
  __$OptimizationPieceCopyWithImpl(this._self, this._then);

  final _OptimizationPiece _self;
  final $Res Function(_OptimizationPiece) _then;

/// Create a copy of OptimizationPiece
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? materialGroupId = null,Object? pieceId = null,Object? piece = null,}) {
  return _then(_OptimizationPiece(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,materialGroupId: null == materialGroupId ? _self.materialGroupId : materialGroupId // ignore: cast_nullable_to_non_nullable
as String,pieceId: null == pieceId ? _self.pieceId : pieceId // ignore: cast_nullable_to_non_nullable
as String,piece: null == piece ? _self.piece : piece // ignore: cast_nullable_to_non_nullable
as Piece2,
  ));
}

/// Create a copy of OptimizationPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Piece2CopyWith<$Res> get piece {
  
  return $Piece2CopyWith<$Res>(_self.piece, (value) {
    return _then(_self.copyWith(piece: value));
  });
}
}


/// @nodoc
mixin _$LayoutItem {

 String get id; String get optimizationSheetId; String get optimizationPieceId; double get x; double get y; double get width; double get height; bool get rotated; DateTime get createdAt; OptimizationPiece get optimizationPiece;
/// Create a copy of LayoutItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LayoutItemCopyWith<LayoutItem> get copyWith => _$LayoutItemCopyWithImpl<LayoutItem>(this as LayoutItem, _$identity);

  /// Serializes this LayoutItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LayoutItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LayoutItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.optimizationSheetId, _this.optimizationSheetId) || other.optimizationSheetId == _this.optimizationSheetId)&&(identical(other.optimizationPieceId, _this.optimizationPieceId) || other.optimizationPieceId == _this.optimizationPieceId)&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.rotated, _this.rotated) || other.rotated == _this.rotated)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.optimizationPiece, _this.optimizationPiece) || other.optimizationPiece == _this.optimizationPiece));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LayoutItem;
  return Object.hash(runtimeType,_this.id,_this.optimizationSheetId,_this.optimizationPieceId,_this.x,_this.y,_this.width,_this.height,_this.rotated,_this.createdAt,_this.optimizationPiece);
}

@override
String toString() {
  final _this = this as LayoutItem;
  return 'LayoutItem(id: ${_this.id}, optimizationSheetId: ${_this.optimizationSheetId}, optimizationPieceId: ${_this.optimizationPieceId}, x: ${_this.x}, y: ${_this.y}, width: ${_this.width}, height: ${_this.height}, rotated: ${_this.rotated}, createdAt: ${_this.createdAt}, optimizationPiece: ${_this.optimizationPiece})';
}


}

/// @nodoc
abstract mixin class $LayoutItemCopyWith<$Res>  {
  factory $LayoutItemCopyWith(LayoutItem value, $Res Function(LayoutItem) _then) = _$LayoutItemCopyWithImpl;
@useResult
$Res call({
 String id, String optimizationSheetId, String optimizationPieceId, double x, double y, double width, double height, bool rotated, DateTime createdAt, OptimizationPiece optimizationPiece
});


$OptimizationPieceCopyWith<$Res> get optimizationPiece;

}
/// @nodoc
class _$LayoutItemCopyWithImpl<$Res>
    implements $LayoutItemCopyWith<$Res> {
  _$LayoutItemCopyWithImpl(this._self, this._then);

  final LayoutItem _self;
  final $Res Function(LayoutItem) _then;

/// Create a copy of LayoutItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? optimizationSheetId = null,Object? optimizationPieceId = null,Object? x = null,Object? y = null,Object? width = null,Object? height = null,Object? rotated = null,Object? createdAt = null,Object? optimizationPiece = null,}) {
  return _then(LayoutItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationSheetId: null == optimizationSheetId ? _self.optimizationSheetId : optimizationSheetId // ignore: cast_nullable_to_non_nullable
as String,optimizationPieceId: null == optimizationPieceId ? _self.optimizationPieceId : optimizationPieceId // ignore: cast_nullable_to_non_nullable
as String,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,rotated: null == rotated ? _self.rotated : rotated // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,optimizationPiece: null == optimizationPiece ? _self.optimizationPiece : optimizationPiece // ignore: cast_nullable_to_non_nullable
as OptimizationPiece,
  ));
}
/// Create a copy of LayoutItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptimizationPieceCopyWith<$Res> get optimizationPiece {
  
  return $OptimizationPieceCopyWith<$Res>(_self.optimizationPiece, (value) {
    return _then(_self.copyWith(optimizationPiece: value));
  });
}
}


/// Adds pattern-matching-related methods to [LayoutItem].
extension LayoutItemPatterns on LayoutItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LayoutItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LayoutItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LayoutItem value)  $default,){
final _that = this;
switch (_that) {
case _LayoutItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LayoutItem value)?  $default,){
final _that = this;
switch (_that) {
case _LayoutItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String optimizationSheetId,  String optimizationPieceId,  double x,  double y,  double width,  double height,  bool rotated,  DateTime createdAt,  OptimizationPiece optimizationPiece)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LayoutItem() when $default != null:
return $default(_that.id,_that.optimizationSheetId,_that.optimizationPieceId,_that.x,_that.y,_that.width,_that.height,_that.rotated,_that.createdAt,_that.optimizationPiece);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String optimizationSheetId,  String optimizationPieceId,  double x,  double y,  double width,  double height,  bool rotated,  DateTime createdAt,  OptimizationPiece optimizationPiece)  $default,) {final _that = this;
switch (_that) {
case _LayoutItem():
return $default(_that.id,_that.optimizationSheetId,_that.optimizationPieceId,_that.x,_that.y,_that.width,_that.height,_that.rotated,_that.createdAt,_that.optimizationPiece);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String optimizationSheetId,  String optimizationPieceId,  double x,  double y,  double width,  double height,  bool rotated,  DateTime createdAt,  OptimizationPiece optimizationPiece)?  $default,) {final _that = this;
switch (_that) {
case _LayoutItem() when $default != null:
return $default(_that.id,_that.optimizationSheetId,_that.optimizationPieceId,_that.x,_that.y,_that.width,_that.height,_that.rotated,_that.createdAt,_that.optimizationPiece);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LayoutItem implements LayoutItem {
  const _LayoutItem({required this.id, required this.optimizationSheetId, required this.optimizationPieceId, required this.x, required this.y, required this.width, required this.height, required this.rotated, required this.createdAt, required this.optimizationPiece});
  factory _LayoutItem.fromJson(Map<String, dynamic> json) => _$LayoutItemFromJson(json);

@override final  String id;
@override final  String optimizationSheetId;
@override final  String optimizationPieceId;
@override final  double x;
@override final  double y;
@override final  double width;
@override final  double height;
@override final  bool rotated;
@override final  DateTime createdAt;
@override final  OptimizationPiece optimizationPiece;

/// Create a copy of LayoutItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LayoutItemCopyWith<_LayoutItem> get copyWith => __$LayoutItemCopyWithImpl<_LayoutItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LayoutItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LayoutItem&&(identical(other.id, id) || other.id == id)&&(identical(other.optimizationSheetId, optimizationSheetId) || other.optimizationSheetId == optimizationSheetId)&&(identical(other.optimizationPieceId, optimizationPieceId) || other.optimizationPieceId == optimizationPieceId)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.rotated, rotated) || other.rotated == rotated)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.optimizationPiece, optimizationPiece) || other.optimizationPiece == optimizationPiece));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,optimizationSheetId,optimizationPieceId,x,y,width,height,rotated,createdAt,optimizationPiece);
}

@override
String toString() {
    return 'LayoutItem(id: $id, optimizationSheetId: $optimizationSheetId, optimizationPieceId: $optimizationPieceId, x: $x, y: $y, width: $width, height: $height, rotated: $rotated, createdAt: $createdAt, optimizationPiece: $optimizationPiece)';
}


}

/// @nodoc
abstract mixin class _$LayoutItemCopyWith<$Res> implements $LayoutItemCopyWith<$Res> {
  factory _$LayoutItemCopyWith(_LayoutItem value, $Res Function(_LayoutItem) _then) = __$LayoutItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String optimizationSheetId, String optimizationPieceId, double x, double y, double width, double height, bool rotated, DateTime createdAt, OptimizationPiece optimizationPiece
});


@override $OptimizationPieceCopyWith<$Res> get optimizationPiece;

}
/// @nodoc
class __$LayoutItemCopyWithImpl<$Res>
    implements _$LayoutItemCopyWith<$Res> {
  __$LayoutItemCopyWithImpl(this._self, this._then);

  final _LayoutItem _self;
  final $Res Function(_LayoutItem) _then;

/// Create a copy of LayoutItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? optimizationSheetId = null,Object? optimizationPieceId = null,Object? x = null,Object? y = null,Object? width = null,Object? height = null,Object? rotated = null,Object? createdAt = null,Object? optimizationPiece = null,}) {
  return _then(_LayoutItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,optimizationSheetId: null == optimizationSheetId ? _self.optimizationSheetId : optimizationSheetId // ignore: cast_nullable_to_non_nullable
as String,optimizationPieceId: null == optimizationPieceId ? _self.optimizationPieceId : optimizationPieceId // ignore: cast_nullable_to_non_nullable
as String,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,rotated: null == rotated ? _self.rotated : rotated // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,optimizationPiece: null == optimizationPiece ? _self.optimizationPiece : optimizationPiece // ignore: cast_nullable_to_non_nullable
as OptimizationPiece,
  ));
}

/// Create a copy of LayoutItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OptimizationPieceCopyWith<$Res> get optimizationPiece {
  
  return $OptimizationPieceCopyWith<$Res>(_self.optimizationPiece, (value) {
    return _then(_self.copyWith(optimizationPiece: value));
  });
}
}


/// @nodoc
mixin _$OptimizationSheetModel {

 String get id; String get layoutId; String? get sheetId; int get sheetNo; double get width; double get height; PhysicalSheetOrientation? get sheet; double? get utilizationPercent; double? get wasteArea; DateTime get createdAt; DateTime get updatedAt; List<LayoutItem> get layoutItems; List<RemainingArea> get remainingAreas;
/// Create a copy of OptimizationSheetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationSheetModelCopyWith<OptimizationSheetModel> get copyWith => _$OptimizationSheetModelCopyWithImpl<OptimizationSheetModel>(this as OptimizationSheetModel, _$identity);

  /// Serializes this OptimizationSheetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptimizationSheetModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptimizationSheetModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.layoutId, _this.layoutId) || other.layoutId == _this.layoutId)&&(identical(other.sheetId, _this.sheetId) || other.sheetId == _this.sheetId)&&(identical(other.sheetNo, _this.sheetNo) || other.sheetNo == _this.sheetNo)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.sheet, _this.sheet) || other.sheet == _this.sheet)&&(identical(other.utilizationPercent, _this.utilizationPercent) || other.utilizationPercent == _this.utilizationPercent)&&(identical(other.wasteArea, _this.wasteArea) || other.wasteArea == _this.wasteArea)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.layoutItems, _this.layoutItems)&&const DeepCollectionEquality().equals(other.remainingAreas, _this.remainingAreas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptimizationSheetModel;
  return Object.hash(runtimeType,_this.id,_this.layoutId,_this.sheetId,_this.sheetNo,_this.width,_this.height,_this.sheet,_this.utilizationPercent,_this.wasteArea,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.layoutItems),const DeepCollectionEquality().hash(_this.remainingAreas));
}

@override
String toString() {
  final _this = this as OptimizationSheetModel;
  return 'OptimizationSheetModel(id: ${_this.id}, layoutId: ${_this.layoutId}, sheetId: ${_this.sheetId}, sheetNo: ${_this.sheetNo}, width: ${_this.width}, height: ${_this.height}, sheet: ${_this.sheet}, utilizationPercent: ${_this.utilizationPercent}, wasteArea: ${_this.wasteArea}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, layoutItems: ${_this.layoutItems}, remainingAreas: ${_this.remainingAreas})';
}


}

/// @nodoc
abstract mixin class $OptimizationSheetModelCopyWith<$Res>  {
  factory $OptimizationSheetModelCopyWith(OptimizationSheetModel value, $Res Function(OptimizationSheetModel) _then) = _$OptimizationSheetModelCopyWithImpl;
@useResult
$Res call({
 String id, String layoutId, String? sheetId, int sheetNo, double width, double height, PhysicalSheetOrientation? sheet, double? utilizationPercent, double? wasteArea, DateTime createdAt, DateTime updatedAt, List<LayoutItem> layoutItems, List<RemainingArea> remainingAreas
});


$PhysicalSheetOrientationCopyWith<$Res>? get sheet;

}
/// @nodoc
class _$OptimizationSheetModelCopyWithImpl<$Res>
    implements $OptimizationSheetModelCopyWith<$Res> {
  _$OptimizationSheetModelCopyWithImpl(this._self, this._then);

  final OptimizationSheetModel _self;
  final $Res Function(OptimizationSheetModel) _then;

/// Create a copy of OptimizationSheetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? layoutId = null,Object? sheetId = freezed,Object? sheetNo = null,Object? width = null,Object? height = null,Object? sheet = freezed,Object? utilizationPercent = freezed,Object? wasteArea = freezed,Object? createdAt = null,Object? updatedAt = null,Object? layoutItems = null,Object? remainingAreas = null,}) {
  return _then(OptimizationSheetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,layoutId: null == layoutId ? _self.layoutId : layoutId // ignore: cast_nullable_to_non_nullable
as String,sheetId: freezed == sheetId ? _self.sheetId : sheetId // ignore: cast_nullable_to_non_nullable
as String?,sheetNo: null == sheetNo ? _self.sheetNo : sheetNo // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,sheet: freezed == sheet ? _self.sheet : sheet // ignore: cast_nullable_to_non_nullable
as PhysicalSheetOrientation?,utilizationPercent: freezed == utilizationPercent ? _self.utilizationPercent : utilizationPercent // ignore: cast_nullable_to_non_nullable
as double?,wasteArea: freezed == wasteArea ? _self.wasteArea : wasteArea // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,layoutItems: null == layoutItems ? _self.layoutItems : layoutItems // ignore: cast_nullable_to_non_nullable
as List<LayoutItem>,remainingAreas: null == remainingAreas ? _self.remainingAreas : remainingAreas // ignore: cast_nullable_to_non_nullable
as List<RemainingArea>,
  ));
}
/// Create a copy of OptimizationSheetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhysicalSheetOrientationCopyWith<$Res>? get sheet {
    if (_self.sheet == null) {
    return null;
  }

  return $PhysicalSheetOrientationCopyWith<$Res>(_self.sheet!, (value) {
    return _then(_self.copyWith(sheet: value));
  });
}
}


/// Adds pattern-matching-related methods to [OptimizationSheetModel].
extension OptimizationSheetModelPatterns on OptimizationSheetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptimizationSheetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptimizationSheetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptimizationSheetModel value)  $default,){
final _that = this;
switch (_that) {
case _OptimizationSheetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptimizationSheetModel value)?  $default,){
final _that = this;
switch (_that) {
case _OptimizationSheetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String layoutId,  String? sheetId,  int sheetNo,  double width,  double height,  PhysicalSheetOrientation? sheet,  double? utilizationPercent,  double? wasteArea,  DateTime createdAt,  DateTime updatedAt,  List<LayoutItem> layoutItems,  List<RemainingArea> remainingAreas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptimizationSheetModel() when $default != null:
return $default(_that.id,_that.layoutId,_that.sheetId,_that.sheetNo,_that.width,_that.height,_that.sheet,_that.utilizationPercent,_that.wasteArea,_that.createdAt,_that.updatedAt,_that.layoutItems,_that.remainingAreas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String layoutId,  String? sheetId,  int sheetNo,  double width,  double height,  PhysicalSheetOrientation? sheet,  double? utilizationPercent,  double? wasteArea,  DateTime createdAt,  DateTime updatedAt,  List<LayoutItem> layoutItems,  List<RemainingArea> remainingAreas)  $default,) {final _that = this;
switch (_that) {
case _OptimizationSheetModel():
return $default(_that.id,_that.layoutId,_that.sheetId,_that.sheetNo,_that.width,_that.height,_that.sheet,_that.utilizationPercent,_that.wasteArea,_that.createdAt,_that.updatedAt,_that.layoutItems,_that.remainingAreas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String layoutId,  String? sheetId,  int sheetNo,  double width,  double height,  PhysicalSheetOrientation? sheet,  double? utilizationPercent,  double? wasteArea,  DateTime createdAt,  DateTime updatedAt,  List<LayoutItem> layoutItems,  List<RemainingArea> remainingAreas)?  $default,) {final _that = this;
switch (_that) {
case _OptimizationSheetModel() when $default != null:
return $default(_that.id,_that.layoutId,_that.sheetId,_that.sheetNo,_that.width,_that.height,_that.sheet,_that.utilizationPercent,_that.wasteArea,_that.createdAt,_that.updatedAt,_that.layoutItems,_that.remainingAreas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptimizationSheetModel implements OptimizationSheetModel {
  const _OptimizationSheetModel({required this.id, required this.layoutId, this.sheetId, required this.sheetNo, required this.width, required this.height, this.sheet, this.utilizationPercent, this.wasteArea, required this.createdAt, required this.updatedAt, required  List<LayoutItem> layoutItems,  List<RemainingArea> remainingAreas = const []}): _layoutItems = layoutItems,_remainingAreas = remainingAreas;
  factory _OptimizationSheetModel.fromJson(Map<String, dynamic> json) => _$OptimizationSheetModelFromJson(json);

@override final  String id;
@override final  String layoutId;
@override final  String? sheetId;
@override final  int sheetNo;
@override final  double width;
@override final  double height;
@override final  PhysicalSheetOrientation? sheet;
@override final  double? utilizationPercent;
@override final  double? wasteArea;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<LayoutItem> _layoutItems;
@override List<LayoutItem> get layoutItems {
  if (_layoutItems is EqualUnmodifiableListView) return _layoutItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_layoutItems);
}

 final  List<RemainingArea> _remainingAreas;
@override@JsonKey() List<RemainingArea> get remainingAreas {
  if (_remainingAreas is EqualUnmodifiableListView) return _remainingAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remainingAreas);
}


/// Create a copy of OptimizationSheetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationSheetModelCopyWith<_OptimizationSheetModel> get copyWith => __$OptimizationSheetModelCopyWithImpl<_OptimizationSheetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationSheetModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptimizationSheetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.layoutId, layoutId) || other.layoutId == layoutId)&&(identical(other.sheetId, sheetId) || other.sheetId == sheetId)&&(identical(other.sheetNo, sheetNo) || other.sheetNo == sheetNo)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.sheet, sheet) || other.sheet == sheet)&&(identical(other.utilizationPercent, utilizationPercent) || other.utilizationPercent == utilizationPercent)&&(identical(other.wasteArea, wasteArea) || other.wasteArea == wasteArea)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.layoutItems, _layoutItems)&&const DeepCollectionEquality().equals(other.remainingAreas, _remainingAreas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,layoutId,sheetId,sheetNo,width,height,sheet,utilizationPercent,wasteArea,createdAt,updatedAt,const DeepCollectionEquality().hash(_layoutItems),const DeepCollectionEquality().hash(_remainingAreas));
}

@override
String toString() {
    return 'OptimizationSheetModel(id: $id, layoutId: $layoutId, sheetId: $sheetId, sheetNo: $sheetNo, width: $width, height: $height, sheet: $sheet, utilizationPercent: $utilizationPercent, wasteArea: $wasteArea, createdAt: $createdAt, updatedAt: $updatedAt, layoutItems: $layoutItems, remainingAreas: $remainingAreas)';
}


}

/// @nodoc
abstract mixin class _$OptimizationSheetModelCopyWith<$Res> implements $OptimizationSheetModelCopyWith<$Res> {
  factory _$OptimizationSheetModelCopyWith(_OptimizationSheetModel value, $Res Function(_OptimizationSheetModel) _then) = __$OptimizationSheetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String layoutId, String? sheetId, int sheetNo, double width, double height, PhysicalSheetOrientation? sheet, double? utilizationPercent, double? wasteArea, DateTime createdAt, DateTime updatedAt, List<LayoutItem> layoutItems, List<RemainingArea> remainingAreas
});


@override $PhysicalSheetOrientationCopyWith<$Res>? get sheet;

}
/// @nodoc
class __$OptimizationSheetModelCopyWithImpl<$Res>
    implements _$OptimizationSheetModelCopyWith<$Res> {
  __$OptimizationSheetModelCopyWithImpl(this._self, this._then);

  final _OptimizationSheetModel _self;
  final $Res Function(_OptimizationSheetModel) _then;

/// Create a copy of OptimizationSheetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? layoutId = null,Object? sheetId = freezed,Object? sheetNo = null,Object? width = null,Object? height = null,Object? sheet = freezed,Object? utilizationPercent = freezed,Object? wasteArea = freezed,Object? createdAt = null,Object? updatedAt = null,Object? layoutItems = null,Object? remainingAreas = null,}) {
  return _then(_OptimizationSheetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,layoutId: null == layoutId ? _self.layoutId : layoutId // ignore: cast_nullable_to_non_nullable
as String,sheetId: freezed == sheetId ? _self.sheetId : sheetId // ignore: cast_nullable_to_non_nullable
as String?,sheetNo: null == sheetNo ? _self.sheetNo : sheetNo // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,sheet: freezed == sheet ? _self.sheet : sheet // ignore: cast_nullable_to_non_nullable
as PhysicalSheetOrientation?,utilizationPercent: freezed == utilizationPercent ? _self.utilizationPercent : utilizationPercent // ignore: cast_nullable_to_non_nullable
as double?,wasteArea: freezed == wasteArea ? _self.wasteArea : wasteArea // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,layoutItems: null == layoutItems ? _self._layoutItems : layoutItems // ignore: cast_nullable_to_non_nullable
as List<LayoutItem>,remainingAreas: null == remainingAreas ? _self._remainingAreas : remainingAreas // ignore: cast_nullable_to_non_nullable
as List<RemainingArea>,
  ));
}

/// Create a copy of OptimizationSheetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhysicalSheetOrientationCopyWith<$Res>? get sheet {
    if (_self.sheet == null) {
    return null;
  }

  return $PhysicalSheetOrientationCopyWith<$Res>(_self.sheet!, (value) {
    return _then(_self.copyWith(sheet: value));
  });
}
}


/// @nodoc
mixin _$PhysicalSheetOrientation {

 String get id; double get width; double get height; GrainDirection get grainDirection;
/// Create a copy of PhysicalSheetOrientation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhysicalSheetOrientationCopyWith<PhysicalSheetOrientation> get copyWith => _$PhysicalSheetOrientationCopyWithImpl<PhysicalSheetOrientation>(this as PhysicalSheetOrientation, _$identity);

  /// Serializes this PhysicalSheetOrientation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhysicalSheetOrientation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhysicalSheetOrientation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.grainDirection, _this.grainDirection) || other.grainDirection == _this.grainDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhysicalSheetOrientation;
  return Object.hash(runtimeType,_this.id,_this.width,_this.height,_this.grainDirection);
}

@override
String toString() {
  final _this = this as PhysicalSheetOrientation;
  return 'PhysicalSheetOrientation(id: ${_this.id}, width: ${_this.width}, height: ${_this.height}, grainDirection: ${_this.grainDirection})';
}


}

/// @nodoc
abstract mixin class $PhysicalSheetOrientationCopyWith<$Res>  {
  factory $PhysicalSheetOrientationCopyWith(PhysicalSheetOrientation value, $Res Function(PhysicalSheetOrientation) _then) = _$PhysicalSheetOrientationCopyWithImpl;
@useResult
$Res call({
 String id, double width, double height, GrainDirection grainDirection
});




}
/// @nodoc
class _$PhysicalSheetOrientationCopyWithImpl<$Res>
    implements $PhysicalSheetOrientationCopyWith<$Res> {
  _$PhysicalSheetOrientationCopyWithImpl(this._self, this._then);

  final PhysicalSheetOrientation _self;
  final $Res Function(PhysicalSheetOrientation) _then;

/// Create a copy of PhysicalSheetOrientation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? width = null,Object? height = null,Object? grainDirection = null,}) {
  return _then(PhysicalSheetOrientation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,
  ));
}

}


/// Adds pattern-matching-related methods to [PhysicalSheetOrientation].
extension PhysicalSheetOrientationPatterns on PhysicalSheetOrientation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhysicalSheetOrientation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhysicalSheetOrientation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhysicalSheetOrientation value)  $default,){
final _that = this;
switch (_that) {
case _PhysicalSheetOrientation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhysicalSheetOrientation value)?  $default,){
final _that = this;
switch (_that) {
case _PhysicalSheetOrientation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double width,  double height,  GrainDirection grainDirection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhysicalSheetOrientation() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.grainDirection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double width,  double height,  GrainDirection grainDirection)  $default,) {final _that = this;
switch (_that) {
case _PhysicalSheetOrientation():
return $default(_that.id,_that.width,_that.height,_that.grainDirection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double width,  double height,  GrainDirection grainDirection)?  $default,) {final _that = this;
switch (_that) {
case _PhysicalSheetOrientation() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.grainDirection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhysicalSheetOrientation implements PhysicalSheetOrientation {
  const _PhysicalSheetOrientation({required this.id, required this.width, required this.height, required this.grainDirection});
  factory _PhysicalSheetOrientation.fromJson(Map<String, dynamic> json) => _$PhysicalSheetOrientationFromJson(json);

@override final  String id;
@override final  double width;
@override final  double height;
@override final  GrainDirection grainDirection;

/// Create a copy of PhysicalSheetOrientation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhysicalSheetOrientationCopyWith<_PhysicalSheetOrientation> get copyWith => __$PhysicalSheetOrientationCopyWithImpl<_PhysicalSheetOrientation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhysicalSheetOrientationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhysicalSheetOrientation&&(identical(other.id, id) || other.id == id)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.grainDirection, grainDirection) || other.grainDirection == grainDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,width,height,grainDirection);
}

@override
String toString() {
    return 'PhysicalSheetOrientation(id: $id, width: $width, height: $height, grainDirection: $grainDirection)';
}


}

/// @nodoc
abstract mixin class _$PhysicalSheetOrientationCopyWith<$Res> implements $PhysicalSheetOrientationCopyWith<$Res> {
  factory _$PhysicalSheetOrientationCopyWith(_PhysicalSheetOrientation value, $Res Function(_PhysicalSheetOrientation) _then) = __$PhysicalSheetOrientationCopyWithImpl;
@override @useResult
$Res call({
 String id, double width, double height, GrainDirection grainDirection
});




}
/// @nodoc
class __$PhysicalSheetOrientationCopyWithImpl<$Res>
    implements _$PhysicalSheetOrientationCopyWith<$Res> {
  __$PhysicalSheetOrientationCopyWithImpl(this._self, this._then);

  final _PhysicalSheetOrientation _self;
  final $Res Function(_PhysicalSheetOrientation) _then;

/// Create a copy of PhysicalSheetOrientation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? width = null,Object? height = null,Object? grainDirection = null,}) {
  return _then(_PhysicalSheetOrientation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,
  ));
}


}


/// @nodoc
mixin _$OptimizationLayoutModel {

 String get id; String? get layoutNo; String get materialGroupId; LayoutStatus get status; String? get efficiencyPercent; String? get totalWasteArea; String? get totalSheetArea; int get sheetCount; String? get algorithmVersion; DateTime get createdAt; DateTime get updatedAt; List<OptimizationSheetModel> get sheets;
/// Create a copy of OptimizationLayoutModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptimizationLayoutModelCopyWith<OptimizationLayoutModel> get copyWith => _$OptimizationLayoutModelCopyWithImpl<OptimizationLayoutModel>(this as OptimizationLayoutModel, _$identity);

  /// Serializes this OptimizationLayoutModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OptimizationLayoutModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptimizationLayoutModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.layoutNo, _this.layoutNo) || other.layoutNo == _this.layoutNo)&&(identical(other.materialGroupId, _this.materialGroupId) || other.materialGroupId == _this.materialGroupId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.efficiencyPercent, _this.efficiencyPercent) || other.efficiencyPercent == _this.efficiencyPercent)&&(identical(other.totalWasteArea, _this.totalWasteArea) || other.totalWasteArea == _this.totalWasteArea)&&(identical(other.totalSheetArea, _this.totalSheetArea) || other.totalSheetArea == _this.totalSheetArea)&&(identical(other.sheetCount, _this.sheetCount) || other.sheetCount == _this.sheetCount)&&(identical(other.algorithmVersion, _this.algorithmVersion) || other.algorithmVersion == _this.algorithmVersion)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.sheets, _this.sheets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OptimizationLayoutModel;
  return Object.hash(runtimeType,_this.id,_this.layoutNo,_this.materialGroupId,_this.status,_this.efficiencyPercent,_this.totalWasteArea,_this.totalSheetArea,_this.sheetCount,_this.algorithmVersion,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.sheets));
}

@override
String toString() {
  final _this = this as OptimizationLayoutModel;
  return 'OptimizationLayoutModel(id: ${_this.id}, layoutNo: ${_this.layoutNo}, materialGroupId: ${_this.materialGroupId}, status: ${_this.status}, efficiencyPercent: ${_this.efficiencyPercent}, totalWasteArea: ${_this.totalWasteArea}, totalSheetArea: ${_this.totalSheetArea}, sheetCount: ${_this.sheetCount}, algorithmVersion: ${_this.algorithmVersion}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, sheets: ${_this.sheets})';
}


}

/// @nodoc
abstract mixin class $OptimizationLayoutModelCopyWith<$Res>  {
  factory $OptimizationLayoutModelCopyWith(OptimizationLayoutModel value, $Res Function(OptimizationLayoutModel) _then) = _$OptimizationLayoutModelCopyWithImpl;
@useResult
$Res call({
 String id, String? layoutNo, String materialGroupId, LayoutStatus status, String? efficiencyPercent, String? totalWasteArea, String? totalSheetArea, int sheetCount, String? algorithmVersion, DateTime createdAt, DateTime updatedAt, List<OptimizationSheetModel> sheets
});




}
/// @nodoc
class _$OptimizationLayoutModelCopyWithImpl<$Res>
    implements $OptimizationLayoutModelCopyWith<$Res> {
  _$OptimizationLayoutModelCopyWithImpl(this._self, this._then);

  final OptimizationLayoutModel _self;
  final $Res Function(OptimizationLayoutModel) _then;

/// Create a copy of OptimizationLayoutModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? layoutNo = freezed,Object? materialGroupId = null,Object? status = null,Object? efficiencyPercent = freezed,Object? totalWasteArea = freezed,Object? totalSheetArea = freezed,Object? sheetCount = null,Object? algorithmVersion = freezed,Object? createdAt = null,Object? updatedAt = null,Object? sheets = null,}) {
  return _then(OptimizationLayoutModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,layoutNo: freezed == layoutNo ? _self.layoutNo : layoutNo // ignore: cast_nullable_to_non_nullable
as String?,materialGroupId: null == materialGroupId ? _self.materialGroupId : materialGroupId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LayoutStatus,efficiencyPercent: freezed == efficiencyPercent ? _self.efficiencyPercent : efficiencyPercent // ignore: cast_nullable_to_non_nullable
as String?,totalWasteArea: freezed == totalWasteArea ? _self.totalWasteArea : totalWasteArea // ignore: cast_nullable_to_non_nullable
as String?,totalSheetArea: freezed == totalSheetArea ? _self.totalSheetArea : totalSheetArea // ignore: cast_nullable_to_non_nullable
as String?,sheetCount: null == sheetCount ? _self.sheetCount : sheetCount // ignore: cast_nullable_to_non_nullable
as int,algorithmVersion: freezed == algorithmVersion ? _self.algorithmVersion : algorithmVersion // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sheets: null == sheets ? _self.sheets : sheets // ignore: cast_nullable_to_non_nullable
as List<OptimizationSheetModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OptimizationLayoutModel].
extension OptimizationLayoutModelPatterns on OptimizationLayoutModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OptimizationLayoutModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OptimizationLayoutModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OptimizationLayoutModel value)  $default,){
final _that = this;
switch (_that) {
case _OptimizationLayoutModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OptimizationLayoutModel value)?  $default,){
final _that = this;
switch (_that) {
case _OptimizationLayoutModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? layoutNo,  String materialGroupId,  LayoutStatus status,  String? efficiencyPercent,  String? totalWasteArea,  String? totalSheetArea,  int sheetCount,  String? algorithmVersion,  DateTime createdAt,  DateTime updatedAt,  List<OptimizationSheetModel> sheets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OptimizationLayoutModel() when $default != null:
return $default(_that.id,_that.layoutNo,_that.materialGroupId,_that.status,_that.efficiencyPercent,_that.totalWasteArea,_that.totalSheetArea,_that.sheetCount,_that.algorithmVersion,_that.createdAt,_that.updatedAt,_that.sheets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? layoutNo,  String materialGroupId,  LayoutStatus status,  String? efficiencyPercent,  String? totalWasteArea,  String? totalSheetArea,  int sheetCount,  String? algorithmVersion,  DateTime createdAt,  DateTime updatedAt,  List<OptimizationSheetModel> sheets)  $default,) {final _that = this;
switch (_that) {
case _OptimizationLayoutModel():
return $default(_that.id,_that.layoutNo,_that.materialGroupId,_that.status,_that.efficiencyPercent,_that.totalWasteArea,_that.totalSheetArea,_that.sheetCount,_that.algorithmVersion,_that.createdAt,_that.updatedAt,_that.sheets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? layoutNo,  String materialGroupId,  LayoutStatus status,  String? efficiencyPercent,  String? totalWasteArea,  String? totalSheetArea,  int sheetCount,  String? algorithmVersion,  DateTime createdAt,  DateTime updatedAt,  List<OptimizationSheetModel> sheets)?  $default,) {final _that = this;
switch (_that) {
case _OptimizationLayoutModel() when $default != null:
return $default(_that.id,_that.layoutNo,_that.materialGroupId,_that.status,_that.efficiencyPercent,_that.totalWasteArea,_that.totalSheetArea,_that.sheetCount,_that.algorithmVersion,_that.createdAt,_that.updatedAt,_that.sheets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OptimizationLayoutModel implements OptimizationLayoutModel {
  const _OptimizationLayoutModel({required this.id, this.layoutNo, required this.materialGroupId, required this.status, this.efficiencyPercent, this.totalWasteArea, this.totalSheetArea, required this.sheetCount, this.algorithmVersion, required this.createdAt, required this.updatedAt, required  List<OptimizationSheetModel> sheets}): _sheets = sheets;
  factory _OptimizationLayoutModel.fromJson(Map<String, dynamic> json) => _$OptimizationLayoutModelFromJson(json);

@override final  String id;
@override final  String? layoutNo;
@override final  String materialGroupId;
@override final  LayoutStatus status;
@override final  String? efficiencyPercent;
@override final  String? totalWasteArea;
@override final  String? totalSheetArea;
@override final  int sheetCount;
@override final  String? algorithmVersion;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<OptimizationSheetModel> _sheets;
@override List<OptimizationSheetModel> get sheets {
  if (_sheets is EqualUnmodifiableListView) return _sheets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sheets);
}


/// Create a copy of OptimizationLayoutModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptimizationLayoutModelCopyWith<_OptimizationLayoutModel> get copyWith => __$OptimizationLayoutModelCopyWithImpl<_OptimizationLayoutModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OptimizationLayoutModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptimizationLayoutModel&&(identical(other.id, id) || other.id == id)&&(identical(other.layoutNo, layoutNo) || other.layoutNo == layoutNo)&&(identical(other.materialGroupId, materialGroupId) || other.materialGroupId == materialGroupId)&&(identical(other.status, status) || other.status == status)&&(identical(other.efficiencyPercent, efficiencyPercent) || other.efficiencyPercent == efficiencyPercent)&&(identical(other.totalWasteArea, totalWasteArea) || other.totalWasteArea == totalWasteArea)&&(identical(other.totalSheetArea, totalSheetArea) || other.totalSheetArea == totalSheetArea)&&(identical(other.sheetCount, sheetCount) || other.sheetCount == sheetCount)&&(identical(other.algorithmVersion, algorithmVersion) || other.algorithmVersion == algorithmVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.sheets, _sheets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,layoutNo,materialGroupId,status,efficiencyPercent,totalWasteArea,totalSheetArea,sheetCount,algorithmVersion,createdAt,updatedAt,const DeepCollectionEquality().hash(_sheets));
}

@override
String toString() {
    return 'OptimizationLayoutModel(id: $id, layoutNo: $layoutNo, materialGroupId: $materialGroupId, status: $status, efficiencyPercent: $efficiencyPercent, totalWasteArea: $totalWasteArea, totalSheetArea: $totalSheetArea, sheetCount: $sheetCount, algorithmVersion: $algorithmVersion, createdAt: $createdAt, updatedAt: $updatedAt, sheets: $sheets)';
}


}

/// @nodoc
abstract mixin class _$OptimizationLayoutModelCopyWith<$Res> implements $OptimizationLayoutModelCopyWith<$Res> {
  factory _$OptimizationLayoutModelCopyWith(_OptimizationLayoutModel value, $Res Function(_OptimizationLayoutModel) _then) = __$OptimizationLayoutModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? layoutNo, String materialGroupId, LayoutStatus status, String? efficiencyPercent, String? totalWasteArea, String? totalSheetArea, int sheetCount, String? algorithmVersion, DateTime createdAt, DateTime updatedAt, List<OptimizationSheetModel> sheets
});




}
/// @nodoc
class __$OptimizationLayoutModelCopyWithImpl<$Res>
    implements _$OptimizationLayoutModelCopyWith<$Res> {
  __$OptimizationLayoutModelCopyWithImpl(this._self, this._then);

  final _OptimizationLayoutModel _self;
  final $Res Function(_OptimizationLayoutModel) _then;

/// Create a copy of OptimizationLayoutModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? layoutNo = freezed,Object? materialGroupId = null,Object? status = null,Object? efficiencyPercent = freezed,Object? totalWasteArea = freezed,Object? totalSheetArea = freezed,Object? sheetCount = null,Object? algorithmVersion = freezed,Object? createdAt = null,Object? updatedAt = null,Object? sheets = null,}) {
  return _then(_OptimizationLayoutModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,layoutNo: freezed == layoutNo ? _self.layoutNo : layoutNo // ignore: cast_nullable_to_non_nullable
as String?,materialGroupId: null == materialGroupId ? _self.materialGroupId : materialGroupId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LayoutStatus,efficiencyPercent: freezed == efficiencyPercent ? _self.efficiencyPercent : efficiencyPercent // ignore: cast_nullable_to_non_nullable
as String?,totalWasteArea: freezed == totalWasteArea ? _self.totalWasteArea : totalWasteArea // ignore: cast_nullable_to_non_nullable
as String?,totalSheetArea: freezed == totalSheetArea ? _self.totalSheetArea : totalSheetArea // ignore: cast_nullable_to_non_nullable
as String?,sheetCount: null == sheetCount ? _self.sheetCount : sheetCount // ignore: cast_nullable_to_non_nullable
as int,algorithmVersion: freezed == algorithmVersion ? _self.algorithmVersion : algorithmVersion // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sheets: null == sheets ? _self._sheets : sheets // ignore: cast_nullable_to_non_nullable
as List<OptimizationSheetModel>,
  ));
}


}


/// @nodoc
mixin _$RemainingArea {

 String get id; double get x; double get y; double get width; double get height; RemainingAreaStatus get status;
/// Create a copy of RemainingArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemainingAreaCopyWith<RemainingArea> get copyWith => _$RemainingAreaCopyWithImpl<RemainingArea>(this as RemainingArea, _$identity);

  /// Serializes this RemainingArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RemainingArea;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemainingArea&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RemainingArea;
  return Object.hash(runtimeType,_this.id,_this.x,_this.y,_this.width,_this.height,_this.status);
}

@override
String toString() {
  final _this = this as RemainingArea;
  return 'RemainingArea(id: ${_this.id}, x: ${_this.x}, y: ${_this.y}, width: ${_this.width}, height: ${_this.height}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $RemainingAreaCopyWith<$Res>  {
  factory $RemainingAreaCopyWith(RemainingArea value, $Res Function(RemainingArea) _then) = _$RemainingAreaCopyWithImpl;
@useResult
$Res call({
 String id, double x, double y, double width, double height, RemainingAreaStatus status
});




}
/// @nodoc
class _$RemainingAreaCopyWithImpl<$Res>
    implements $RemainingAreaCopyWith<$Res> {
  _$RemainingAreaCopyWithImpl(this._self, this._then);

  final RemainingArea _self;
  final $Res Function(RemainingArea) _then;

/// Create a copy of RemainingArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? x = null,Object? y = null,Object? width = null,Object? height = null,Object? status = null,}) {
  return _then(RemainingArea(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RemainingAreaStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [RemainingArea].
extension RemainingAreaPatterns on RemainingArea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemainingArea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemainingArea() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemainingArea value)  $default,){
final _that = this;
switch (_that) {
case _RemainingArea():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemainingArea value)?  $default,){
final _that = this;
switch (_that) {
case _RemainingArea() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double x,  double y,  double width,  double height,  RemainingAreaStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemainingArea() when $default != null:
return $default(_that.id,_that.x,_that.y,_that.width,_that.height,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double x,  double y,  double width,  double height,  RemainingAreaStatus status)  $default,) {final _that = this;
switch (_that) {
case _RemainingArea():
return $default(_that.id,_that.x,_that.y,_that.width,_that.height,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double x,  double y,  double width,  double height,  RemainingAreaStatus status)?  $default,) {final _that = this;
switch (_that) {
case _RemainingArea() when $default != null:
return $default(_that.id,_that.x,_that.y,_that.width,_that.height,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemainingArea implements RemainingArea {
  const _RemainingArea({required this.id, required this.x, required this.y, required this.width, required this.height, required this.status});
  factory _RemainingArea.fromJson(Map<String, dynamic> json) => _$RemainingAreaFromJson(json);

@override final  String id;
@override final  double x;
@override final  double y;
@override final  double width;
@override final  double height;
@override final  RemainingAreaStatus status;

/// Create a copy of RemainingArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemainingAreaCopyWith<_RemainingArea> get copyWith => __$RemainingAreaCopyWithImpl<_RemainingArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemainingAreaToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemainingArea&&(identical(other.id, id) || other.id == id)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,x,y,width,height,status);
}

@override
String toString() {
    return 'RemainingArea(id: $id, x: $x, y: $y, width: $width, height: $height, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RemainingAreaCopyWith<$Res> implements $RemainingAreaCopyWith<$Res> {
  factory _$RemainingAreaCopyWith(_RemainingArea value, $Res Function(_RemainingArea) _then) = __$RemainingAreaCopyWithImpl;
@override @useResult
$Res call({
 String id, double x, double y, double width, double height, RemainingAreaStatus status
});




}
/// @nodoc
class __$RemainingAreaCopyWithImpl<$Res>
    implements _$RemainingAreaCopyWith<$Res> {
  __$RemainingAreaCopyWithImpl(this._self, this._then);

  final _RemainingArea _self;
  final $Res Function(_RemainingArea) _then;

/// Create a copy of RemainingArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? x = null,Object? y = null,Object? width = null,Object? height = null,Object? status = null,}) {
  return _then(_RemainingArea(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RemainingAreaStatus,
  ));
}


}

// dart format on
