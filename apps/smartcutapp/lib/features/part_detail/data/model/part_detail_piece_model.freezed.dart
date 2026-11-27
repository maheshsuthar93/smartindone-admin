// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'part_detail_piece_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartDetailPieceModel {

 String get id; String get partId; String get pieceCode; String? get serialNo; double get width; double get height; double get thickness; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of PartDetailPieceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartDetailPieceModelCopyWith<PartDetailPieceModel> get copyWith => _$PartDetailPieceModelCopyWithImpl<PartDetailPieceModel>(this as PartDetailPieceModel, _$identity);

  /// Serializes this PartDetailPieceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PartDetailPieceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartDetailPieceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.partId, _this.partId) || other.partId == _this.partId)&&(identical(other.pieceCode, _this.pieceCode) || other.pieceCode == _this.pieceCode)&&(identical(other.serialNo, _this.serialNo) || other.serialNo == _this.serialNo)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PartDetailPieceModel;
  return Object.hash(runtimeType,_this.id,_this.partId,_this.pieceCode,_this.serialNo,_this.width,_this.height,_this.thickness,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as PartDetailPieceModel;
  return 'PartDetailPieceModel(id: ${_this.id}, partId: ${_this.partId}, pieceCode: ${_this.pieceCode}, serialNo: ${_this.serialNo}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $PartDetailPieceModelCopyWith<$Res>  {
  factory $PartDetailPieceModelCopyWith(PartDetailPieceModel value, $Res Function(PartDetailPieceModel) _then) = _$PartDetailPieceModelCopyWithImpl;
@useResult
$Res call({
 String id, String partId, String pieceCode, String? serialNo, double width, double height, double thickness, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$PartDetailPieceModelCopyWithImpl<$Res>
    implements $PartDetailPieceModelCopyWith<$Res> {
  _$PartDetailPieceModelCopyWithImpl(this._self, this._then);

  final PartDetailPieceModel _self;
  final $Res Function(PartDetailPieceModel) _then;

/// Create a copy of PartDetailPieceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? partId = null,Object? pieceCode = null,Object? serialNo = freezed,Object? width = null,Object? height = null,Object? thickness = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(PartDetailPieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partId: null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,serialNo: freezed == serialNo ? _self.serialNo : serialNo // ignore: cast_nullable_to_non_nullable
as String?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PartDetailPieceModel].
extension PartDetailPieceModelPatterns on PartDetailPieceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartDetailPieceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartDetailPieceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartDetailPieceModel value)  $default,){
final _that = this;
switch (_that) {
case _PartDetailPieceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartDetailPieceModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartDetailPieceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String partId,  String pieceCode,  String? serialNo,  double width,  double height,  double thickness,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartDetailPieceModel() when $default != null:
return $default(_that.id,_that.partId,_that.pieceCode,_that.serialNo,_that.width,_that.height,_that.thickness,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String partId,  String pieceCode,  String? serialNo,  double width,  double height,  double thickness,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PartDetailPieceModel():
return $default(_that.id,_that.partId,_that.pieceCode,_that.serialNo,_that.width,_that.height,_that.thickness,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String partId,  String pieceCode,  String? serialNo,  double width,  double height,  double thickness,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PartDetailPieceModel() when $default != null:
return $default(_that.id,_that.partId,_that.pieceCode,_that.serialNo,_that.width,_that.height,_that.thickness,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartDetailPieceModel implements PartDetailPieceModel {
  const _PartDetailPieceModel({required this.id, required this.partId, required this.pieceCode, this.serialNo, required this.width, required this.height, required this.thickness, required this.createdAt, required this.updatedAt});
  factory _PartDetailPieceModel.fromJson(Map<String, dynamic> json) => _$PartDetailPieceModelFromJson(json);

@override final  String id;
@override final  String partId;
@override final  String pieceCode;
@override final  String? serialNo;
@override final  double width;
@override final  double height;
@override final  double thickness;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of PartDetailPieceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartDetailPieceModelCopyWith<_PartDetailPieceModel> get copyWith => __$PartDetailPieceModelCopyWithImpl<_PartDetailPieceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartDetailPieceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartDetailPieceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.partId, partId) || other.partId == partId)&&(identical(other.pieceCode, pieceCode) || other.pieceCode == pieceCode)&&(identical(other.serialNo, serialNo) || other.serialNo == serialNo)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,partId,pieceCode,serialNo,width,height,thickness,createdAt,updatedAt);
}

@override
String toString() {
    return 'PartDetailPieceModel(id: $id, partId: $partId, pieceCode: $pieceCode, serialNo: $serialNo, width: $width, height: $height, thickness: $thickness, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PartDetailPieceModelCopyWith<$Res> implements $PartDetailPieceModelCopyWith<$Res> {
  factory _$PartDetailPieceModelCopyWith(_PartDetailPieceModel value, $Res Function(_PartDetailPieceModel) _then) = __$PartDetailPieceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String partId, String pieceCode, String? serialNo, double width, double height, double thickness, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$PartDetailPieceModelCopyWithImpl<$Res>
    implements _$PartDetailPieceModelCopyWith<$Res> {
  __$PartDetailPieceModelCopyWithImpl(this._self, this._then);

  final _PartDetailPieceModel _self;
  final $Res Function(_PartDetailPieceModel) _then;

/// Create a copy of PartDetailPieceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? partId = null,Object? pieceCode = null,Object? serialNo = freezed,Object? width = null,Object? height = null,Object? thickness = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PartDetailPieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partId: null == partId ? _self.partId : partId // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,serialNo: freezed == serialNo ? _self.serialNo : serialNo // ignore: cast_nullable_to_non_nullable
as String?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
