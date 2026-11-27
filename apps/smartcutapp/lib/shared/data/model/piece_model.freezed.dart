// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PieceModel {

 String get id; String get pieceCode; double get width; double get height; double get thickness; ProductionStatus get cuttingStatus; ProductionStatus get qcStatus; PackingStatus get packingStatus;
/// Create a copy of PieceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceModelCopyWith<PieceModel> get copyWith => _$PieceModelCopyWithImpl<PieceModel>(this as PieceModel, _$identity);

  /// Serializes this PieceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PieceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pieceCode, _this.pieceCode) || other.pieceCode == _this.pieceCode)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.cuttingStatus, _this.cuttingStatus) || other.cuttingStatus == _this.cuttingStatus)&&(identical(other.qcStatus, _this.qcStatus) || other.qcStatus == _this.qcStatus)&&(identical(other.packingStatus, _this.packingStatus) || other.packingStatus == _this.packingStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PieceModel;
  return Object.hash(runtimeType,_this.id,_this.pieceCode,_this.width,_this.height,_this.thickness,_this.cuttingStatus,_this.qcStatus,_this.packingStatus);
}

@override
String toString() {
  final _this = this as PieceModel;
  return 'PieceModel(id: ${_this.id}, pieceCode: ${_this.pieceCode}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, cuttingStatus: ${_this.cuttingStatus}, qcStatus: ${_this.qcStatus}, packingStatus: ${_this.packingStatus})';
}


}

/// @nodoc
abstract mixin class $PieceModelCopyWith<$Res>  {
  factory $PieceModelCopyWith(PieceModel value, $Res Function(PieceModel) _then) = _$PieceModelCopyWithImpl;
@useResult
$Res call({
 String id, String pieceCode, double width, double height, double thickness, ProductionStatus cuttingStatus, ProductionStatus qcStatus, PackingStatus packingStatus
});




}
/// @nodoc
class _$PieceModelCopyWithImpl<$Res>
    implements $PieceModelCopyWith<$Res> {
  _$PieceModelCopyWithImpl(this._self, this._then);

  final PieceModel _self;
  final $Res Function(PieceModel) _then;

/// Create a copy of PieceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pieceCode = null,Object? width = null,Object? height = null,Object? thickness = null,Object? cuttingStatus = null,Object? qcStatus = null,Object? packingStatus = null,}) {
  return _then(PieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,cuttingStatus: null == cuttingStatus ? _self.cuttingStatus : cuttingStatus // ignore: cast_nullable_to_non_nullable
as ProductionStatus,qcStatus: null == qcStatus ? _self.qcStatus : qcStatus // ignore: cast_nullable_to_non_nullable
as ProductionStatus,packingStatus: null == packingStatus ? _self.packingStatus : packingStatus // ignore: cast_nullable_to_non_nullable
as PackingStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [PieceModel].
extension PieceModelPatterns on PieceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieceModel value)  $default,){
final _that = this;
switch (_that) {
case _PieceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieceModel value)?  $default,){
final _that = this;
switch (_that) {
case _PieceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pieceCode,  double width,  double height,  double thickness,  ProductionStatus cuttingStatus,  ProductionStatus qcStatus,  PackingStatus packingStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieceModel() when $default != null:
return $default(_that.id,_that.pieceCode,_that.width,_that.height,_that.thickness,_that.cuttingStatus,_that.qcStatus,_that.packingStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pieceCode,  double width,  double height,  double thickness,  ProductionStatus cuttingStatus,  ProductionStatus qcStatus,  PackingStatus packingStatus)  $default,) {final _that = this;
switch (_that) {
case _PieceModel():
return $default(_that.id,_that.pieceCode,_that.width,_that.height,_that.thickness,_that.cuttingStatus,_that.qcStatus,_that.packingStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pieceCode,  double width,  double height,  double thickness,  ProductionStatus cuttingStatus,  ProductionStatus qcStatus,  PackingStatus packingStatus)?  $default,) {final _that = this;
switch (_that) {
case _PieceModel() when $default != null:
return $default(_that.id,_that.pieceCode,_that.width,_that.height,_that.thickness,_that.cuttingStatus,_that.qcStatus,_that.packingStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PieceModel implements PieceModel {
  const _PieceModel({required this.id, required this.pieceCode, required this.width, required this.height, required this.thickness, required this.cuttingStatus, required this.qcStatus, required this.packingStatus});
  factory _PieceModel.fromJson(Map<String, dynamic> json) => _$PieceModelFromJson(json);

@override final  String id;
@override final  String pieceCode;
@override final  double width;
@override final  double height;
@override final  double thickness;
@override final  ProductionStatus cuttingStatus;
@override final  ProductionStatus qcStatus;
@override final  PackingStatus packingStatus;

/// Create a copy of PieceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceModelCopyWith<_PieceModel> get copyWith => __$PieceModelCopyWithImpl<_PieceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PieceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.pieceCode, pieceCode) || other.pieceCode == pieceCode)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.cuttingStatus, cuttingStatus) || other.cuttingStatus == cuttingStatus)&&(identical(other.qcStatus, qcStatus) || other.qcStatus == qcStatus)&&(identical(other.packingStatus, packingStatus) || other.packingStatus == packingStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,pieceCode,width,height,thickness,cuttingStatus,qcStatus,packingStatus);
}

@override
String toString() {
    return 'PieceModel(id: $id, pieceCode: $pieceCode, width: $width, height: $height, thickness: $thickness, cuttingStatus: $cuttingStatus, qcStatus: $qcStatus, packingStatus: $packingStatus)';
}


}

/// @nodoc
abstract mixin class _$PieceModelCopyWith<$Res> implements $PieceModelCopyWith<$Res> {
  factory _$PieceModelCopyWith(_PieceModel value, $Res Function(_PieceModel) _then) = __$PieceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String pieceCode, double width, double height, double thickness, ProductionStatus cuttingStatus, ProductionStatus qcStatus, PackingStatus packingStatus
});




}
/// @nodoc
class __$PieceModelCopyWithImpl<$Res>
    implements _$PieceModelCopyWith<$Res> {
  __$PieceModelCopyWithImpl(this._self, this._then);

  final _PieceModel _self;
  final $Res Function(_PieceModel) _then;

/// Create a copy of PieceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pieceCode = null,Object? width = null,Object? height = null,Object? thickness = null,Object? cuttingStatus = null,Object? qcStatus = null,Object? packingStatus = null,}) {
  return _then(_PieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,cuttingStatus: null == cuttingStatus ? _self.cuttingStatus : cuttingStatus // ignore: cast_nullable_to_non_nullable
as ProductionStatus,qcStatus: null == qcStatus ? _self.qcStatus : qcStatus // ignore: cast_nullable_to_non_nullable
as ProductionStatus,packingStatus: null == packingStatus ? _self.packingStatus : packingStatus // ignore: cast_nullable_to_non_nullable
as PackingStatus,
  ));
}


}

// dart format on
