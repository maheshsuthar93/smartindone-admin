// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageItemModel {

 String get id; String get packageId; String get pieceId; PieceModel? get piece;
/// Create a copy of PackageItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageItemModelCopyWith<PackageItemModel> get copyWith => _$PackageItemModelCopyWithImpl<PackageItemModel>(this as PackageItemModel, _$identity);

  /// Serializes this PackageItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PackageItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.packageId, _this.packageId) || other.packageId == _this.packageId)&&(identical(other.pieceId, _this.pieceId) || other.pieceId == _this.pieceId)&&(identical(other.piece, _this.piece) || other.piece == _this.piece));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PackageItemModel;
  return Object.hash(runtimeType,_this.id,_this.packageId,_this.pieceId,_this.piece);
}

@override
String toString() {
  final _this = this as PackageItemModel;
  return 'PackageItemModel(id: ${_this.id}, packageId: ${_this.packageId}, pieceId: ${_this.pieceId}, piece: ${_this.piece})';
}


}

/// @nodoc
abstract mixin class $PackageItemModelCopyWith<$Res>  {
  factory $PackageItemModelCopyWith(PackageItemModel value, $Res Function(PackageItemModel) _then) = _$PackageItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String packageId, String pieceId, PieceModel? piece
});


$PieceModelCopyWith<$Res>? get piece;

}
/// @nodoc
class _$PackageItemModelCopyWithImpl<$Res>
    implements $PackageItemModelCopyWith<$Res> {
  _$PackageItemModelCopyWithImpl(this._self, this._then);

  final PackageItemModel _self;
  final $Res Function(PackageItemModel) _then;

/// Create a copy of PackageItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? packageId = null,Object? pieceId = null,Object? piece = freezed,}) {
  return _then(PackageItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,pieceId: null == pieceId ? _self.pieceId : pieceId // ignore: cast_nullable_to_non_nullable
as String,piece: freezed == piece ? _self.piece : piece // ignore: cast_nullable_to_non_nullable
as PieceModel?,
  ));
}
/// Create a copy of PackageItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieceModelCopyWith<$Res>? get piece {
    if (_self.piece == null) {
    return null;
  }

  return $PieceModelCopyWith<$Res>(_self.piece!, (value) {
    return _then(_self.copyWith(piece: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackageItemModel].
extension PackageItemModelPatterns on PackageItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String packageId,  String pieceId,  PieceModel? piece)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageItemModel() when $default != null:
return $default(_that.id,_that.packageId,_that.pieceId,_that.piece);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String packageId,  String pieceId,  PieceModel? piece)  $default,) {final _that = this;
switch (_that) {
case _PackageItemModel():
return $default(_that.id,_that.packageId,_that.pieceId,_that.piece);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String packageId,  String pieceId,  PieceModel? piece)?  $default,) {final _that = this;
switch (_that) {
case _PackageItemModel() when $default != null:
return $default(_that.id,_that.packageId,_that.pieceId,_that.piece);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageItemModel implements PackageItemModel {
  const _PackageItemModel({required this.id, required this.packageId, required this.pieceId, this.piece});
  factory _PackageItemModel.fromJson(Map<String, dynamic> json) => _$PackageItemModelFromJson(json);

@override final  String id;
@override final  String packageId;
@override final  String pieceId;
@override final  PieceModel? piece;

/// Create a copy of PackageItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageItemModelCopyWith<_PackageItemModel> get copyWith => __$PackageItemModelCopyWithImpl<_PackageItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.pieceId, pieceId) || other.pieceId == pieceId)&&(identical(other.piece, piece) || other.piece == piece));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,packageId,pieceId,piece);
}

@override
String toString() {
    return 'PackageItemModel(id: $id, packageId: $packageId, pieceId: $pieceId, piece: $piece)';
}


}

/// @nodoc
abstract mixin class _$PackageItemModelCopyWith<$Res> implements $PackageItemModelCopyWith<$Res> {
  factory _$PackageItemModelCopyWith(_PackageItemModel value, $Res Function(_PackageItemModel) _then) = __$PackageItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String packageId, String pieceId, PieceModel? piece
});


@override $PieceModelCopyWith<$Res>? get piece;

}
/// @nodoc
class __$PackageItemModelCopyWithImpl<$Res>
    implements _$PackageItemModelCopyWith<$Res> {
  __$PackageItemModelCopyWithImpl(this._self, this._then);

  final _PackageItemModel _self;
  final $Res Function(_PackageItemModel) _then;

/// Create a copy of PackageItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? packageId = null,Object? pieceId = null,Object? piece = freezed,}) {
  return _then(_PackageItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,pieceId: null == pieceId ? _self.pieceId : pieceId // ignore: cast_nullable_to_non_nullable
as String,piece: freezed == piece ? _self.piece : piece // ignore: cast_nullable_to_non_nullable
as PieceModel?,
  ));
}

/// Create a copy of PackageItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieceModelCopyWith<$Res>? get piece {
    if (_self.piece == null) {
    return null;
  }

  return $PieceModelCopyWith<$Res>(_self.piece!, (value) {
    return _then(_self.copyWith(piece: value));
  });
}
}

// dart format on
