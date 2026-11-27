// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MachineFactoryModel {

 String get id; String get name; String? get code;
/// Create a copy of MachineFactoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MachineFactoryModelCopyWith<MachineFactoryModel> get copyWith => _$MachineFactoryModelCopyWithImpl<MachineFactoryModel>(this as MachineFactoryModel, _$identity);

  /// Serializes this MachineFactoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MachineFactoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MachineFactoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MachineFactoryModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code);
}

@override
String toString() {
  final _this = this as MachineFactoryModel;
  return 'MachineFactoryModel(id: ${_this.id}, name: ${_this.name}, code: ${_this.code})';
}


}

/// @nodoc
abstract mixin class $MachineFactoryModelCopyWith<$Res>  {
  factory $MachineFactoryModelCopyWith(MachineFactoryModel value, $Res Function(MachineFactoryModel) _then) = _$MachineFactoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? code
});




}
/// @nodoc
class _$MachineFactoryModelCopyWithImpl<$Res>
    implements $MachineFactoryModelCopyWith<$Res> {
  _$MachineFactoryModelCopyWithImpl(this._self, this._then);

  final MachineFactoryModel _self;
  final $Res Function(MachineFactoryModel) _then;

/// Create a copy of MachineFactoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(MachineFactoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MachineFactoryModel].
extension MachineFactoryModelPatterns on MachineFactoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MachineFactoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MachineFactoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MachineFactoryModel value)  $default,){
final _that = this;
switch (_that) {
case _MachineFactoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MachineFactoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MachineFactoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MachineFactoryModel() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? code)  $default,) {final _that = this;
switch (_that) {
case _MachineFactoryModel():
return $default(_that.id,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? code)?  $default,) {final _that = this;
switch (_that) {
case _MachineFactoryModel() when $default != null:
return $default(_that.id,_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MachineFactoryModel implements MachineFactoryModel {
  const _MachineFactoryModel({required this.id, required this.name, this.code});
  factory _MachineFactoryModel.fromJson(Map<String, dynamic> json) => _$MachineFactoryModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? code;

/// Create a copy of MachineFactoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MachineFactoryModelCopyWith<_MachineFactoryModel> get copyWith => __$MachineFactoryModelCopyWithImpl<_MachineFactoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MachineFactoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MachineFactoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code);
}

@override
String toString() {
    return 'MachineFactoryModel(id: $id, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$MachineFactoryModelCopyWith<$Res> implements $MachineFactoryModelCopyWith<$Res> {
  factory _$MachineFactoryModelCopyWith(_MachineFactoryModel value, $Res Function(_MachineFactoryModel) _then) = __$MachineFactoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? code
});




}
/// @nodoc
class __$MachineFactoryModelCopyWithImpl<$Res>
    implements _$MachineFactoryModelCopyWith<$Res> {
  __$MachineFactoryModelCopyWithImpl(this._self, this._then);

  final _MachineFactoryModel _self;
  final $Res Function(_MachineFactoryModel) _then;

/// Create a copy of MachineFactoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,}) {
  return _then(_MachineFactoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MachineModel {

 String get id; String get name; String get code; MachineType get type; String get factoryId;@JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson) MachineFactoryModel? get factorySummary; bool get isActive; double? get kerf;
/// Create a copy of MachineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MachineModelCopyWith<MachineModel> get copyWith => _$MachineModelCopyWithImpl<MachineModel>(this as MachineModel, _$identity);

  /// Serializes this MachineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MachineModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MachineModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.factoryId, _this.factoryId) || other.factoryId == _this.factoryId)&&(identical(other.factorySummary, _this.factorySummary) || other.factorySummary == _this.factorySummary)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.kerf, _this.kerf) || other.kerf == _this.kerf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MachineModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.code,_this.type,_this.factoryId,_this.factorySummary,_this.isActive,_this.kerf);
}

@override
String toString() {
  final _this = this as MachineModel;
  return 'MachineModel(id: ${_this.id}, name: ${_this.name}, code: ${_this.code}, type: ${_this.type}, factoryId: ${_this.factoryId}, factorySummary: ${_this.factorySummary}, isActive: ${_this.isActive}, kerf: ${_this.kerf})';
}


}

/// @nodoc
abstract mixin class $MachineModelCopyWith<$Res>  {
  factory $MachineModelCopyWith(MachineModel value, $Res Function(MachineModel) _then) = _$MachineModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, MachineType type, String factoryId,@JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson) MachineFactoryModel? factorySummary, bool isActive, double? kerf
});


$MachineFactoryModelCopyWith<$Res>? get factorySummary;

}
/// @nodoc
class _$MachineModelCopyWithImpl<$Res>
    implements $MachineModelCopyWith<$Res> {
  _$MachineModelCopyWithImpl(this._self, this._then);

  final MachineModel _self;
  final $Res Function(MachineModel) _then;

/// Create a copy of MachineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? factoryId = null,Object? factorySummary = freezed,Object? isActive = null,Object? kerf = freezed,}) {
  return _then(MachineModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MachineType,factoryId: null == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as String,factorySummary: freezed == factorySummary ? _self.factorySummary : factorySummary // ignore: cast_nullable_to_non_nullable
as MachineFactoryModel?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,kerf: freezed == kerf ? _self.kerf : kerf // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of MachineModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MachineFactoryModelCopyWith<$Res>? get factorySummary {
    if (_self.factorySummary == null) {
    return null;
  }

  return $MachineFactoryModelCopyWith<$Res>(_self.factorySummary!, (value) {
    return _then(_self.copyWith(factorySummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [MachineModel].
extension MachineModelPatterns on MachineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MachineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MachineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MachineModel value)  $default,){
final _that = this;
switch (_that) {
case _MachineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MachineModel value)?  $default,){
final _that = this;
switch (_that) {
case _MachineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  MachineType type,  String factoryId, @JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson)  MachineFactoryModel? factorySummary,  bool isActive,  double? kerf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MachineModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.factoryId,_that.factorySummary,_that.isActive,_that.kerf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  MachineType type,  String factoryId, @JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson)  MachineFactoryModel? factorySummary,  bool isActive,  double? kerf)  $default,) {final _that = this;
switch (_that) {
case _MachineModel():
return $default(_that.id,_that.name,_that.code,_that.type,_that.factoryId,_that.factorySummary,_that.isActive,_that.kerf);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  MachineType type,  String factoryId, @JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson)  MachineFactoryModel? factorySummary,  bool isActive,  double? kerf)?  $default,) {final _that = this;
switch (_that) {
case _MachineModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.type,_that.factoryId,_that.factorySummary,_that.isActive,_that.kerf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MachineModel extends MachineModel {
  const _MachineModel({required this.id, required this.name, required this.code, required this.type, required this.factoryId, @JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson) this.factorySummary, this.isActive = true, this.kerf}): super._();
  factory _MachineModel.fromJson(Map<String, dynamic> json) => _$MachineModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  MachineType type;
@override final  String factoryId;
@override@JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson) final  MachineFactoryModel? factorySummary;
@override@JsonKey() final  bool isActive;
@override final  double? kerf;

/// Create a copy of MachineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MachineModelCopyWith<_MachineModel> get copyWith => __$MachineModelCopyWithImpl<_MachineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MachineModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MachineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.factoryId, factoryId) || other.factoryId == factoryId)&&(identical(other.factorySummary, factorySummary) || other.factorySummary == factorySummary)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.kerf, kerf) || other.kerf == kerf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,code,type,factoryId,factorySummary,isActive,kerf);
}

@override
String toString() {
    return 'MachineModel(id: $id, name: $name, code: $code, type: $type, factoryId: $factoryId, factorySummary: $factorySummary, isActive: $isActive, kerf: $kerf)';
}


}

/// @nodoc
abstract mixin class _$MachineModelCopyWith<$Res> implements $MachineModelCopyWith<$Res> {
  factory _$MachineModelCopyWith(_MachineModel value, $Res Function(_MachineModel) _then) = __$MachineModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, MachineType type, String factoryId,@JsonKey(name: 'factory', fromJson: _machineFactoryFromJson, toJson: _machineFactoryToJson) MachineFactoryModel? factorySummary, bool isActive, double? kerf
});


@override $MachineFactoryModelCopyWith<$Res>? get factorySummary;

}
/// @nodoc
class __$MachineModelCopyWithImpl<$Res>
    implements _$MachineModelCopyWith<$Res> {
  __$MachineModelCopyWithImpl(this._self, this._then);

  final _MachineModel _self;
  final $Res Function(_MachineModel) _then;

/// Create a copy of MachineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? type = null,Object? factoryId = null,Object? factorySummary = freezed,Object? isActive = null,Object? kerf = freezed,}) {
  return _then(_MachineModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MachineType,factoryId: null == factoryId ? _self.factoryId : factoryId // ignore: cast_nullable_to_non_nullable
as String,factorySummary: freezed == factorySummary ? _self.factorySummary : factorySummary // ignore: cast_nullable_to_non_nullable
as MachineFactoryModel?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,kerf: freezed == kerf ? _self.kerf : kerf // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of MachineModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MachineFactoryModelCopyWith<$Res>? get factorySummary {
    if (_self.factorySummary == null) {
    return null;
  }

  return $MachineFactoryModelCopyWith<$Res>(_self.factorySummary!, (value) {
    return _then(_self.copyWith(factorySummary: value));
  });
}
}

// dart format on
