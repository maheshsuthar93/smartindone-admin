// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShipmentModel {

 String get id; String get shipmentNo; String get orderId; String? get driverId; ShipmentStatus get status; DateTime? get dispatchDate; DateTime? get deliveryDate; DateTime? get actualDeliveryDate; DateTime get createdAt; DateTime get updatedAt; List<PackageModel> get packages; OrderModel get order;
/// Create a copy of ShipmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentModelCopyWith<ShipmentModel> get copyWith => _$ShipmentModelCopyWithImpl<ShipmentModel>(this as ShipmentModel, _$identity);

  /// Serializes this ShipmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShipmentModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShipmentModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.shipmentNo, _this.shipmentNo) || other.shipmentNo == _this.shipmentNo)&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.driverId, _this.driverId) || other.driverId == _this.driverId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.dispatchDate, _this.dispatchDate) || other.dispatchDate == _this.dispatchDate)&&(identical(other.deliveryDate, _this.deliveryDate) || other.deliveryDate == _this.deliveryDate)&&(identical(other.actualDeliveryDate, _this.actualDeliveryDate) || other.actualDeliveryDate == _this.actualDeliveryDate)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.packages, _this.packages)&&(identical(other.order, _this.order) || other.order == _this.order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShipmentModel;
  return Object.hash(runtimeType,_this.id,_this.shipmentNo,_this.orderId,_this.driverId,_this.status,_this.dispatchDate,_this.deliveryDate,_this.actualDeliveryDate,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.packages),_this.order);
}

@override
String toString() {
  final _this = this as ShipmentModel;
  return 'ShipmentModel(id: ${_this.id}, shipmentNo: ${_this.shipmentNo}, orderId: ${_this.orderId}, driverId: ${_this.driverId}, status: ${_this.status}, dispatchDate: ${_this.dispatchDate}, deliveryDate: ${_this.deliveryDate}, actualDeliveryDate: ${_this.actualDeliveryDate}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, packages: ${_this.packages}, order: ${_this.order})';
}


}

/// @nodoc
abstract mixin class $ShipmentModelCopyWith<$Res>  {
  factory $ShipmentModelCopyWith(ShipmentModel value, $Res Function(ShipmentModel) _then) = _$ShipmentModelCopyWithImpl;
@useResult
$Res call({
 String id, String shipmentNo, String orderId, String? driverId, ShipmentStatus status, DateTime? dispatchDate, DateTime? deliveryDate, DateTime? actualDeliveryDate, DateTime createdAt, DateTime updatedAt, List<PackageModel> packages, OrderModel order
});


$OrderModelCopyWith<$Res> get order;

}
/// @nodoc
class _$ShipmentModelCopyWithImpl<$Res>
    implements $ShipmentModelCopyWith<$Res> {
  _$ShipmentModelCopyWithImpl(this._self, this._then);

  final ShipmentModel _self;
  final $Res Function(ShipmentModel) _then;

/// Create a copy of ShipmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shipmentNo = null,Object? orderId = null,Object? driverId = freezed,Object? status = null,Object? dispatchDate = freezed,Object? deliveryDate = freezed,Object? actualDeliveryDate = freezed,Object? createdAt = null,Object? updatedAt = null,Object? packages = null,Object? order = null,}) {
  return _then(ShipmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shipmentNo: null == shipmentNo ? _self.shipmentNo : shipmentNo // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShipmentStatus,dispatchDate: freezed == dispatchDate ? _self.dispatchDate : dispatchDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryDate: freezed == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualDeliveryDate: freezed == actualDeliveryDate ? _self.actualDeliveryDate : actualDeliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageModel>,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderModel,
  ));
}
/// Create a copy of ShipmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderModelCopyWith<$Res> get order {
  
  return $OrderModelCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShipmentModel].
extension ShipmentModelPatterns on ShipmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShipmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShipmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShipmentModel value)  $default,){
final _that = this;
switch (_that) {
case _ShipmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShipmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShipmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String shipmentNo,  String orderId,  String? driverId,  ShipmentStatus status,  DateTime? dispatchDate,  DateTime? deliveryDate,  DateTime? actualDeliveryDate,  DateTime createdAt,  DateTime updatedAt,  List<PackageModel> packages,  OrderModel order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShipmentModel() when $default != null:
return $default(_that.id,_that.shipmentNo,_that.orderId,_that.driverId,_that.status,_that.dispatchDate,_that.deliveryDate,_that.actualDeliveryDate,_that.createdAt,_that.updatedAt,_that.packages,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String shipmentNo,  String orderId,  String? driverId,  ShipmentStatus status,  DateTime? dispatchDate,  DateTime? deliveryDate,  DateTime? actualDeliveryDate,  DateTime createdAt,  DateTime updatedAt,  List<PackageModel> packages,  OrderModel order)  $default,) {final _that = this;
switch (_that) {
case _ShipmentModel():
return $default(_that.id,_that.shipmentNo,_that.orderId,_that.driverId,_that.status,_that.dispatchDate,_that.deliveryDate,_that.actualDeliveryDate,_that.createdAt,_that.updatedAt,_that.packages,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String shipmentNo,  String orderId,  String? driverId,  ShipmentStatus status,  DateTime? dispatchDate,  DateTime? deliveryDate,  DateTime? actualDeliveryDate,  DateTime createdAt,  DateTime updatedAt,  List<PackageModel> packages,  OrderModel order)?  $default,) {final _that = this;
switch (_that) {
case _ShipmentModel() when $default != null:
return $default(_that.id,_that.shipmentNo,_that.orderId,_that.driverId,_that.status,_that.dispatchDate,_that.deliveryDate,_that.actualDeliveryDate,_that.createdAt,_that.updatedAt,_that.packages,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShipmentModel implements ShipmentModel {
  const _ShipmentModel({required this.id, required this.shipmentNo, required this.orderId, this.driverId, required this.status, this.dispatchDate, this.deliveryDate, this.actualDeliveryDate, required this.createdAt, required this.updatedAt,  List<PackageModel> packages = const [], required this.order}): _packages = packages;
  factory _ShipmentModel.fromJson(Map<String, dynamic> json) => _$ShipmentModelFromJson(json);

@override final  String id;
@override final  String shipmentNo;
@override final  String orderId;
@override final  String? driverId;
@override final  ShipmentStatus status;
@override final  DateTime? dispatchDate;
@override final  DateTime? deliveryDate;
@override final  DateTime? actualDeliveryDate;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<PackageModel> _packages;
@override@JsonKey() List<PackageModel> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}

@override final  OrderModel order;

/// Create a copy of ShipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentModelCopyWith<_ShipmentModel> get copyWith => __$ShipmentModelCopyWithImpl<_ShipmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShipmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShipmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.shipmentNo, shipmentNo) || other.shipmentNo == shipmentNo)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.status, status) || other.status == status)&&(identical(other.dispatchDate, dispatchDate) || other.dispatchDate == dispatchDate)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.actualDeliveryDate, actualDeliveryDate) || other.actualDeliveryDate == actualDeliveryDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.packages, _packages)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,shipmentNo,orderId,driverId,status,dispatchDate,deliveryDate,actualDeliveryDate,createdAt,updatedAt,const DeepCollectionEquality().hash(_packages),order);
}

@override
String toString() {
    return 'ShipmentModel(id: $id, shipmentNo: $shipmentNo, orderId: $orderId, driverId: $driverId, status: $status, dispatchDate: $dispatchDate, deliveryDate: $deliveryDate, actualDeliveryDate: $actualDeliveryDate, createdAt: $createdAt, updatedAt: $updatedAt, packages: $packages, order: $order)';
}


}

/// @nodoc
abstract mixin class _$ShipmentModelCopyWith<$Res> implements $ShipmentModelCopyWith<$Res> {
  factory _$ShipmentModelCopyWith(_ShipmentModel value, $Res Function(_ShipmentModel) _then) = __$ShipmentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String shipmentNo, String orderId, String? driverId, ShipmentStatus status, DateTime? dispatchDate, DateTime? deliveryDate, DateTime? actualDeliveryDate, DateTime createdAt, DateTime updatedAt, List<PackageModel> packages, OrderModel order
});


@override $OrderModelCopyWith<$Res> get order;

}
/// @nodoc
class __$ShipmentModelCopyWithImpl<$Res>
    implements _$ShipmentModelCopyWith<$Res> {
  __$ShipmentModelCopyWithImpl(this._self, this._then);

  final _ShipmentModel _self;
  final $Res Function(_ShipmentModel) _then;

/// Create a copy of ShipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shipmentNo = null,Object? orderId = null,Object? driverId = freezed,Object? status = null,Object? dispatchDate = freezed,Object? deliveryDate = freezed,Object? actualDeliveryDate = freezed,Object? createdAt = null,Object? updatedAt = null,Object? packages = null,Object? order = null,}) {
  return _then(_ShipmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shipmentNo: null == shipmentNo ? _self.shipmentNo : shipmentNo // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShipmentStatus,dispatchDate: freezed == dispatchDate ? _self.dispatchDate : dispatchDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryDate: freezed == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualDeliveryDate: freezed == actualDeliveryDate ? _self.actualDeliveryDate : actualDeliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageModel>,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as OrderModel,
  ));
}

/// Create a copy of ShipmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderModelCopyWith<$Res> get order {
  
  return $OrderModelCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}


/// @nodoc
mixin _$OrderModel {

 String get id; CustomerModel get customer; ProjectModel get project;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.customer, _this.customer) || other.customer == _this.customer)&&(identical(other.project, _this.project) || other.project == _this.project));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderModel;
  return Object.hash(runtimeType,_this.id,_this.customer,_this.project);
}

@override
String toString() {
  final _this = this as OrderModel;
  return 'OrderModel(id: ${_this.id}, customer: ${_this.customer}, project: ${_this.project})';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id, CustomerModel customer, ProjectModel project
});


$CustomerModelCopyWith<$Res> get customer;$ProjectModelCopyWith<$Res> get project;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customer = null,Object? project = null,}) {
  return _then(OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectModel,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<$Res> get project {
  
  return $ProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CustomerModel customer,  ProjectModel project)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.customer,_that.project);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CustomerModel customer,  ProjectModel project)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.customer,_that.project);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CustomerModel customer,  ProjectModel project)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.customer,_that.project);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, required this.customer, required this.project});
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  String id;
@override final  CustomerModel customer;
@override final  ProjectModel project;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.project, project) || other.project == project));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,customer,project);
}

@override
String toString() {
    return 'OrderModel(id: $id, customer: $customer, project: $project)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, CustomerModel customer, ProjectModel project
});


@override $CustomerModelCopyWith<$Res> get customer;@override $ProjectModelCopyWith<$Res> get project;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customer = null,Object? project = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerModel,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectModel,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res> get customer {
  
  return $CustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<$Res> get project {
  
  return $ProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// @nodoc
mixin _$CustomerModel {

 String get id; String get name;
/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<CustomerModel> get copyWith => _$CustomerModelCopyWithImpl<CustomerModel>(this as CustomerModel, _$identity);

  /// Serializes this CustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CustomerModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CustomerModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as CustomerModel;
  return 'CustomerModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $CustomerModelCopyWith<$Res>  {
  factory $CustomerModelCopyWith(CustomerModel value, $Res Function(CustomerModel) _then) = _$CustomerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._self, this._then);

  final CustomerModel _self;
  final $Res Function(CustomerModel) _then;

/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(CustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerModel].
extension CustomerModelPatterns on CustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerModel() when $default != null:
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
case _CustomerModel() when $default != null:
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
case _CustomerModel():
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
case _CustomerModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerModel implements CustomerModel {
  const _CustomerModel({required this.id, required this.name});
  factory _CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerModelCopyWith<_CustomerModel> get copyWith => __$CustomerModelCopyWithImpl<_CustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'CustomerModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CustomerModelCopyWith<$Res> implements $CustomerModelCopyWith<$Res> {
  factory _$CustomerModelCopyWith(_CustomerModel value, $Res Function(_CustomerModel) _then) = __$CustomerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$CustomerModelCopyWithImpl<$Res>
    implements _$CustomerModelCopyWith<$Res> {
  __$CustomerModelCopyWithImpl(this._self, this._then);

  final _CustomerModel _self;
  final $Res Function(_CustomerModel) _then;

/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_CustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PackageModel {

 int get id; String get packageNumber; double? get weight; double? get length; double? get width; double? get height;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.packageNumber, _this.packageNumber) || other.packageNumber == _this.packageNumber)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.length, _this.length) || other.length == _this.length)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PackageModel;
  return Object.hash(runtimeType,_this.id,_this.packageNumber,_this.weight,_this.length,_this.width,_this.height);
}

@override
String toString() {
  final _this = this as PackageModel;
  return 'PackageModel(id: ${_this.id}, packageNumber: ${_this.packageNumber}, weight: ${_this.weight}, length: ${_this.length}, width: ${_this.width}, height: ${_this.height})';
}


}

/// @nodoc
abstract mixin class $PackageModelCopyWith<$Res>  {
  factory $PackageModelCopyWith(PackageModel value, $Res Function(PackageModel) _then) = _$PackageModelCopyWithImpl;
@useResult
$Res call({
 int id, String packageNumber, double? weight, double? length, double? width, double? height
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? packageNumber = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(PackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,packageNumber: null == packageNumber ? _self.packageNumber : packageNumber // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String packageNumber,  double? weight,  double? length,  double? width,  double? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.packageNumber,_that.weight,_that.length,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String packageNumber,  double? weight,  double? length,  double? width,  double? height)  $default,) {final _that = this;
switch (_that) {
case _PackageModel():
return $default(_that.id,_that.packageNumber,_that.weight,_that.length,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String packageNumber,  double? weight,  double? length,  double? width,  double? height)?  $default,) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.packageNumber,_that.weight,_that.length,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageModel implements PackageModel {
  const _PackageModel({required this.id, required this.packageNumber, this.weight, this.length, this.width, this.height});
  factory _PackageModel.fromJson(Map<String, dynamic> json) => _$PackageModelFromJson(json);

@override final  int id;
@override final  String packageNumber;
@override final  double? weight;
@override final  double? length;
@override final  double? width;
@override final  double? height;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.packageNumber, packageNumber) || other.packageNumber == packageNumber)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.length, length) || other.length == length)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,packageNumber,weight,length,width,height);
}

@override
String toString() {
    return 'PackageModel(id: $id, packageNumber: $packageNumber, weight: $weight, length: $length, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$PackageModelCopyWith<$Res> implements $PackageModelCopyWith<$Res> {
  factory _$PackageModelCopyWith(_PackageModel value, $Res Function(_PackageModel) _then) = __$PackageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String packageNumber, double? weight, double? length, double? width, double? height
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? packageNumber = null,Object? weight = freezed,Object? length = freezed,Object? width = freezed,Object? height = freezed,}) {
  return _then(_PackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,packageNumber: null == packageNumber ? _self.packageNumber : packageNumber // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ProjectModel {

 String get id; String get name;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as ProjectModel;
  return 'ProjectModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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
case _ProjectModel() when $default != null:
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
case _ProjectModel():
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
case _ProjectModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel implements ProjectModel {
  const _ProjectModel({required this.id, required this.name});
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'ProjectModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
