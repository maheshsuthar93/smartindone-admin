// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectDetailModel {

 String get id; String get name;@JsonKey(unknownEnumValue: ProjectStatus.unknown) ProjectStatus get status; String get customerId; String get companyId; String? get description; DateTime? get startDate; DateTime? get expectedEndDate; DateTime? get actualEndDate; String? get deliveryAddress; String? get deliveryAddress2; String? get deliveryCity; String? get deliveryState; String? get deliveryPostalCode; String? get deliveryCountry; String? get contactName; String? get contactPhone; String? get contactEmail; DateTime? get createdAt; DateTime? get updatedAt; ProjectDetailCustomerModel? get customer;@JsonKey(readValue: _readOrdersCount) int get ordersCount;
/// Create a copy of ProjectDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailModelCopyWith<ProjectDetailModel> get copyWith => _$ProjectDetailModelCopyWithImpl<ProjectDetailModel>(this as ProjectDetailModel, _$identity);

  /// Serializes this ProjectDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.customerId, _this.customerId) || other.customerId == _this.customerId)&&(identical(other.companyId, _this.companyId) || other.companyId == _this.companyId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.expectedEndDate, _this.expectedEndDate) || other.expectedEndDate == _this.expectedEndDate)&&(identical(other.actualEndDate, _this.actualEndDate) || other.actualEndDate == _this.actualEndDate)&&(identical(other.deliveryAddress, _this.deliveryAddress) || other.deliveryAddress == _this.deliveryAddress)&&(identical(other.deliveryAddress2, _this.deliveryAddress2) || other.deliveryAddress2 == _this.deliveryAddress2)&&(identical(other.deliveryCity, _this.deliveryCity) || other.deliveryCity == _this.deliveryCity)&&(identical(other.deliveryState, _this.deliveryState) || other.deliveryState == _this.deliveryState)&&(identical(other.deliveryPostalCode, _this.deliveryPostalCode) || other.deliveryPostalCode == _this.deliveryPostalCode)&&(identical(other.deliveryCountry, _this.deliveryCountry) || other.deliveryCountry == _this.deliveryCountry)&&(identical(other.contactName, _this.contactName) || other.contactName == _this.contactName)&&(identical(other.contactPhone, _this.contactPhone) || other.contactPhone == _this.contactPhone)&&(identical(other.contactEmail, _this.contactEmail) || other.contactEmail == _this.contactEmail)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.customer, _this.customer) || other.customer == _this.customer)&&(identical(other.ordersCount, _this.ordersCount) || other.ordersCount == _this.ordersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectDetailModel;
  return Object.hashAll([runtimeType,_this.id,_this.name,_this.status,_this.customerId,_this.companyId,_this.description,_this.startDate,_this.expectedEndDate,_this.actualEndDate,_this.deliveryAddress,_this.deliveryAddress2,_this.deliveryCity,_this.deliveryState,_this.deliveryPostalCode,_this.deliveryCountry,_this.contactName,_this.contactPhone,_this.contactEmail,_this.createdAt,_this.updatedAt,_this.customer,_this.ordersCount]);
}

@override
String toString() {
  final _this = this as ProjectDetailModel;
  return 'ProjectDetailModel(id: ${_this.id}, name: ${_this.name}, status: ${_this.status}, customerId: ${_this.customerId}, companyId: ${_this.companyId}, description: ${_this.description}, startDate: ${_this.startDate}, expectedEndDate: ${_this.expectedEndDate}, actualEndDate: ${_this.actualEndDate}, deliveryAddress: ${_this.deliveryAddress}, deliveryAddress2: ${_this.deliveryAddress2}, deliveryCity: ${_this.deliveryCity}, deliveryState: ${_this.deliveryState}, deliveryPostalCode: ${_this.deliveryPostalCode}, deliveryCountry: ${_this.deliveryCountry}, contactName: ${_this.contactName}, contactPhone: ${_this.contactPhone}, contactEmail: ${_this.contactEmail}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, customer: ${_this.customer}, ordersCount: ${_this.ordersCount})';
}


}

/// @nodoc
abstract mixin class $ProjectDetailModelCopyWith<$Res>  {
  factory $ProjectDetailModelCopyWith(ProjectDetailModel value, $Res Function(ProjectDetailModel) _then) = _$ProjectDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: ProjectStatus.unknown) ProjectStatus status, String customerId, String companyId, String? description, DateTime? startDate, DateTime? expectedEndDate, DateTime? actualEndDate, String? deliveryAddress, String? deliveryAddress2, String? deliveryCity, String? deliveryState, String? deliveryPostalCode, String? deliveryCountry, String? contactName, String? contactPhone, String? contactEmail, DateTime? createdAt, DateTime? updatedAt, ProjectDetailCustomerModel? customer,@JsonKey(readValue: _readOrdersCount) int ordersCount
});


$ProjectDetailCustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class _$ProjectDetailModelCopyWithImpl<$Res>
    implements $ProjectDetailModelCopyWith<$Res> {
  _$ProjectDetailModelCopyWithImpl(this._self, this._then);

  final ProjectDetailModel _self;
  final $Res Function(ProjectDetailModel) _then;

/// Create a copy of ProjectDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? customerId = null,Object? companyId = null,Object? description = freezed,Object? startDate = freezed,Object? expectedEndDate = freezed,Object? actualEndDate = freezed,Object? deliveryAddress = freezed,Object? deliveryAddress2 = freezed,Object? deliveryCity = freezed,Object? deliveryState = freezed,Object? deliveryPostalCode = freezed,Object? deliveryCountry = freezed,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customer = freezed,Object? ordersCount = null,}) {
  return _then(ProjectDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedEndDate: freezed == expectedEndDate ? _self.expectedEndDate : expectedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualEndDate: freezed == actualEndDate ? _self.actualEndDate : actualEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddress2: freezed == deliveryAddress2 ? _self.deliveryAddress2 : deliveryAddress2 // ignore: cast_nullable_to_non_nullable
as String?,deliveryCity: freezed == deliveryCity ? _self.deliveryCity : deliveryCity // ignore: cast_nullable_to_non_nullable
as String?,deliveryState: freezed == deliveryState ? _self.deliveryState : deliveryState // ignore: cast_nullable_to_non_nullable
as String?,deliveryPostalCode: freezed == deliveryPostalCode ? _self.deliveryPostalCode : deliveryPostalCode // ignore: cast_nullable_to_non_nullable
as String?,deliveryCountry: freezed == deliveryCountry ? _self.deliveryCountry : deliveryCountry // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as ProjectDetailCustomerModel?,ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ProjectDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectDetailCustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $ProjectDetailCustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectDetailModel].
extension ProjectDetailModelPatterns on ProjectDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: ProjectStatus.unknown)  ProjectStatus status,  String customerId,  String companyId,  String? description,  DateTime? startDate,  DateTime? expectedEndDate,  DateTime? actualEndDate,  String? deliveryAddress,  String? deliveryAddress2,  String? deliveryCity,  String? deliveryState,  String? deliveryPostalCode,  String? deliveryCountry,  String? contactName,  String? contactPhone,  String? contactEmail,  DateTime? createdAt,  DateTime? updatedAt,  ProjectDetailCustomerModel? customer, @JsonKey(readValue: _readOrdersCount)  int ordersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.customerId,_that.companyId,_that.description,_that.startDate,_that.expectedEndDate,_that.actualEndDate,_that.deliveryAddress,_that.deliveryAddress2,_that.deliveryCity,_that.deliveryState,_that.deliveryPostalCode,_that.deliveryCountry,_that.contactName,_that.contactPhone,_that.contactEmail,_that.createdAt,_that.updatedAt,_that.customer,_that.ordersCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: ProjectStatus.unknown)  ProjectStatus status,  String customerId,  String companyId,  String? description,  DateTime? startDate,  DateTime? expectedEndDate,  DateTime? actualEndDate,  String? deliveryAddress,  String? deliveryAddress2,  String? deliveryCity,  String? deliveryState,  String? deliveryPostalCode,  String? deliveryCountry,  String? contactName,  String? contactPhone,  String? contactEmail,  DateTime? createdAt,  DateTime? updatedAt,  ProjectDetailCustomerModel? customer, @JsonKey(readValue: _readOrdersCount)  int ordersCount)  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailModel():
return $default(_that.id,_that.name,_that.status,_that.customerId,_that.companyId,_that.description,_that.startDate,_that.expectedEndDate,_that.actualEndDate,_that.deliveryAddress,_that.deliveryAddress2,_that.deliveryCity,_that.deliveryState,_that.deliveryPostalCode,_that.deliveryCountry,_that.contactName,_that.contactPhone,_that.contactEmail,_that.createdAt,_that.updatedAt,_that.customer,_that.ordersCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(unknownEnumValue: ProjectStatus.unknown)  ProjectStatus status,  String customerId,  String companyId,  String? description,  DateTime? startDate,  DateTime? expectedEndDate,  DateTime? actualEndDate,  String? deliveryAddress,  String? deliveryAddress2,  String? deliveryCity,  String? deliveryState,  String? deliveryPostalCode,  String? deliveryCountry,  String? contactName,  String? contactPhone,  String? contactEmail,  DateTime? createdAt,  DateTime? updatedAt,  ProjectDetailCustomerModel? customer, @JsonKey(readValue: _readOrdersCount)  int ordersCount)?  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.customerId,_that.companyId,_that.description,_that.startDate,_that.expectedEndDate,_that.actualEndDate,_that.deliveryAddress,_that.deliveryAddress2,_that.deliveryCity,_that.deliveryState,_that.deliveryPostalCode,_that.deliveryCountry,_that.contactName,_that.contactPhone,_that.contactEmail,_that.createdAt,_that.updatedAt,_that.customer,_that.ordersCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectDetailModel implements ProjectDetailModel {
  const _ProjectDetailModel({required this.id, required this.name, @JsonKey(unknownEnumValue: ProjectStatus.unknown) required this.status, required this.customerId, required this.companyId, this.description, this.startDate, this.expectedEndDate, this.actualEndDate, this.deliveryAddress, this.deliveryAddress2, this.deliveryCity, this.deliveryState, this.deliveryPostalCode, this.deliveryCountry, this.contactName, this.contactPhone, this.contactEmail, this.createdAt, this.updatedAt, this.customer, @JsonKey(readValue: _readOrdersCount) this.ordersCount = 0});
  factory _ProjectDetailModel.fromJson(Map<String, dynamic> json) => _$ProjectDetailModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(unknownEnumValue: ProjectStatus.unknown) final  ProjectStatus status;
@override final  String customerId;
@override final  String companyId;
@override final  String? description;
@override final  DateTime? startDate;
@override final  DateTime? expectedEndDate;
@override final  DateTime? actualEndDate;
@override final  String? deliveryAddress;
@override final  String? deliveryAddress2;
@override final  String? deliveryCity;
@override final  String? deliveryState;
@override final  String? deliveryPostalCode;
@override final  String? deliveryCountry;
@override final  String? contactName;
@override final  String? contactPhone;
@override final  String? contactEmail;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  ProjectDetailCustomerModel? customer;
@override@JsonKey(readValue: _readOrdersCount) final  int ordersCount;

/// Create a copy of ProjectDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDetailModelCopyWith<_ProjectDetailModel> get copyWith => __$ProjectDetailModelCopyWithImpl<_ProjectDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.expectedEndDate, expectedEndDate) || other.expectedEndDate == expectedEndDate)&&(identical(other.actualEndDate, actualEndDate) || other.actualEndDate == actualEndDate)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.deliveryAddress2, deliveryAddress2) || other.deliveryAddress2 == deliveryAddress2)&&(identical(other.deliveryCity, deliveryCity) || other.deliveryCity == deliveryCity)&&(identical(other.deliveryState, deliveryState) || other.deliveryState == deliveryState)&&(identical(other.deliveryPostalCode, deliveryPostalCode) || other.deliveryPostalCode == deliveryPostalCode)&&(identical(other.deliveryCountry, deliveryCountry) || other.deliveryCountry == deliveryCountry)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,name,status,customerId,companyId,description,startDate,expectedEndDate,actualEndDate,deliveryAddress,deliveryAddress2,deliveryCity,deliveryState,deliveryPostalCode,deliveryCountry,contactName,contactPhone,contactEmail,createdAt,updatedAt,customer,ordersCount]);
}

@override
String toString() {
    return 'ProjectDetailModel(id: $id, name: $name, status: $status, customerId: $customerId, companyId: $companyId, description: $description, startDate: $startDate, expectedEndDate: $expectedEndDate, actualEndDate: $actualEndDate, deliveryAddress: $deliveryAddress, deliveryAddress2: $deliveryAddress2, deliveryCity: $deliveryCity, deliveryState: $deliveryState, deliveryPostalCode: $deliveryPostalCode, deliveryCountry: $deliveryCountry, contactName: $contactName, contactPhone: $contactPhone, contactEmail: $contactEmail, createdAt: $createdAt, updatedAt: $updatedAt, customer: $customer, ordersCount: $ordersCount)';
}


}

/// @nodoc
abstract mixin class _$ProjectDetailModelCopyWith<$Res> implements $ProjectDetailModelCopyWith<$Res> {
  factory _$ProjectDetailModelCopyWith(_ProjectDetailModel value, $Res Function(_ProjectDetailModel) _then) = __$ProjectDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: ProjectStatus.unknown) ProjectStatus status, String customerId, String companyId, String? description, DateTime? startDate, DateTime? expectedEndDate, DateTime? actualEndDate, String? deliveryAddress, String? deliveryAddress2, String? deliveryCity, String? deliveryState, String? deliveryPostalCode, String? deliveryCountry, String? contactName, String? contactPhone, String? contactEmail, DateTime? createdAt, DateTime? updatedAt, ProjectDetailCustomerModel? customer,@JsonKey(readValue: _readOrdersCount) int ordersCount
});


@override $ProjectDetailCustomerModelCopyWith<$Res>? get customer;

}
/// @nodoc
class __$ProjectDetailModelCopyWithImpl<$Res>
    implements _$ProjectDetailModelCopyWith<$Res> {
  __$ProjectDetailModelCopyWithImpl(this._self, this._then);

  final _ProjectDetailModel _self;
  final $Res Function(_ProjectDetailModel) _then;

/// Create a copy of ProjectDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? customerId = null,Object? companyId = null,Object? description = freezed,Object? startDate = freezed,Object? expectedEndDate = freezed,Object? actualEndDate = freezed,Object? deliveryAddress = freezed,Object? deliveryAddress2 = freezed,Object? deliveryCity = freezed,Object? deliveryState = freezed,Object? deliveryPostalCode = freezed,Object? deliveryCountry = freezed,Object? contactName = freezed,Object? contactPhone = freezed,Object? contactEmail = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customer = freezed,Object? ordersCount = null,}) {
  return _then(_ProjectDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedEndDate: freezed == expectedEndDate ? _self.expectedEndDate : expectedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualEndDate: freezed == actualEndDate ? _self.actualEndDate : actualEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as String?,deliveryAddress2: freezed == deliveryAddress2 ? _self.deliveryAddress2 : deliveryAddress2 // ignore: cast_nullable_to_non_nullable
as String?,deliveryCity: freezed == deliveryCity ? _self.deliveryCity : deliveryCity // ignore: cast_nullable_to_non_nullable
as String?,deliveryState: freezed == deliveryState ? _self.deliveryState : deliveryState // ignore: cast_nullable_to_non_nullable
as String?,deliveryPostalCode: freezed == deliveryPostalCode ? _self.deliveryPostalCode : deliveryPostalCode // ignore: cast_nullable_to_non_nullable
as String?,deliveryCountry: freezed == deliveryCountry ? _self.deliveryCountry : deliveryCountry // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as ProjectDetailCustomerModel?,ordersCount: null == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ProjectDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectDetailCustomerModelCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $ProjectDetailCustomerModelCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// @nodoc
mixin _$ProjectDetailCustomerModel {

 String get id; String get name; String? get phone; String? get email;
/// Create a copy of ProjectDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailCustomerModelCopyWith<ProjectDetailCustomerModel> get copyWith => _$ProjectDetailCustomerModelCopyWithImpl<ProjectDetailCustomerModel>(this as ProjectDetailCustomerModel, _$identity);

  /// Serializes this ProjectDetailCustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectDetailCustomerModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailCustomerModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.email, _this.email) || other.email == _this.email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectDetailCustomerModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.email);
}

@override
String toString() {
  final _this = this as ProjectDetailCustomerModel;
  return 'ProjectDetailCustomerModel(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, email: ${_this.email})';
}


}

/// @nodoc
abstract mixin class $ProjectDetailCustomerModelCopyWith<$Res>  {
  factory $ProjectDetailCustomerModelCopyWith(ProjectDetailCustomerModel value, $Res Function(ProjectDetailCustomerModel) _then) = _$ProjectDetailCustomerModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? phone, String? email
});




}
/// @nodoc
class _$ProjectDetailCustomerModelCopyWithImpl<$Res>
    implements $ProjectDetailCustomerModelCopyWith<$Res> {
  _$ProjectDetailCustomerModelCopyWithImpl(this._self, this._then);

  final ProjectDetailCustomerModel _self;
  final $Res Function(ProjectDetailCustomerModel) _then;

/// Create a copy of ProjectDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,}) {
  return _then(ProjectDetailCustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectDetailCustomerModel].
extension ProjectDetailCustomerModelPatterns on ProjectDetailCustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDetailCustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDetailCustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDetailCustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailCustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDetailCustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailCustomerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? phone,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectDetailCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? phone,  String? email)  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailCustomerModel():
return $default(_that.id,_that.name,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? phone,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailCustomerModel() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectDetailCustomerModel implements ProjectDetailCustomerModel {
  const _ProjectDetailCustomerModel({required this.id, required this.name, this.phone, this.email});
  factory _ProjectDetailCustomerModel.fromJson(Map<String, dynamic> json) => _$ProjectDetailCustomerModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? phone;
@override final  String? email;

/// Create a copy of ProjectDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDetailCustomerModelCopyWith<_ProjectDetailCustomerModel> get copyWith => __$ProjectDetailCustomerModelCopyWithImpl<_ProjectDetailCustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectDetailCustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDetailCustomerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,email);
}

@override
String toString() {
    return 'ProjectDetailCustomerModel(id: $id, name: $name, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ProjectDetailCustomerModelCopyWith<$Res> implements $ProjectDetailCustomerModelCopyWith<$Res> {
  factory _$ProjectDetailCustomerModelCopyWith(_ProjectDetailCustomerModel value, $Res Function(_ProjectDetailCustomerModel) _then) = __$ProjectDetailCustomerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? phone, String? email
});




}
/// @nodoc
class __$ProjectDetailCustomerModelCopyWithImpl<$Res>
    implements _$ProjectDetailCustomerModelCopyWith<$Res> {
  __$ProjectDetailCustomerModelCopyWithImpl(this._self, this._then);

  final _ProjectDetailCustomerModel _self;
  final $Res Function(_ProjectDetailCustomerModel) _then;

/// Create a copy of ProjectDetailCustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_ProjectDetailCustomerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
