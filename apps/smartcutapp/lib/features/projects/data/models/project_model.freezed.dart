// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectModel {

 String get id; String get customerId; String get companyId; String get name; DateTime? get createdAt; DateTime? get updatedAt; String? get description; String? get contactName; String? get contactEmail; String? get contactPhone; ProjectStatus get status; DateTime? get startDate; DateTime? get expectedEndDate; DateTime? get actualEndDate; bool get isActive;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.customerId, _this.customerId) || other.customerId == _this.customerId)&&(identical(other.companyId, _this.companyId) || other.companyId == _this.companyId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.contactName, _this.contactName) || other.contactName == _this.contactName)&&(identical(other.contactEmail, _this.contactEmail) || other.contactEmail == _this.contactEmail)&&(identical(other.contactPhone, _this.contactPhone) || other.contactPhone == _this.contactPhone)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.expectedEndDate, _this.expectedEndDate) || other.expectedEndDate == _this.expectedEndDate)&&(identical(other.actualEndDate, _this.actualEndDate) || other.actualEndDate == _this.actualEndDate)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectModel;
  return Object.hash(runtimeType,_this.id,_this.customerId,_this.companyId,_this.name,_this.createdAt,_this.updatedAt,_this.description,_this.contactName,_this.contactEmail,_this.contactPhone,_this.status,_this.startDate,_this.expectedEndDate,_this.actualEndDate,_this.isActive);
}

@override
String toString() {
  final _this = this as ProjectModel;
  return 'ProjectModel(id: ${_this.id}, customerId: ${_this.customerId}, companyId: ${_this.companyId}, name: ${_this.name}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, description: ${_this.description}, contactName: ${_this.contactName}, contactEmail: ${_this.contactEmail}, contactPhone: ${_this.contactPhone}, status: ${_this.status}, startDate: ${_this.startDate}, expectedEndDate: ${_this.expectedEndDate}, actualEndDate: ${_this.actualEndDate}, isActive: ${_this.isActive})';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String customerId, String companyId, String name, DateTime? createdAt, DateTime? updatedAt, String? description, String? contactName, String? contactEmail, String? contactPhone, ProjectStatus status, DateTime? startDate, DateTime? expectedEndDate, DateTime? actualEndDate, bool isActive
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? companyId = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? description = freezed,Object? contactName = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? status = null,Object? startDate = freezed,Object? expectedEndDate = freezed,Object? actualEndDate = freezed,Object? isActive = null,}) {
  return _then(ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedEndDate: freezed == expectedEndDate ? _self.expectedEndDate : expectedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualEndDate: freezed == actualEndDate ? _self.actualEndDate : actualEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerId,  String companyId,  String name,  DateTime? createdAt,  DateTime? updatedAt,  String? description,  String? contactName,  String? contactEmail,  String? contactPhone,  ProjectStatus status,  DateTime? startDate,  DateTime? expectedEndDate,  DateTime? actualEndDate,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.customerId,_that.companyId,_that.name,_that.createdAt,_that.updatedAt,_that.description,_that.contactName,_that.contactEmail,_that.contactPhone,_that.status,_that.startDate,_that.expectedEndDate,_that.actualEndDate,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerId,  String companyId,  String name,  DateTime? createdAt,  DateTime? updatedAt,  String? description,  String? contactName,  String? contactEmail,  String? contactPhone,  ProjectStatus status,  DateTime? startDate,  DateTime? expectedEndDate,  DateTime? actualEndDate,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
return $default(_that.id,_that.customerId,_that.companyId,_that.name,_that.createdAt,_that.updatedAt,_that.description,_that.contactName,_that.contactEmail,_that.contactPhone,_that.status,_that.startDate,_that.expectedEndDate,_that.actualEndDate,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerId,  String companyId,  String name,  DateTime? createdAt,  DateTime? updatedAt,  String? description,  String? contactName,  String? contactEmail,  String? contactPhone,  ProjectStatus status,  DateTime? startDate,  DateTime? expectedEndDate,  DateTime? actualEndDate,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.customerId,_that.companyId,_that.name,_that.createdAt,_that.updatedAt,_that.description,_that.contactName,_that.contactEmail,_that.contactPhone,_that.status,_that.startDate,_that.expectedEndDate,_that.actualEndDate,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel implements ProjectModel {
  const _ProjectModel({required this.id, required this.customerId, required this.companyId, required this.name, this.createdAt, this.updatedAt, this.description, this.contactName, this.contactEmail, this.contactPhone, required this.status, this.startDate, this.expectedEndDate, this.actualEndDate, this.isActive = true});
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override final  String id;
@override final  String customerId;
@override final  String companyId;
@override final  String name;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  String? description;
@override final  String? contactName;
@override final  String? contactEmail;
@override final  String? contactPhone;
@override final  ProjectStatus status;
@override final  DateTime? startDate;
@override final  DateTime? expectedEndDate;
@override final  DateTime? actualEndDate;
@override@JsonKey() final  bool isActive;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.status, status) || other.status == status)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.expectedEndDate, expectedEndDate) || other.expectedEndDate == expectedEndDate)&&(identical(other.actualEndDate, actualEndDate) || other.actualEndDate == actualEndDate)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,customerId,companyId,name,createdAt,updatedAt,description,contactName,contactEmail,contactPhone,status,startDate,expectedEndDate,actualEndDate,isActive);
}

@override
String toString() {
    return 'ProjectModel(id: $id, customerId: $customerId, companyId: $companyId, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, contactName: $contactName, contactEmail: $contactEmail, contactPhone: $contactPhone, status: $status, startDate: $startDate, expectedEndDate: $expectedEndDate, actualEndDate: $actualEndDate, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerId, String companyId, String name, DateTime? createdAt, DateTime? updatedAt, String? description, String? contactName, String? contactEmail, String? contactPhone, ProjectStatus status, DateTime? startDate, DateTime? expectedEndDate, DateTime? actualEndDate, bool isActive
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? companyId = null,Object? name = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? description = freezed,Object? contactName = freezed,Object? contactEmail = freezed,Object? contactPhone = freezed,Object? status = null,Object? startDate = freezed,Object? expectedEndDate = freezed,Object? actualEndDate = freezed,Object? isActive = null,}) {
  return _then(_ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,contactName: freezed == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String?,contactEmail: freezed == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expectedEndDate: freezed == expectedEndDate ? _self.expectedEndDate : expectedEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,actualEndDate: freezed == actualEndDate ? _self.actualEndDate : actualEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
