// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetailModel {

 String get id; String get orderCode; DateTime get createdAt; OrderStatus get status; String? get description; int? get totalItems; int? get totalPieces; DateTime get deliveryDate; OrderDetailProjectModel get project; OrderDetailCustomerModel get customer; OrderDetailsCountsModel get counts;
/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailModelCopyWith<OrderDetailModel> get copyWith => _$OrderDetailModelCopyWithImpl<OrderDetailModel>(this as OrderDetailModel, _$identity);

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderCode, _this.orderCode) || other.orderCode == _this.orderCode)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.totalItems, _this.totalItems) || other.totalItems == _this.totalItems)&&(identical(other.totalPieces, _this.totalPieces) || other.totalPieces == _this.totalPieces)&&(identical(other.deliveryDate, _this.deliveryDate) || other.deliveryDate == _this.deliveryDate)&&(identical(other.project, _this.project) || other.project == _this.project)&&(identical(other.customer, _this.customer) || other.customer == _this.customer)&&(identical(other.counts, _this.counts) || other.counts == _this.counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDetailModel;
  return Object.hash(runtimeType,_this.id,_this.orderCode,_this.createdAt,_this.status,_this.description,_this.totalItems,_this.totalPieces,_this.deliveryDate,_this.project,_this.customer,_this.counts);
}

@override
String toString() {
  final _this = this as OrderDetailModel;
  return 'OrderDetailModel(id: ${_this.id}, orderCode: ${_this.orderCode}, createdAt: ${_this.createdAt}, status: ${_this.status}, description: ${_this.description}, totalItems: ${_this.totalItems}, totalPieces: ${_this.totalPieces}, deliveryDate: ${_this.deliveryDate}, project: ${_this.project}, customer: ${_this.customer}, counts: ${_this.counts})';
}


}

/// @nodoc
abstract mixin class $OrderDetailModelCopyWith<$Res>  {
  factory $OrderDetailModelCopyWith(OrderDetailModel value, $Res Function(OrderDetailModel) _then) = _$OrderDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderCode, DateTime createdAt, OrderStatus status, String? description, int? totalItems, int? totalPieces, DateTime deliveryDate, OrderDetailProjectModel project, OrderDetailCustomerModel customer, OrderDetailsCountsModel counts
});


$OrderDetailProjectModelCopyWith<$Res> get project;$OrderDetailCustomerModelCopyWith<$Res> get customer;$OrderDetailsCountsModelCopyWith<$Res> get counts;

}
/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._self, this._then);

  final OrderDetailModel _self;
  final $Res Function(OrderDetailModel) _then;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderCode = null,Object? createdAt = null,Object? status = null,Object? description = freezed,Object? totalItems = freezed,Object? totalPieces = freezed,Object? deliveryDate = null,Object? project = null,Object? customer = null,Object? counts = null,}) {
  return _then(OrderDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,totalItems: freezed == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int?,totalPieces: freezed == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int?,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as OrderDetailProjectModel,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as OrderDetailCustomerModel,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as OrderDetailsCountsModel,
  ));
}
/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailProjectModelCopyWith<$Res> get project {
  
  return $OrderDetailProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCustomerModelCopyWith<$Res> get customer {
  
  return $OrderDetailCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailsCountsModelCopyWith<$Res> get counts {
  
  return $OrderDetailsCountsModelCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetailModel].
extension OrderDetailModelPatterns on OrderDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderCode,  DateTime createdAt,  OrderStatus status,  String? description,  int? totalItems,  int? totalPieces,  DateTime deliveryDate,  OrderDetailProjectModel project,  OrderDetailCustomerModel customer,  OrderDetailsCountsModel counts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.createdAt,_that.status,_that.description,_that.totalItems,_that.totalPieces,_that.deliveryDate,_that.project,_that.customer,_that.counts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderCode,  DateTime createdAt,  OrderStatus status,  String? description,  int? totalItems,  int? totalPieces,  DateTime deliveryDate,  OrderDetailProjectModel project,  OrderDetailCustomerModel customer,  OrderDetailsCountsModel counts)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailModel():
return $default(_that.id,_that.orderCode,_that.createdAt,_that.status,_that.description,_that.totalItems,_that.totalPieces,_that.deliveryDate,_that.project,_that.customer,_that.counts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderCode,  DateTime createdAt,  OrderStatus status,  String? description,  int? totalItems,  int? totalPieces,  DateTime deliveryDate,  OrderDetailProjectModel project,  OrderDetailCustomerModel customer,  OrderDetailsCountsModel counts)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.createdAt,_that.status,_that.description,_that.totalItems,_that.totalPieces,_that.deliveryDate,_that.project,_that.customer,_that.counts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailModel implements OrderDetailModel {
  const _OrderDetailModel({required this.id, required this.orderCode, required this.createdAt, required this.status, this.description, this.totalItems, this.totalPieces, required this.deliveryDate, required this.project, required this.customer, required this.counts});
  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) => _$OrderDetailModelFromJson(json);

@override final  String id;
@override final  String orderCode;
@override final  DateTime createdAt;
@override final  OrderStatus status;
@override final  String? description;
@override final  int? totalItems;
@override final  int? totalPieces;
@override final  DateTime deliveryDate;
@override final  OrderDetailProjectModel project;
@override final  OrderDetailCustomerModel customer;
@override final  OrderDetailsCountsModel counts;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailModelCopyWith<_OrderDetailModel> get copyWith => __$OrderDetailModelCopyWithImpl<_OrderDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.totalPieces, totalPieces) || other.totalPieces == totalPieces)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.project, project) || other.project == project)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.counts, counts) || other.counts == counts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderCode,createdAt,status,description,totalItems,totalPieces,deliveryDate,project,customer,counts);
}

@override
String toString() {
    return 'OrderDetailModel(id: $id, orderCode: $orderCode, createdAt: $createdAt, status: $status, description: $description, totalItems: $totalItems, totalPieces: $totalPieces, deliveryDate: $deliveryDate, project: $project, customer: $customer, counts: $counts)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailModelCopyWith<$Res> implements $OrderDetailModelCopyWith<$Res> {
  factory _$OrderDetailModelCopyWith(_OrderDetailModel value, $Res Function(_OrderDetailModel) _then) = __$OrderDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderCode, DateTime createdAt, OrderStatus status, String? description, int? totalItems, int? totalPieces, DateTime deliveryDate, OrderDetailProjectModel project, OrderDetailCustomerModel customer, OrderDetailsCountsModel counts
});


@override $OrderDetailProjectModelCopyWith<$Res> get project;@override $OrderDetailCustomerModelCopyWith<$Res> get customer;@override $OrderDetailsCountsModelCopyWith<$Res> get counts;

}
/// @nodoc
class __$OrderDetailModelCopyWithImpl<$Res>
    implements _$OrderDetailModelCopyWith<$Res> {
  __$OrderDetailModelCopyWithImpl(this._self, this._then);

  final _OrderDetailModel _self;
  final $Res Function(_OrderDetailModel) _then;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderCode = null,Object? createdAt = null,Object? status = null,Object? description = freezed,Object? totalItems = freezed,Object? totalPieces = freezed,Object? deliveryDate = null,Object? project = null,Object? customer = null,Object? counts = null,}) {
  return _then(_OrderDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,totalItems: freezed == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int?,totalPieces: freezed == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int?,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as OrderDetailProjectModel,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as OrderDetailCustomerModel,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as OrderDetailsCountsModel,
  ));
}

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailProjectModelCopyWith<$Res> get project {
  
  return $OrderDetailProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailCustomerModelCopyWith<$Res> get customer {
  
  return $OrderDetailCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDetailsCountsModelCopyWith<$Res> get counts {
  
  return $OrderDetailsCountsModelCopyWith<$Res>(_self.counts, (value) {
    return _then(_self.copyWith(counts: value));
  });
}
}


/// @nodoc
mixin _$OrderDetailsCountsModel {

 int get totalItems; int get totalParts; int get totalPieces;
/// Create a copy of OrderDetailsCountsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsCountsModelCopyWith<OrderDetailsCountsModel> get copyWith => _$OrderDetailsCountsModelCopyWithImpl<OrderDetailsCountsModel>(this as OrderDetailsCountsModel, _$identity);

  /// Serializes this OrderDetailsCountsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDetailsCountsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsCountsModel&&(identical(other.totalItems, _this.totalItems) || other.totalItems == _this.totalItems)&&(identical(other.totalParts, _this.totalParts) || other.totalParts == _this.totalParts)&&(identical(other.totalPieces, _this.totalPieces) || other.totalPieces == _this.totalPieces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDetailsCountsModel;
  return Object.hash(runtimeType,_this.totalItems,_this.totalParts,_this.totalPieces);
}

@override
String toString() {
  final _this = this as OrderDetailsCountsModel;
  return 'OrderDetailsCountsModel(totalItems: ${_this.totalItems}, totalParts: ${_this.totalParts}, totalPieces: ${_this.totalPieces})';
}


}

/// @nodoc
abstract mixin class $OrderDetailsCountsModelCopyWith<$Res>  {
  factory $OrderDetailsCountsModelCopyWith(OrderDetailsCountsModel value, $Res Function(OrderDetailsCountsModel) _then) = _$OrderDetailsCountsModelCopyWithImpl;
@useResult
$Res call({
 int totalItems, int totalParts, int totalPieces
});




}
/// @nodoc
class _$OrderDetailsCountsModelCopyWithImpl<$Res>
    implements $OrderDetailsCountsModelCopyWith<$Res> {
  _$OrderDetailsCountsModelCopyWithImpl(this._self, this._then);

  final OrderDetailsCountsModel _self;
  final $Res Function(OrderDetailsCountsModel) _then;

/// Create a copy of OrderDetailsCountsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalItems = null,Object? totalParts = null,Object? totalPieces = null,}) {
  return _then(OrderDetailsCountsModel(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,totalParts: null == totalParts ? _self.totalParts : totalParts // ignore: cast_nullable_to_non_nullable
as int,totalPieces: null == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDetailsCountsModel].
extension OrderDetailsCountsModelPatterns on OrderDetailsCountsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailsCountsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailsCountsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailsCountsModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailsCountsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailsCountsModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailsCountsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalItems,  int totalParts,  int totalPieces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailsCountsModel() when $default != null:
return $default(_that.totalItems,_that.totalParts,_that.totalPieces);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalItems,  int totalParts,  int totalPieces)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailsCountsModel():
return $default(_that.totalItems,_that.totalParts,_that.totalPieces);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalItems,  int totalParts,  int totalPieces)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailsCountsModel() when $default != null:
return $default(_that.totalItems,_that.totalParts,_that.totalPieces);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailsCountsModel implements OrderDetailsCountsModel {
  const _OrderDetailsCountsModel({required this.totalItems, required this.totalParts, required this.totalPieces});
  factory _OrderDetailsCountsModel.fromJson(Map<String, dynamic> json) => _$OrderDetailsCountsModelFromJson(json);

@override final  int totalItems;
@override final  int totalParts;
@override final  int totalPieces;

/// Create a copy of OrderDetailsCountsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailsCountsModelCopyWith<_OrderDetailsCountsModel> get copyWith => __$OrderDetailsCountsModelCopyWithImpl<_OrderDetailsCountsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailsCountsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailsCountsModel&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.totalParts, totalParts) || other.totalParts == totalParts)&&(identical(other.totalPieces, totalPieces) || other.totalPieces == totalPieces));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalItems,totalParts,totalPieces);
}

@override
String toString() {
    return 'OrderDetailsCountsModel(totalItems: $totalItems, totalParts: $totalParts, totalPieces: $totalPieces)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailsCountsModelCopyWith<$Res> implements $OrderDetailsCountsModelCopyWith<$Res> {
  factory _$OrderDetailsCountsModelCopyWith(_OrderDetailsCountsModel value, $Res Function(_OrderDetailsCountsModel) _then) = __$OrderDetailsCountsModelCopyWithImpl;
@override @useResult
$Res call({
 int totalItems, int totalParts, int totalPieces
});




}
/// @nodoc
class __$OrderDetailsCountsModelCopyWithImpl<$Res>
    implements _$OrderDetailsCountsModelCopyWith<$Res> {
  __$OrderDetailsCountsModelCopyWithImpl(this._self, this._then);

  final _OrderDetailsCountsModel _self;
  final $Res Function(_OrderDetailsCountsModel) _then;

/// Create a copy of OrderDetailsCountsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalItems = null,Object? totalParts = null,Object? totalPieces = null,}) {
  return _then(_OrderDetailsCountsModel(
totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,totalParts: null == totalParts ? _self.totalParts : totalParts // ignore: cast_nullable_to_non_nullable
as int,totalPieces: null == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
