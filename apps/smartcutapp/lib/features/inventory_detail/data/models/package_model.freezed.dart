// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageModel {

 int get id; String get shipmentId; String get packageNo; double? get weight; double? get length; double? get width; double? get height; PackageStatus get status; DateTime get createdAt; DateTime get updatedAt; List<PackageItemModel> get items;
/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageModelCopyWith<PackageModel> get copyWith => _$PackageModelCopyWithImpl<PackageModel>(this as PackageModel, _$identity);

  /// Serializes this PackageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PackageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.shipmentId, _this.shipmentId) || other.shipmentId == _this.shipmentId)&&(identical(other.packageNo, _this.packageNo) || other.packageNo == _this.packageNo)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.length, _this.length) || other.length == _this.length)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PackageModel;
  return Object.hash(runtimeType,_this.id,_this.shipmentId,_this.packageNo,_this.weight,_this.length,_this.width,_this.height,_this.status,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as PackageModel;
  return 'PackageModel(id: ${_this.id}, shipmentId: ${_this.shipmentId}, packageNo: ${_this.packageNo}, weight: ${_this.weight}, length: ${_this.length}, width: ${_this.width}, height: ${_this.height}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $PackageModelCopyWith<$Res>  {
  factory $PackageModelCopyWith(PackageModel value, $Res Function(PackageModel) _then) = _$PackageModelCopyWithImpl;
@useResult
$Res call({
 int id, String shipmentId, String packageNo, double? weight, double? length, double? width, double? height, PackageStatus status, DateTime createdAt, DateTime updatedAt, List<PackageItemModel> items
});




}
/// @nodoc
class _$PackageModelCopyWithImpl<$Res>
    implements $PackageModelCopyWith<$Res> {
  _$PackageModelCopyWithImpl(this._self, this._then);

  final PackageModel _self;
  final $Res Function(PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shipmentId = null,Object? packageNo = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? items = null,}) {
  return _then(PackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,shipmentId: null == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String,packageNo: null == packageNo ? _self.packageNo : packageNo // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PackageStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PackageItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageModel].
extension PackageModelPatterns on PackageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String shipmentId,  String packageNo,  double? weight,  double? length,  double? width,  double? height,  PackageStatus status,  DateTime createdAt,  DateTime updatedAt,  List<PackageItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.shipmentId,_that.packageNo,_that.weight,_that.length,_that.width,_that.height,_that.status,_that.createdAt,_that.updatedAt,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String shipmentId,  String packageNo,  double? weight,  double? length,  double? width,  double? height,  PackageStatus status,  DateTime createdAt,  DateTime updatedAt,  List<PackageItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _PackageModel():
return $default(_that.id,_that.shipmentId,_that.packageNo,_that.weight,_that.length,_that.width,_that.height,_that.status,_that.createdAt,_that.updatedAt,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String shipmentId,  String packageNo,  double? weight,  double? length,  double? width,  double? height,  PackageStatus status,  DateTime createdAt,  DateTime updatedAt,  List<PackageItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.shipmentId,_that.packageNo,_that.weight,_that.length,_that.width,_that.height,_that.status,_that.createdAt,_that.updatedAt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageModel implements PackageModel {
  const _PackageModel({required this.id, required this.shipmentId, required this.packageNo, this.weight, this.length, this.width, this.height, required this.status, required this.createdAt, required this.updatedAt,  List<PackageItemModel> items = const []}): _items = items;
  factory _PackageModel.fromJson(Map<String, dynamic> json) => _$PackageModelFromJson(json);

@override final  int id;
@override final  String shipmentId;
@override final  String packageNo;
@override final  double? weight;
@override final  double? length;
@override final  double? width;
@override final  double? height;
@override final  PackageStatus status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<PackageItemModel> _items;
@override@JsonKey() List<PackageItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageModelCopyWith<_PackageModel> get copyWith => __$PackageModelCopyWithImpl<_PackageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.shipmentId, shipmentId) || other.shipmentId == shipmentId)&&(identical(other.packageNo, packageNo) || other.packageNo == packageNo)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,shipmentId,packageNo,weight,length,width,height,status,createdAt,updatedAt,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'PackageModel(id: $id, shipmentId: $shipmentId, packageNo: $packageNo, weight: $weight, length: $length, width: $width, height: $height, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PackageModelCopyWith<$Res> implements $PackageModelCopyWith<$Res> {
  factory _$PackageModelCopyWith(_PackageModel value, $Res Function(_PackageModel) _then) = __$PackageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String shipmentId, String packageNo, double? weight, double? length, double? width, double? height, PackageStatus status, DateTime createdAt, DateTime updatedAt, List<PackageItemModel> items
});




}
/// @nodoc
class __$PackageModelCopyWithImpl<$Res>
    implements _$PackageModelCopyWith<$Res> {
  __$PackageModelCopyWithImpl(this._self, this._then);

  final _PackageModel _self;
  final $Res Function(_PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shipmentId = null,Object? packageNo = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? items = null,}) {
  return _then(_PackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,shipmentId: null == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String,packageNo: null == packageNo ? _self.packageNo : packageNo // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PackageStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PackageItemModel>,
  ));
}


}

// dart format on
