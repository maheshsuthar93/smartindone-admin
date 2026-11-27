// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_package_piece_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailablePackagePieceModel {

 String get id; String get pieceCode; int? get pieceNumber; num get width; num get height; num get thickness; String? get barcode; String? get qrCode; PackagePiecePartModel? get part;
/// Create a copy of AvailablePackagePieceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailablePackagePieceModelCopyWith<AvailablePackagePieceModel> get copyWith => _$AvailablePackagePieceModelCopyWithImpl<AvailablePackagePieceModel>(this as AvailablePackagePieceModel, _$identity);

  /// Serializes this AvailablePackagePieceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AvailablePackagePieceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailablePackagePieceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pieceCode, _this.pieceCode) || other.pieceCode == _this.pieceCode)&&(identical(other.pieceNumber, _this.pieceNumber) || other.pieceNumber == _this.pieceNumber)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.barcode, _this.barcode) || other.barcode == _this.barcode)&&(identical(other.qrCode, _this.qrCode) || other.qrCode == _this.qrCode)&&(identical(other.part, _this.part) || other.part == _this.part));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AvailablePackagePieceModel;
  return Object.hash(runtimeType,_this.id,_this.pieceCode,_this.pieceNumber,_this.width,_this.height,_this.thickness,_this.barcode,_this.qrCode,_this.part);
}

@override
String toString() {
  final _this = this as AvailablePackagePieceModel;
  return 'AvailablePackagePieceModel(id: ${_this.id}, pieceCode: ${_this.pieceCode}, pieceNumber: ${_this.pieceNumber}, width: ${_this.width}, height: ${_this.height}, thickness: ${_this.thickness}, barcode: ${_this.barcode}, qrCode: ${_this.qrCode}, part: ${_this.part})';
}


}

/// @nodoc
abstract mixin class $AvailablePackagePieceModelCopyWith<$Res>  {
  factory $AvailablePackagePieceModelCopyWith(AvailablePackagePieceModel value, $Res Function(AvailablePackagePieceModel) _then) = _$AvailablePackagePieceModelCopyWithImpl;
@useResult
$Res call({
 String id, String pieceCode, int? pieceNumber, num width, num height, num thickness, String? barcode, String? qrCode, PackagePiecePartModel? part
});


$PackagePiecePartModelCopyWith<$Res>? get part;

}
/// @nodoc
class _$AvailablePackagePieceModelCopyWithImpl<$Res>
    implements $AvailablePackagePieceModelCopyWith<$Res> {
  _$AvailablePackagePieceModelCopyWithImpl(this._self, this._then);

  final AvailablePackagePieceModel _self;
  final $Res Function(AvailablePackagePieceModel) _then;

/// Create a copy of AvailablePackagePieceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pieceCode = null,Object? pieceNumber = freezed,Object? width = null,Object? height = null,Object? thickness = null,Object? barcode = freezed,Object? qrCode = freezed,Object? part = freezed,}) {
  return _then(AvailablePackagePieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,pieceNumber: freezed == pieceNumber ? _self.pieceNumber : pieceNumber // ignore: cast_nullable_to_non_nullable
as int?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as num,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as num,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as num,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,part: freezed == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as PackagePiecePartModel?,
  ));
}
/// Create a copy of AvailablePackagePieceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackagePiecePartModelCopyWith<$Res>? get part {
    if (_self.part == null) {
    return null;
  }

  return $PackagePiecePartModelCopyWith<$Res>(_self.part!, (value) {
    return _then(_self.copyWith(part: value));
  });
}
}


/// Adds pattern-matching-related methods to [AvailablePackagePieceModel].
extension AvailablePackagePieceModelPatterns on AvailablePackagePieceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailablePackagePieceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailablePackagePieceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailablePackagePieceModel value)  $default,){
final _that = this;
switch (_that) {
case _AvailablePackagePieceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailablePackagePieceModel value)?  $default,){
final _that = this;
switch (_that) {
case _AvailablePackagePieceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pieceCode,  int? pieceNumber,  num width,  num height,  num thickness,  String? barcode,  String? qrCode,  PackagePiecePartModel? part)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailablePackagePieceModel() when $default != null:
return $default(_that.id,_that.pieceCode,_that.pieceNumber,_that.width,_that.height,_that.thickness,_that.barcode,_that.qrCode,_that.part);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pieceCode,  int? pieceNumber,  num width,  num height,  num thickness,  String? barcode,  String? qrCode,  PackagePiecePartModel? part)  $default,) {final _that = this;
switch (_that) {
case _AvailablePackagePieceModel():
return $default(_that.id,_that.pieceCode,_that.pieceNumber,_that.width,_that.height,_that.thickness,_that.barcode,_that.qrCode,_that.part);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pieceCode,  int? pieceNumber,  num width,  num height,  num thickness,  String? barcode,  String? qrCode,  PackagePiecePartModel? part)?  $default,) {final _that = this;
switch (_that) {
case _AvailablePackagePieceModel() when $default != null:
return $default(_that.id,_that.pieceCode,_that.pieceNumber,_that.width,_that.height,_that.thickness,_that.barcode,_that.qrCode,_that.part);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailablePackagePieceModel extends AvailablePackagePieceModel {
  const _AvailablePackagePieceModel({required this.id, required this.pieceCode, this.pieceNumber, this.width = 0, this.height = 0, this.thickness = 0, this.barcode, this.qrCode, this.part}): super._();
  factory _AvailablePackagePieceModel.fromJson(Map<String, dynamic> json) => _$AvailablePackagePieceModelFromJson(json);

@override final  String id;
@override final  String pieceCode;
@override final  int? pieceNumber;
@override@JsonKey() final  num width;
@override@JsonKey() final  num height;
@override@JsonKey() final  num thickness;
@override final  String? barcode;
@override final  String? qrCode;
@override final  PackagePiecePartModel? part;

/// Create a copy of AvailablePackagePieceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailablePackagePieceModelCopyWith<_AvailablePackagePieceModel> get copyWith => __$AvailablePackagePieceModelCopyWithImpl<_AvailablePackagePieceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailablePackagePieceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailablePackagePieceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.pieceCode, pieceCode) || other.pieceCode == pieceCode)&&(identical(other.pieceNumber, pieceNumber) || other.pieceNumber == pieceNumber)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.part, part) || other.part == part));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,pieceCode,pieceNumber,width,height,thickness,barcode,qrCode,part);
}

@override
String toString() {
    return 'AvailablePackagePieceModel(id: $id, pieceCode: $pieceCode, pieceNumber: $pieceNumber, width: $width, height: $height, thickness: $thickness, barcode: $barcode, qrCode: $qrCode, part: $part)';
}


}

/// @nodoc
abstract mixin class _$AvailablePackagePieceModelCopyWith<$Res> implements $AvailablePackagePieceModelCopyWith<$Res> {
  factory _$AvailablePackagePieceModelCopyWith(_AvailablePackagePieceModel value, $Res Function(_AvailablePackagePieceModel) _then) = __$AvailablePackagePieceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String pieceCode, int? pieceNumber, num width, num height, num thickness, String? barcode, String? qrCode, PackagePiecePartModel? part
});


@override $PackagePiecePartModelCopyWith<$Res>? get part;

}
/// @nodoc
class __$AvailablePackagePieceModelCopyWithImpl<$Res>
    implements _$AvailablePackagePieceModelCopyWith<$Res> {
  __$AvailablePackagePieceModelCopyWithImpl(this._self, this._then);

  final _AvailablePackagePieceModel _self;
  final $Res Function(_AvailablePackagePieceModel) _then;

/// Create a copy of AvailablePackagePieceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pieceCode = null,Object? pieceNumber = freezed,Object? width = null,Object? height = null,Object? thickness = null,Object? barcode = freezed,Object? qrCode = freezed,Object? part = freezed,}) {
  return _then(_AvailablePackagePieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pieceCode: null == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String,pieceNumber: freezed == pieceNumber ? _self.pieceNumber : pieceNumber // ignore: cast_nullable_to_non_nullable
as int?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as num,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as num,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as num,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,part: freezed == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as PackagePiecePartModel?,
  ));
}

/// Create a copy of AvailablePackagePieceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackagePiecePartModelCopyWith<$Res>? get part {
    if (_self.part == null) {
    return null;
  }

  return $PackagePiecePartModelCopyWith<$Res>(_self.part!, (value) {
    return _then(_self.copyWith(part: value));
  });
}
}


/// @nodoc
mixin _$PackagePiecePartModel {

 String get id; int? get partNumber; PackagePieceOrderItemModel? get orderItem;
/// Create a copy of PackagePiecePartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackagePiecePartModelCopyWith<PackagePiecePartModel> get copyWith => _$PackagePiecePartModelCopyWithImpl<PackagePiecePartModel>(this as PackagePiecePartModel, _$identity);

  /// Serializes this PackagePiecePartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PackagePiecePartModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackagePiecePartModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.partNumber, _this.partNumber) || other.partNumber == _this.partNumber)&&(identical(other.orderItem, _this.orderItem) || other.orderItem == _this.orderItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PackagePiecePartModel;
  return Object.hash(runtimeType,_this.id,_this.partNumber,_this.orderItem);
}

@override
String toString() {
  final _this = this as PackagePiecePartModel;
  return 'PackagePiecePartModel(id: ${_this.id}, partNumber: ${_this.partNumber}, orderItem: ${_this.orderItem})';
}


}

/// @nodoc
abstract mixin class $PackagePiecePartModelCopyWith<$Res>  {
  factory $PackagePiecePartModelCopyWith(PackagePiecePartModel value, $Res Function(PackagePiecePartModel) _then) = _$PackagePiecePartModelCopyWithImpl;
@useResult
$Res call({
 String id, int? partNumber, PackagePieceOrderItemModel? orderItem
});


$PackagePieceOrderItemModelCopyWith<$Res>? get orderItem;

}
/// @nodoc
class _$PackagePiecePartModelCopyWithImpl<$Res>
    implements $PackagePiecePartModelCopyWith<$Res> {
  _$PackagePiecePartModelCopyWithImpl(this._self, this._then);

  final PackagePiecePartModel _self;
  final $Res Function(PackagePiecePartModel) _then;

/// Create a copy of PackagePiecePartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? partNumber = freezed,Object? orderItem = freezed,}) {
  return _then(PackagePiecePartModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partNumber: freezed == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as int?,orderItem: freezed == orderItem ? _self.orderItem : orderItem // ignore: cast_nullable_to_non_nullable
as PackagePieceOrderItemModel?,
  ));
}
/// Create a copy of PackagePiecePartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackagePieceOrderItemModelCopyWith<$Res>? get orderItem {
    if (_self.orderItem == null) {
    return null;
  }

  return $PackagePieceOrderItemModelCopyWith<$Res>(_self.orderItem!, (value) {
    return _then(_self.copyWith(orderItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackagePiecePartModel].
extension PackagePiecePartModelPatterns on PackagePiecePartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackagePiecePartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackagePiecePartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackagePiecePartModel value)  $default,){
final _that = this;
switch (_that) {
case _PackagePiecePartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackagePiecePartModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackagePiecePartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int? partNumber,  PackagePieceOrderItemModel? orderItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackagePiecePartModel() when $default != null:
return $default(_that.id,_that.partNumber,_that.orderItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int? partNumber,  PackagePieceOrderItemModel? orderItem)  $default,) {final _that = this;
switch (_that) {
case _PackagePiecePartModel():
return $default(_that.id,_that.partNumber,_that.orderItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int? partNumber,  PackagePieceOrderItemModel? orderItem)?  $default,) {final _that = this;
switch (_that) {
case _PackagePiecePartModel() when $default != null:
return $default(_that.id,_that.partNumber,_that.orderItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackagePiecePartModel implements PackagePiecePartModel {
  const _PackagePiecePartModel({required this.id, this.partNumber, this.orderItem});
  factory _PackagePiecePartModel.fromJson(Map<String, dynamic> json) => _$PackagePiecePartModelFromJson(json);

@override final  String id;
@override final  int? partNumber;
@override final  PackagePieceOrderItemModel? orderItem;

/// Create a copy of PackagePiecePartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackagePiecePartModelCopyWith<_PackagePiecePartModel> get copyWith => __$PackagePiecePartModelCopyWithImpl<_PackagePiecePartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackagePiecePartModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackagePiecePartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.partNumber, partNumber) || other.partNumber == partNumber)&&(identical(other.orderItem, orderItem) || other.orderItem == orderItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,partNumber,orderItem);
}

@override
String toString() {
    return 'PackagePiecePartModel(id: $id, partNumber: $partNumber, orderItem: $orderItem)';
}


}

/// @nodoc
abstract mixin class _$PackagePiecePartModelCopyWith<$Res> implements $PackagePiecePartModelCopyWith<$Res> {
  factory _$PackagePiecePartModelCopyWith(_PackagePiecePartModel value, $Res Function(_PackagePiecePartModel) _then) = __$PackagePiecePartModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int? partNumber, PackagePieceOrderItemModel? orderItem
});


@override $PackagePieceOrderItemModelCopyWith<$Res>? get orderItem;

}
/// @nodoc
class __$PackagePiecePartModelCopyWithImpl<$Res>
    implements _$PackagePiecePartModelCopyWith<$Res> {
  __$PackagePiecePartModelCopyWithImpl(this._self, this._then);

  final _PackagePiecePartModel _self;
  final $Res Function(_PackagePiecePartModel) _then;

/// Create a copy of PackagePiecePartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? partNumber = freezed,Object? orderItem = freezed,}) {
  return _then(_PackagePiecePartModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partNumber: freezed == partNumber ? _self.partNumber : partNumber // ignore: cast_nullable_to_non_nullable
as int?,orderItem: freezed == orderItem ? _self.orderItem : orderItem // ignore: cast_nullable_to_non_nullable
as PackagePieceOrderItemModel?,
  ));
}

/// Create a copy of PackagePiecePartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackagePieceOrderItemModelCopyWith<$Res>? get orderItem {
    if (_self.orderItem == null) {
    return null;
  }

  return $PackagePieceOrderItemModelCopyWith<$Res>(_self.orderItem!, (value) {
    return _then(_self.copyWith(orderItem: value));
  });
}
}


/// @nodoc
mixin _$PackagePieceOrderItemModel {

 String get id; String get name;
/// Create a copy of PackagePieceOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackagePieceOrderItemModelCopyWith<PackagePieceOrderItemModel> get copyWith => _$PackagePieceOrderItemModelCopyWithImpl<PackagePieceOrderItemModel>(this as PackagePieceOrderItemModel, _$identity);

  /// Serializes this PackagePieceOrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PackagePieceOrderItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackagePieceOrderItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PackagePieceOrderItemModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as PackagePieceOrderItemModel;
  return 'PackagePieceOrderItemModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $PackagePieceOrderItemModelCopyWith<$Res>  {
  factory $PackagePieceOrderItemModelCopyWith(PackagePieceOrderItemModel value, $Res Function(PackagePieceOrderItemModel) _then) = _$PackagePieceOrderItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$PackagePieceOrderItemModelCopyWithImpl<$Res>
    implements $PackagePieceOrderItemModelCopyWith<$Res> {
  _$PackagePieceOrderItemModelCopyWithImpl(this._self, this._then);

  final PackagePieceOrderItemModel _self;
  final $Res Function(PackagePieceOrderItemModel) _then;

/// Create a copy of PackagePieceOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(PackagePieceOrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PackagePieceOrderItemModel].
extension PackagePieceOrderItemModelPatterns on PackagePieceOrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackagePieceOrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackagePieceOrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackagePieceOrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PackagePieceOrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackagePieceOrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackagePieceOrderItemModel() when $default != null:
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
case _PackagePieceOrderItemModel() when $default != null:
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
case _PackagePieceOrderItemModel():
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
case _PackagePieceOrderItemModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackagePieceOrderItemModel implements PackagePieceOrderItemModel {
  const _PackagePieceOrderItemModel({required this.id, required this.name});
  factory _PackagePieceOrderItemModel.fromJson(Map<String, dynamic> json) => _$PackagePieceOrderItemModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of PackagePieceOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackagePieceOrderItemModelCopyWith<_PackagePieceOrderItemModel> get copyWith => __$PackagePieceOrderItemModelCopyWithImpl<_PackagePieceOrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackagePieceOrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackagePieceOrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'PackagePieceOrderItemModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$PackagePieceOrderItemModelCopyWith<$Res> implements $PackagePieceOrderItemModelCopyWith<$Res> {
  factory _$PackagePieceOrderItemModelCopyWith(_PackagePieceOrderItemModel value, $Res Function(_PackagePieceOrderItemModel) _then) = __$PackagePieceOrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$PackagePieceOrderItemModelCopyWithImpl<$Res>
    implements _$PackagePieceOrderItemModelCopyWith<$Res> {
  __$PackagePieceOrderItemModelCopyWithImpl(this._self, this._then);

  final _PackagePieceOrderItemModel _self;
  final $Res Function(_PackagePieceOrderItemModel) _then;

/// Create a copy of PackagePieceOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_PackagePieceOrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
