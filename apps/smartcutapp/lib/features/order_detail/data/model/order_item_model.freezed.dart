// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {

 String get id; String get orderId; String get name; DateTime get createdAt; int get quantity; int? get overallWidth; int? get overallHeight; int? get overallDepth; ProductionModel get production;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.overallWidth, _this.overallWidth) || other.overallWidth == _this.overallWidth)&&(identical(other.overallHeight, _this.overallHeight) || other.overallHeight == _this.overallHeight)&&(identical(other.overallDepth, _this.overallDepth) || other.overallDepth == _this.overallDepth)&&(identical(other.production, _this.production) || other.production == _this.production));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderItemModel;
  return Object.hash(runtimeType,_this.id,_this.orderId,_this.name,_this.createdAt,_this.quantity,_this.overallWidth,_this.overallHeight,_this.overallDepth,_this.production);
}

@override
String toString() {
  final _this = this as OrderItemModel;
  return 'OrderItemModel(id: ${_this.id}, orderId: ${_this.orderId}, name: ${_this.name}, createdAt: ${_this.createdAt}, quantity: ${_this.quantity}, overallWidth: ${_this.overallWidth}, overallHeight: ${_this.overallHeight}, overallDepth: ${_this.overallDepth}, production: ${_this.production})';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String name, DateTime createdAt, int quantity, int? overallWidth, int? overallHeight, int? overallDepth, ProductionModel production
});


$ProductionModelCopyWith<$Res> get production;

}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? name = null,Object? createdAt = null,Object? quantity = null,Object? overallWidth = freezed,Object? overallHeight = freezed,Object? overallDepth = freezed,Object? production = null,}) {
  return _then(OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,overallWidth: freezed == overallWidth ? _self.overallWidth : overallWidth // ignore: cast_nullable_to_non_nullable
as int?,overallHeight: freezed == overallHeight ? _self.overallHeight : overallHeight // ignore: cast_nullable_to_non_nullable
as int?,overallDepth: freezed == overallDepth ? _self.overallDepth : overallDepth // ignore: cast_nullable_to_non_nullable
as int?,production: null == production ? _self.production : production // ignore: cast_nullable_to_non_nullable
as ProductionModel,
  ));
}
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductionModelCopyWith<$Res> get production {
  
  return $ProductionModelCopyWith<$Res>(_self.production, (value) {
    return _then(_self.copyWith(production: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String name,  DateTime createdAt,  int quantity,  int? overallWidth,  int? overallHeight,  int? overallDepth,  ProductionModel production)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.orderId,_that.name,_that.createdAt,_that.quantity,_that.overallWidth,_that.overallHeight,_that.overallDepth,_that.production);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String name,  DateTime createdAt,  int quantity,  int? overallWidth,  int? overallHeight,  int? overallDepth,  ProductionModel production)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that.id,_that.orderId,_that.name,_that.createdAt,_that.quantity,_that.overallWidth,_that.overallHeight,_that.overallDepth,_that.production);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String name,  DateTime createdAt,  int quantity,  int? overallWidth,  int? overallHeight,  int? overallDepth,  ProductionModel production)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.orderId,_that.name,_that.createdAt,_that.quantity,_that.overallWidth,_that.overallHeight,_that.overallDepth,_that.production);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel implements OrderItemModel {
  const _OrderItemModel({required this.id, required this.orderId, required this.name, required this.createdAt, required this.quantity, this.overallWidth, this.overallHeight, this.overallDepth, required this.production});
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override final  String id;
@override final  String orderId;
@override final  String name;
@override final  DateTime createdAt;
@override final  int quantity;
@override final  int? overallWidth;
@override final  int? overallHeight;
@override final  int? overallDepth;
@override final  ProductionModel production;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.overallWidth, overallWidth) || other.overallWidth == overallWidth)&&(identical(other.overallHeight, overallHeight) || other.overallHeight == overallHeight)&&(identical(other.overallDepth, overallDepth) || other.overallDepth == overallDepth)&&(identical(other.production, production) || other.production == production));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderId,name,createdAt,quantity,overallWidth,overallHeight,overallDepth,production);
}

@override
String toString() {
    return 'OrderItemModel(id: $id, orderId: $orderId, name: $name, createdAt: $createdAt, quantity: $quantity, overallWidth: $overallWidth, overallHeight: $overallHeight, overallDepth: $overallDepth, production: $production)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String name, DateTime createdAt, int quantity, int? overallWidth, int? overallHeight, int? overallDepth, ProductionModel production
});


@override $ProductionModelCopyWith<$Res> get production;

}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? name = null,Object? createdAt = null,Object? quantity = null,Object? overallWidth = freezed,Object? overallHeight = freezed,Object? overallDepth = freezed,Object? production = null,}) {
  return _then(_OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,overallWidth: freezed == overallWidth ? _self.overallWidth : overallWidth // ignore: cast_nullable_to_non_nullable
as int?,overallHeight: freezed == overallHeight ? _self.overallHeight : overallHeight // ignore: cast_nullable_to_non_nullable
as int?,overallDepth: freezed == overallDepth ? _self.overallDepth : overallDepth // ignore: cast_nullable_to_non_nullable
as int?,production: null == production ? _self.production : production // ignore: cast_nullable_to_non_nullable
as ProductionModel,
  ));
}

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductionModelCopyWith<$Res> get production {
  
  return $ProductionModelCopyWith<$Res>(_self.production, (value) {
    return _then(_self.copyWith(production: value));
  });
}
}


/// @nodoc
mixin _$ProductionModel {

 ItemStatus get status; int get totalPieces; int get completedPieces; int get pendingPieces; double get progressPercent;
/// Create a copy of ProductionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionModelCopyWith<ProductionModel> get copyWith => _$ProductionModelCopyWithImpl<ProductionModel>(this as ProductionModel, _$identity);

  /// Serializes this ProductionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.totalPieces, _this.totalPieces) || other.totalPieces == _this.totalPieces)&&(identical(other.completedPieces, _this.completedPieces) || other.completedPieces == _this.completedPieces)&&(identical(other.pendingPieces, _this.pendingPieces) || other.pendingPieces == _this.pendingPieces)&&(identical(other.progressPercent, _this.progressPercent) || other.progressPercent == _this.progressPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductionModel;
  return Object.hash(runtimeType,_this.status,_this.totalPieces,_this.completedPieces,_this.pendingPieces,_this.progressPercent);
}

@override
String toString() {
  final _this = this as ProductionModel;
  return 'ProductionModel(status: ${_this.status}, totalPieces: ${_this.totalPieces}, completedPieces: ${_this.completedPieces}, pendingPieces: ${_this.pendingPieces}, progressPercent: ${_this.progressPercent})';
}


}

/// @nodoc
abstract mixin class $ProductionModelCopyWith<$Res>  {
  factory $ProductionModelCopyWith(ProductionModel value, $Res Function(ProductionModel) _then) = _$ProductionModelCopyWithImpl;
@useResult
$Res call({
 ItemStatus status, int totalPieces, int completedPieces, int pendingPieces, double progressPercent
});




}
/// @nodoc
class _$ProductionModelCopyWithImpl<$Res>
    implements $ProductionModelCopyWith<$Res> {
  _$ProductionModelCopyWithImpl(this._self, this._then);

  final ProductionModel _self;
  final $Res Function(ProductionModel) _then;

/// Create a copy of ProductionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? totalPieces = null,Object? completedPieces = null,Object? pendingPieces = null,Object? progressPercent = null,}) {
  return _then(ProductionModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ItemStatus,totalPieces: null == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int,completedPieces: null == completedPieces ? _self.completedPieces : completedPieces // ignore: cast_nullable_to_non_nullable
as int,pendingPieces: null == pendingPieces ? _self.pendingPieces : pendingPieces // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionModel].
extension ProductionModelPatterns on ProductionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ItemStatus status,  int totalPieces,  int completedPieces,  int pendingPieces,  double progressPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionModel() when $default != null:
return $default(_that.status,_that.totalPieces,_that.completedPieces,_that.pendingPieces,_that.progressPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ItemStatus status,  int totalPieces,  int completedPieces,  int pendingPieces,  double progressPercent)  $default,) {final _that = this;
switch (_that) {
case _ProductionModel():
return $default(_that.status,_that.totalPieces,_that.completedPieces,_that.pendingPieces,_that.progressPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ItemStatus status,  int totalPieces,  int completedPieces,  int pendingPieces,  double progressPercent)?  $default,) {final _that = this;
switch (_that) {
case _ProductionModel() when $default != null:
return $default(_that.status,_that.totalPieces,_that.completedPieces,_that.pendingPieces,_that.progressPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionModel implements ProductionModel {
  const _ProductionModel({required this.status, required this.totalPieces, required this.completedPieces, required this.pendingPieces, required this.progressPercent});
  factory _ProductionModel.fromJson(Map<String, dynamic> json) => _$ProductionModelFromJson(json);

@override final  ItemStatus status;
@override final  int totalPieces;
@override final  int completedPieces;
@override final  int pendingPieces;
@override final  double progressPercent;

/// Create a copy of ProductionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionModelCopyWith<_ProductionModel> get copyWith => __$ProductionModelCopyWithImpl<_ProductionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionModel&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPieces, totalPieces) || other.totalPieces == totalPieces)&&(identical(other.completedPieces, completedPieces) || other.completedPieces == completedPieces)&&(identical(other.pendingPieces, pendingPieces) || other.pendingPieces == pendingPieces)&&(identical(other.progressPercent, progressPercent) || other.progressPercent == progressPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,totalPieces,completedPieces,pendingPieces,progressPercent);
}

@override
String toString() {
    return 'ProductionModel(status: $status, totalPieces: $totalPieces, completedPieces: $completedPieces, pendingPieces: $pendingPieces, progressPercent: $progressPercent)';
}


}

/// @nodoc
abstract mixin class _$ProductionModelCopyWith<$Res> implements $ProductionModelCopyWith<$Res> {
  factory _$ProductionModelCopyWith(_ProductionModel value, $Res Function(_ProductionModel) _then) = __$ProductionModelCopyWithImpl;
@override @useResult
$Res call({
 ItemStatus status, int totalPieces, int completedPieces, int pendingPieces, double progressPercent
});




}
/// @nodoc
class __$ProductionModelCopyWithImpl<$Res>
    implements _$ProductionModelCopyWith<$Res> {
  __$ProductionModelCopyWithImpl(this._self, this._then);

  final _ProductionModel _self;
  final $Res Function(_ProductionModel) _then;

/// Create a copy of ProductionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? totalPieces = null,Object? completedPieces = null,Object? pendingPieces = null,Object? progressPercent = null,}) {
  return _then(_ProductionModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ItemStatus,totalPieces: null == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int,completedPieces: null == completedPieces ? _self.completedPieces : completedPieces // ignore: cast_nullable_to_non_nullable
as int,pendingPieces: null == pendingPieces ? _self.pendingPieces : pendingPieces // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
