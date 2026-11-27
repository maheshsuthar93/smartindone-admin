// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartRequestModel {

 String get orderItemId; String get name; double get width; double get height; double get thickness; bool get rotatable; GrainDirection? get grainDirection; double? get edgeBandTop; double? get edgeBandBottom; double? get edgeBandLeft; double? get edgeBandRight; bool get grain; String get materialId; int get quantity;
/// Create a copy of PartRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartRequestModelCopyWith<PartRequestModel> get copyWith => _$PartRequestModelCopyWithImpl<PartRequestModel>(this as PartRequestModel, _$identity);

  /// Serializes this PartRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PartRequestModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartRequestModel&&(identical(other.orderItemId, _this.orderItemId) || other.orderItemId == _this.orderItemId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.rotatable, _this.rotatable) || other.rotatable == _this.rotatable)&&(identical(other.grainDirection, _this.grainDirection) || other.grainDirection == _this.grainDirection)&&(identical(other.edgeBandTop, _this.edgeBandTop) || other.edgeBandTop == _this.edgeBandTop)&&(identical(other.edgeBandBottom, _this.edgeBandBottom) || other.edgeBandBottom == _this.edgeBandBottom)&&(identical(other.edgeBandLeft, _this.edgeBandLeft) || other.edgeBandLeft == _this.edgeBandLeft)&&(identical(other.edgeBandRight, _this.edgeBandRight) || other.edgeBandRight == _this.edgeBandRight)&&(identical(other.grain, _this.grain) || other.grain == _this.grain)&&(identical(other.materialId, _this.materialId) || other.materialId == _this.materialId)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PartRequestModel;
  return Object.hash(runtimeType,_this.orderItemId,_this.name,_this.width,_this.height,_this.thickness,_this.rotatable,_this.grainDirection,_this.edgeBandTop,_this.edgeBandBottom,_this.edgeBandLeft,_this.edgeBandRight,_this.grain,_this.materialId,_this.quantity);
}

@override
String toString() {
  final _this = this as PartRequestModel;
  return 'PartRequestModel(orderItemId: ${_this.orderItemId}, name: ${_this.name}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, rotatable: ${_this.rotatable}, grainDirection: ${_this.grainDirection}, edgeBandTop: ${_this.edgeBandTop}, edgeBandBottom: ${_this.edgeBandBottom}, edgeBandLeft: ${_this.edgeBandLeft}, edgeBandRight: ${_this.edgeBandRight}, grain: ${_this.grain}, materialId: ${_this.materialId}, quantity: ${_this.quantity})';
}


}

/// @nodoc
abstract mixin class $PartRequestModelCopyWith<$Res>  {
  factory $PartRequestModelCopyWith(PartRequestModel value, $Res Function(PartRequestModel) _then) = _$PartRequestModelCopyWithImpl;
@useResult
$Res call({
 String orderItemId, String name, double width, double height, double thickness, bool rotatable, GrainDirection? grainDirection, double? edgeBandTop, double? edgeBandBottom, double? edgeBandLeft, double? edgeBandRight, bool grain, String materialId, int quantity
});




}
/// @nodoc
class _$PartRequestModelCopyWithImpl<$Res>
    implements $PartRequestModelCopyWith<$Res> {
  _$PartRequestModelCopyWithImpl(this._self, this._then);

  final PartRequestModel _self;
  final $Res Function(PartRequestModel) _then;

/// Create a copy of PartRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderItemId = null,Object? name = null,Object? width = null,Object? height = null,Object? thickness = null,Object? rotatable = null,Object? grainDirection = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? grain = null,Object? materialId = null,Object? quantity = null,}) {
  return _then(PartRequestModel(
orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,grainDirection: freezed == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as double?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as double?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as double?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as double?,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PartRequestModel].
extension PartRequestModelPatterns on PartRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PartRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderItemId,  String name,  double width,  double height,  double thickness,  bool rotatable,  GrainDirection? grainDirection,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  bool grain,  String materialId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartRequestModel() when $default != null:
return $default(_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.rotatable,_that.grainDirection,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.grain,_that.materialId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderItemId,  String name,  double width,  double height,  double thickness,  bool rotatable,  GrainDirection? grainDirection,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  bool grain,  String materialId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _PartRequestModel():
return $default(_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.rotatable,_that.grainDirection,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.grain,_that.materialId,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderItemId,  String name,  double width,  double height,  double thickness,  bool rotatable,  GrainDirection? grainDirection,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  bool grain,  String materialId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _PartRequestModel() when $default != null:
return $default(_that.orderItemId,_that.name,_that.width,_that.height,_that.thickness,_that.rotatable,_that.grainDirection,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.grain,_that.materialId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartRequestModel implements PartRequestModel {
  const _PartRequestModel({required this.orderItemId, required this.name, required this.width, required this.height, required this.thickness, this.rotatable = true, this.grainDirection, this.edgeBandTop, this.edgeBandBottom, this.edgeBandLeft, this.edgeBandRight, this.grain = false, required this.materialId, required this.quantity});
  factory _PartRequestModel.fromJson(Map<String, dynamic> json) => _$PartRequestModelFromJson(json);

@override final  String orderItemId;
@override final  String name;
@override final  double width;
@override final  double height;
@override final  double thickness;
@override@JsonKey() final  bool rotatable;
@override final  GrainDirection? grainDirection;
@override final  double? edgeBandTop;
@override final  double? edgeBandBottom;
@override final  double? edgeBandLeft;
@override final  double? edgeBandRight;
@override@JsonKey() final  bool grain;
@override final  String materialId;
@override final  int quantity;

/// Create a copy of PartRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartRequestModelCopyWith<_PartRequestModel> get copyWith => __$PartRequestModelCopyWithImpl<_PartRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartRequestModel&&(identical(other.orderItemId, orderItemId) || other.orderItemId == orderItemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.rotatable, rotatable) || other.rotatable == rotatable)&&(identical(other.grainDirection, grainDirection) || other.grainDirection == grainDirection)&&(identical(other.edgeBandTop, edgeBandTop) || other.edgeBandTop == edgeBandTop)&&(identical(other.edgeBandBottom, edgeBandBottom) || other.edgeBandBottom == edgeBandBottom)&&(identical(other.edgeBandLeft, edgeBandLeft) || other.edgeBandLeft == edgeBandLeft)&&(identical(other.edgeBandRight, edgeBandRight) || other.edgeBandRight == edgeBandRight)&&(identical(other.grain, grain) || other.grain == grain)&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,orderItemId,name,width,height,thickness,rotatable,grainDirection,edgeBandTop,edgeBandBottom,edgeBandLeft,edgeBandRight,grain,materialId,quantity);
}

@override
String toString() {
    return 'PartRequestModel(orderItemId: $orderItemId, name: $name, width: $width, height: $height, thickness: $thickness, rotatable: $rotatable, grainDirection: $grainDirection, edgeBandTop: $edgeBandTop, edgeBandBottom: $edgeBandBottom, edgeBandLeft: $edgeBandLeft, edgeBandRight: $edgeBandRight, grain: $grain, materialId: $materialId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$PartRequestModelCopyWith<$Res> implements $PartRequestModelCopyWith<$Res> {
  factory _$PartRequestModelCopyWith(_PartRequestModel value, $Res Function(_PartRequestModel) _then) = __$PartRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String orderItemId, String name, double width, double height, double thickness, bool rotatable, GrainDirection? grainDirection, double? edgeBandTop, double? edgeBandBottom, double? edgeBandLeft, double? edgeBandRight, bool grain, String materialId, int quantity
});




}
/// @nodoc
class __$PartRequestModelCopyWithImpl<$Res>
    implements _$PartRequestModelCopyWith<$Res> {
  __$PartRequestModelCopyWithImpl(this._self, this._then);

  final _PartRequestModel _self;
  final $Res Function(_PartRequestModel) _then;

/// Create a copy of PartRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderItemId = null,Object? name = null,Object? width = null,Object? height = null,Object? thickness = null,Object? rotatable = null,Object? grainDirection = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? grain = null,Object? materialId = null,Object? quantity = null,}) {
  return _then(_PartRequestModel(
orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,grainDirection: freezed == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as double?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as double?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as double?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as double?,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
