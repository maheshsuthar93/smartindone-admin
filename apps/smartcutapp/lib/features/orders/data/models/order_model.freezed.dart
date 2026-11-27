// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 String get id; int get orderNumber; String get companyId; String get projectId; OrderStatus get status; DateTime get deliveryDate; OrderCustomerModel get customer; OrderProjectModel get project; OrderFactoryModel? get factory; DateTime get createdAt; DateTime get updatedAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.companyId, _this.companyId) || other.companyId == _this.companyId)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.deliveryDate, _this.deliveryDate) || other.deliveryDate == _this.deliveryDate)&&(identical(other.customer, _this.customer) || other.customer == _this.customer)&&(identical(other.project, _this.project) || other.project == _this.project)&&(identical(other.factory, _this.factory) || other.factory == _this.factory)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderModel;
  return Object.hash(runtimeType,_this.id,_this.orderNumber,_this.companyId,_this.projectId,_this.status,_this.deliveryDate,_this.customer,_this.project,_this.factory,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as OrderModel;
  return 'OrderModel(id: ${_this.id}, orderNumber: ${_this.orderNumber}, companyId: ${_this.companyId}, projectId: ${_this.projectId}, status: ${_this.status}, deliveryDate: ${_this.deliveryDate}, customer: ${_this.customer}, project: ${_this.project}, factory: ${_this.factory}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id, int orderNumber, String companyId, String projectId, OrderStatus status, DateTime deliveryDate, OrderCustomerModel customer, OrderProjectModel project, OrderFactoryModel? factory, DateTime createdAt, DateTime updatedAt
});


$OrderCustomerModelCopyWith<$Res> get customer;$OrderProjectModelCopyWith<$Res> get project;$OrderFactoryModelCopyWith<$Res>? get factory;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? companyId = null,Object? projectId = null,Object? status = null,Object? deliveryDate = null,Object? customer = null,Object? project = null,Object? factory = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as OrderCustomerModel,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as OrderProjectModel,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as OrderFactoryModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCustomerModelCopyWith<$Res> get customer {
  
  return $OrderCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProjectModelCopyWith<$Res> get project {
  
  return $OrderProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderFactoryModelCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $OrderFactoryModelCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int orderNumber,  String companyId,  String projectId,  OrderStatus status,  DateTime deliveryDate,  OrderCustomerModel customer,  OrderProjectModel project,  OrderFactoryModel? factory,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.companyId,_that.projectId,_that.status,_that.deliveryDate,_that.customer,_that.project,_that.factory,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int orderNumber,  String companyId,  String projectId,  OrderStatus status,  DateTime deliveryDate,  OrderCustomerModel customer,  OrderProjectModel project,  OrderFactoryModel? factory,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.orderNumber,_that.companyId,_that.projectId,_that.status,_that.deliveryDate,_that.customer,_that.project,_that.factory,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int orderNumber,  String companyId,  String projectId,  OrderStatus status,  DateTime deliveryDate,  OrderCustomerModel customer,  OrderProjectModel project,  OrderFactoryModel? factory,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.companyId,_that.projectId,_that.status,_that.deliveryDate,_that.customer,_that.project,_that.factory,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, required this.orderNumber, required this.companyId, required this.projectId, required this.status, required this.deliveryDate, required this.customer, required this.project, this.factory, required this.createdAt, required this.updatedAt});
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  String id;
@override final  int orderNumber;
@override final  String companyId;
@override final  String projectId;
@override final  OrderStatus status;
@override final  DateTime deliveryDate;
@override final  OrderCustomerModel customer;
@override final  OrderProjectModel project;
@override final  OrderFactoryModel? factory;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.project, project) || other.project == project)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderNumber,companyId,projectId,status,deliveryDate,customer,project,factory,createdAt,updatedAt);
}

@override
String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, companyId: $companyId, projectId: $projectId, status: $status, deliveryDate: $deliveryDate, customer: $customer, project: $project, factory: $factory, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int orderNumber, String companyId, String projectId, OrderStatus status, DateTime deliveryDate, OrderCustomerModel customer, OrderProjectModel project, OrderFactoryModel? factory, DateTime createdAt, DateTime updatedAt
});


@override $OrderCustomerModelCopyWith<$Res> get customer;@override $OrderProjectModelCopyWith<$Res> get project;@override $OrderFactoryModelCopyWith<$Res>? get factory;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? companyId = null,Object? projectId = null,Object? status = null,Object? deliveryDate = null,Object? customer = null,Object? project = null,Object? factory = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as int,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as OrderCustomerModel,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as OrderProjectModel,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as OrderFactoryModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCustomerModelCopyWith<$Res> get customer {
  
  return $OrderCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProjectModelCopyWith<$Res> get project {
  
  return $OrderProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderFactoryModelCopyWith<$Res>? get factory {
    if (_self.factory == null) {
    return null;
  }

  return $OrderFactoryModelCopyWith<$Res>(_self.factory!, (value) {
    return _then(_self.copyWith(factory: value));
  });
}
}

// dart format on
