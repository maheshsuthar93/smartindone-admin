// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece_label_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PieceLabelData {

 String get pieceCode; String get partName; String get orderReference; String get size; String get material; String get grain; String get edgeBands; String? get serialNumber;
/// Create a copy of PieceLabelData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceLabelDataCopyWith<PieceLabelData> get copyWith => _$PieceLabelDataCopyWithImpl<PieceLabelData>(this as PieceLabelData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PieceLabelData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieceLabelData&&(identical(other.pieceCode, _this.pieceCode) || other.pieceCode == _this.pieceCode)&&(identical(other.partName, _this.partName) || other.partName == _this.partName)&&(identical(other.orderReference, _this.orderReference) || other.orderReference == _this.orderReference)&&(identical(other.size, _this.size) || other.size == _this.size)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.grain, _this.grain) || other.grain == _this.grain)&&(identical(other.edgeBands, _this.edgeBands) || other.edgeBands == _this.edgeBands)&&(identical(other.serialNumber, _this.serialNumber) || other.serialNumber == _this.serialNumber));
}


@override
int get hashCode {
  final _this = this as PieceLabelData;
  return Object.hash(runtimeType,_this.pieceCode,_this.partName,_this.orderReference,_this.size,_this.material,_this.grain,_this.edgeBands,_this.serialNumber);
}

@override
String toString() {
  final _this = this as PieceLabelData;
  return 'PieceLabelData(pieceCode: ${_this.pieceCode}, partName: ${_this.partName}, orderReference: ${_this.orderReference}, size: ${_this.size}, material: ${_this.material}, grain: ${_this.grain}, edgeBands: ${_this.edgeBands}, serialNumber: ${_this.serialNumber})';
}


}

/// @nodoc
abstract mixin class $PieceLabelDataCopyWith<$Res>  {
  factory $PieceLabelDataCopyWith(PieceLabelData value, $Res Function(PieceLabelData) _then) = _$PieceLabelDataCopyWithImpl;
@useResult
$Res call({
 String pieceCode, String partName, String orderReference, String size, String material, String grain, String edgeBands, String? serialNumber
});




}
/// @nodoc
class _$PieceLabelDataCopyWithImpl<$Res>
    implements $PieceLabelDataCopyWith<$Res> {
  _$PieceLabelDataCopyWithImpl(this._self, this._then);

  final PieceLabelData _self;
  final $Res Function(PieceLabelData) _then;

/// Create a copy of PieceLabelData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pieceCode = null,Object? partName = null,Object? orderReference = null,Object? size = null,Object? material = null,Object? grain = null,Object? edgeBands = null,Object? serialNumber = freezed,}) {
  return _then(PieceLabelData(
pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,partName: null == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String,orderReference: null == orderReference ? _self.orderReference : orderReference // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as String,edgeBands: null == edgeBands ? _self.edgeBands : edgeBands // ignore: cast_nullable_to_non_nullable
as String,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PieceLabelData].
extension PieceLabelDataPatterns on PieceLabelData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieceLabelData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieceLabelData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieceLabelData value)  $default,){
final _that = this;
switch (_that) {
case _PieceLabelData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieceLabelData value)?  $default,){
final _that = this;
switch (_that) {
case _PieceLabelData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pieceCode,  String partName,  String orderReference,  String size,  String material,  String grain,  String edgeBands,  String? serialNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieceLabelData() when $default != null:
return $default(_that.pieceCode,_that.partName,_that.orderReference,_that.size,_that.material,_that.grain,_that.edgeBands,_that.serialNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pieceCode,  String partName,  String orderReference,  String size,  String material,  String grain,  String edgeBands,  String? serialNumber)  $default,) {final _that = this;
switch (_that) {
case _PieceLabelData():
return $default(_that.pieceCode,_that.partName,_that.orderReference,_that.size,_that.material,_that.grain,_that.edgeBands,_that.serialNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pieceCode,  String partName,  String orderReference,  String size,  String material,  String grain,  String edgeBands,  String? serialNumber)?  $default,) {final _that = this;
switch (_that) {
case _PieceLabelData() when $default != null:
return $default(_that.pieceCode,_that.partName,_that.orderReference,_that.size,_that.material,_that.grain,_that.edgeBands,_that.serialNumber);case _:
  return null;

}
}

}

/// @nodoc


class _PieceLabelData implements PieceLabelData {
  const _PieceLabelData({required this.pieceCode, required this.partName, required this.orderReference, required this.size, required this.material, required this.grain, required this.edgeBands, this.serialNumber});
  

@override final  String pieceCode;
@override final  String partName;
@override final  String orderReference;
@override final  String size;
@override final  String material;
@override final  String grain;
@override final  String edgeBands;
@override final  String? serialNumber;

/// Create a copy of PieceLabelData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceLabelDataCopyWith<_PieceLabelData> get copyWith => __$PieceLabelDataCopyWithImpl<_PieceLabelData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceLabelData&&(identical(other.pieceCode, pieceCode) || other.pieceCode == pieceCode)&&(identical(other.partName, partName) || other.partName == partName)&&(identical(other.orderReference, orderReference) || other.orderReference == orderReference)&&(identical(other.size, size) || other.size == size)&&(identical(other.material, material) || other.material == material)&&(identical(other.grain, grain) || other.grain == grain)&&(identical(other.edgeBands, edgeBands) || other.edgeBands == edgeBands)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,pieceCode,partName,orderReference,size,material,grain,edgeBands,serialNumber);
}

@override
String toString() {
    return 'PieceLabelData(pieceCode: $pieceCode, partName: $partName, orderReference: $orderReference, size: $size, material: $material, grain: $grain, edgeBands: $edgeBands, serialNumber: $serialNumber)';
}


}

/// @nodoc
abstract mixin class _$PieceLabelDataCopyWith<$Res> implements $PieceLabelDataCopyWith<$Res> {
  factory _$PieceLabelDataCopyWith(_PieceLabelData value, $Res Function(_PieceLabelData) _then) = __$PieceLabelDataCopyWithImpl;
@override @useResult
$Res call({
 String pieceCode, String partName, String orderReference, String size, String material, String grain, String edgeBands, String? serialNumber
});




}
/// @nodoc
class __$PieceLabelDataCopyWithImpl<$Res>
    implements _$PieceLabelDataCopyWith<$Res> {
  __$PieceLabelDataCopyWithImpl(this._self, this._then);

  final _PieceLabelData _self;
  final $Res Function(_PieceLabelData) _then;

/// Create a copy of PieceLabelData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pieceCode = null,Object? partName = null,Object? orderReference = null,Object? size = null,Object? material = null,Object? grain = null,Object? edgeBands = null,Object? serialNumber = freezed,}) {
  return _then(_PieceLabelData(
pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,partName: null == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String,orderReference: null == orderReference ? _self.orderReference : orderReference // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as String,edgeBands: null == edgeBands ? _self.edgeBands : edgeBands // ignore: cast_nullable_to_non_nullable
as String,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
