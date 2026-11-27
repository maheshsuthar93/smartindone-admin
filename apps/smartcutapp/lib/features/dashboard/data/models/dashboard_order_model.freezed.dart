// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardOrderModel {

 String get id; String get orderCode; String get companyId; String get projectId; OrderStatus get status; DateTime get deliveryDate; DashboardOrderCustomerModel get customer; DashboardOrderProjectModel get project; DashboardOrderFactoryModel? get factory; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardOrderModelCopyWith<DashboardOrderModel> get copyWith => _$DashboardOrderModelCopyWithImpl<DashboardOrderModel>(this as DashboardOrderModel, _$identity);

  /// Serializes this DashboardOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardOrderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardOrderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderCode, _this.orderCode) || other.orderCode == _this.orderCode)&&(identical(other.companyId, _this.companyId) || other.companyId == _this.companyId)&&(identical(other.projectId, _this.projectId) || other.projectId == _this.projectId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.deliveryDate, _this.deliveryDate) || other.deliveryDate == _this.deliveryDate)&&(identical(other.customer, _this.customer) || other.customer == _this.customer)&&(identical(other.project, _this.project) || other.project == _this.project)&&(identical(other.factory, _this.factory) || other.factory == _this.factory)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardOrderModel;
  return Object.hash(runtimeType,_this.id,_this.orderCode,_this.companyId,_this.projectId,_this.status,_this.deliveryDate,_this.customer,_this.project,_this.factory,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as DashboardOrderModel;
  return 'DashboardOrderModel(id: ${_this.id}, orderCode: ${_this.orderCode}, companyId: ${_this.companyId}, projectId: ${_this.projectId}, status: ${_this.status}, deliveryDate: ${_this.deliveryDate}, customer: ${_this.customer}, project: ${_this.project}, factory: ${_this.factory}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $DashboardOrderModelCopyWith<$Res>  {
  factory $DashboardOrderModelCopyWith(DashboardOrderModel value, $Res Function(DashboardOrderModel) _then) = _$DashboardOrderModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderCode, String companyId, String projectId, OrderStatus status, DateTime deliveryDate, DashboardOrderCustomerModel customer, DashboardOrderProjectModel project, DashboardOrderFactoryModel? factory, DateTime createdAt, DateTime updatedAt
});


$DashboardOrderCustomerModelCopyWith<$Res> get customer;$DashboardOrderProjectModelCopyWith<$Res> get project;

}
/// @nodoc
class _$DashboardOrderModelCopyWithImpl<$Res>
    implements $DashboardOrderModelCopyWith<$Res> {
  _$DashboardOrderModelCopyWithImpl(this._self, this._then);

  final DashboardOrderModel _self;
  final $Res Function(DashboardOrderModel) _then;

/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderCode = null,Object? companyId = null,Object? projectId = null,Object? status = null,Object? deliveryDate = null,Object? customer = null,Object? project = null,Object? factory = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(DashboardOrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as DashboardOrderCustomerModel,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as DashboardOrderProjectModel,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as DashboardOrderFactoryModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardOrderCustomerModelCopyWith<$Res> get customer {
  
  return $DashboardOrderCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardOrderProjectModelCopyWith<$Res> get project {
  
  return $DashboardOrderProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardOrderModel].
extension DashboardOrderModelPatterns on DashboardOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderCode,  String companyId,  String projectId,  OrderStatus status,  DateTime deliveryDate,  DashboardOrderCustomerModel customer,  DashboardOrderProjectModel project,  DashboardOrderFactoryModel? factory,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardOrderModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.companyId,_that.projectId,_that.status,_that.deliveryDate,_that.customer,_that.project,_that.factory,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderCode,  String companyId,  String projectId,  OrderStatus status,  DateTime deliveryDate,  DashboardOrderCustomerModel customer,  DashboardOrderProjectModel project,  DashboardOrderFactoryModel? factory,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DashboardOrderModel():
return $default(_that.id,_that.orderCode,_that.companyId,_that.projectId,_that.status,_that.deliveryDate,_that.customer,_that.project,_that.factory,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderCode,  String companyId,  String projectId,  OrderStatus status,  DateTime deliveryDate,  DashboardOrderCustomerModel customer,  DashboardOrderProjectModel project,  DashboardOrderFactoryModel? factory,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DashboardOrderModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.companyId,_that.projectId,_that.status,_that.deliveryDate,_that.customer,_that.project,_that.factory,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardOrderModel implements DashboardOrderModel {
  const _DashboardOrderModel({required this.id, required this.orderCode, required this.companyId, required this.projectId, required this.status, required this.deliveryDate, required this.customer, required this.project, this.factory, required this.createdAt, required this.updatedAt});
  factory _DashboardOrderModel.fromJson(Map<String, dynamic> json) => _$DashboardOrderModelFromJson(json);

@override final  String id;
@override final  String orderCode;
@override final  String companyId;
@override final  String projectId;
@override final  OrderStatus status;
@override final  DateTime deliveryDate;
@override final  DashboardOrderCustomerModel customer;
@override final  DashboardOrderProjectModel project;
@override final  DashboardOrderFactoryModel? factory;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardOrderModelCopyWith<_DashboardOrderModel> get copyWith => __$DashboardOrderModelCopyWithImpl<_DashboardOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.project, project) || other.project == project)&&(identical(other.factory, factory) || other.factory == factory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderCode,companyId,projectId,status,deliveryDate,customer,project,factory,createdAt,updatedAt);
}

@override
String toString() {
    return 'DashboardOrderModel(id: $id, orderCode: $orderCode, companyId: $companyId, projectId: $projectId, status: $status, deliveryDate: $deliveryDate, customer: $customer, project: $project, factory: $factory, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DashboardOrderModelCopyWith<$Res> implements $DashboardOrderModelCopyWith<$Res> {
  factory _$DashboardOrderModelCopyWith(_DashboardOrderModel value, $Res Function(_DashboardOrderModel) _then) = __$DashboardOrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderCode, String companyId, String projectId, OrderStatus status, DateTime deliveryDate, DashboardOrderCustomerModel customer, DashboardOrderProjectModel project, DashboardOrderFactoryModel? factory, DateTime createdAt, DateTime updatedAt
});


@override $DashboardOrderCustomerModelCopyWith<$Res> get customer;@override $DashboardOrderProjectModelCopyWith<$Res> get project;

}
/// @nodoc
class __$DashboardOrderModelCopyWithImpl<$Res>
    implements _$DashboardOrderModelCopyWith<$Res> {
  __$DashboardOrderModelCopyWithImpl(this._self, this._then);

  final _DashboardOrderModel _self;
  final $Res Function(_DashboardOrderModel) _then;

/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderCode = null,Object? companyId = null,Object? projectId = null,Object? status = null,Object? deliveryDate = null,Object? customer = null,Object? project = null,Object? factory = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DashboardOrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as DashboardOrderCustomerModel,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as DashboardOrderProjectModel,factory: freezed == factory ? _self.factory : factory // ignore: cast_nullable_to_non_nullable
as DashboardOrderFactoryModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardOrderCustomerModelCopyWith<$Res> get customer {
  
  return $DashboardOrderCustomerModelCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of DashboardOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardOrderProjectModelCopyWith<$Res> get project {
  
  return $DashboardOrderProjectModelCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on
