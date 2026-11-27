// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemDetailModel {

 String get id; String get orderId; String get name; double get overallWidth; double get overallHeight; double get overallDepth; int get quantity; DateTime get createdAt; ProgressModel? get progress;
/// Create a copy of ItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemDetailModelCopyWith<ItemDetailModel> get copyWith => _$ItemDetailModelCopyWithImpl<ItemDetailModel>(this as ItemDetailModel, _$identity);

  /// Serializes this ItemDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ItemDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.overallWidth, _this.overallWidth) || other.overallWidth == _this.overallWidth)&&(identical(other.overallHeight, _this.overallHeight) || other.overallHeight == _this.overallHeight)&&(identical(other.overallDepth, _this.overallDepth) || other.overallDepth == _this.overallDepth)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.progress, _this.progress) || other.progress == _this.progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ItemDetailModel;
  return Object.hash(runtimeType,_this.id,_this.orderId,_this.name,_this.overallWidth,_this.overallHeight,_this.overallDepth,_this.quantity,_this.createdAt,_this.progress);
}

@override
String toString() {
  final _this = this as ItemDetailModel;
  return 'ItemDetailModel(id: ${_this.id}, orderId: ${_this.orderId}, name: ${_this.name}, overallWidth: ${_this.overallWidth}, overallHeight: ${_this.overallHeight}, overallDepth: ${_this.overallDepth}, quantity: ${_this.quantity}, createdAt: ${_this.createdAt}, progress: ${_this.progress})';
}


}

/// @nodoc
abstract mixin class $ItemDetailModelCopyWith<$Res>  {
  factory $ItemDetailModelCopyWith(ItemDetailModel value, $Res Function(ItemDetailModel) _then) = _$ItemDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String orderId, String name, double overallWidth, double overallHeight, double overallDepth, int quantity, DateTime createdAt, ProgressModel? progress
});


$ProgressModelCopyWith<$Res>? get progress;

}
/// @nodoc
class _$ItemDetailModelCopyWithImpl<$Res>
    implements $ItemDetailModelCopyWith<$Res> {
  _$ItemDetailModelCopyWithImpl(this._self, this._then);

  final ItemDetailModel _self;
  final $Res Function(ItemDetailModel) _then;

/// Create a copy of ItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? name = null,Object? overallWidth = null,Object? overallHeight = null,Object? overallDepth = null,Object? quantity = null,Object? createdAt = null,Object? progress = freezed,}) {
  return _then(ItemDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,overallWidth: null == overallWidth ? _self.overallWidth : overallWidth // ignore: cast_nullable_to_non_nullable
as double,overallHeight: null == overallHeight ? _self.overallHeight : overallHeight // ignore: cast_nullable_to_non_nullable
as double,overallDepth: null == overallDepth ? _self.overallDepth : overallDepth // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgressModel?,
  ));
}
/// Create a copy of ItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressModelCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $ProgressModelCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItemDetailModel].
extension ItemDetailModelPatterns on ItemDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ItemDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ItemDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orderId,  String name,  double overallWidth,  double overallHeight,  double overallDepth,  int quantity,  DateTime createdAt,  ProgressModel? progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemDetailModel() when $default != null:
return $default(_that.id,_that.orderId,_that.name,_that.overallWidth,_that.overallHeight,_that.overallDepth,_that.quantity,_that.createdAt,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orderId,  String name,  double overallWidth,  double overallHeight,  double overallDepth,  int quantity,  DateTime createdAt,  ProgressModel? progress)  $default,) {final _that = this;
switch (_that) {
case _ItemDetailModel():
return $default(_that.id,_that.orderId,_that.name,_that.overallWidth,_that.overallHeight,_that.overallDepth,_that.quantity,_that.createdAt,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orderId,  String name,  double overallWidth,  double overallHeight,  double overallDepth,  int quantity,  DateTime createdAt,  ProgressModel? progress)?  $default,) {final _that = this;
switch (_that) {
case _ItemDetailModel() when $default != null:
return $default(_that.id,_that.orderId,_that.name,_that.overallWidth,_that.overallHeight,_that.overallDepth,_that.quantity,_that.createdAt,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemDetailModel implements ItemDetailModel {
  const _ItemDetailModel({required this.id, required this.orderId, required this.name, required this.overallWidth, required this.overallHeight, required this.overallDepth, required this.quantity, required this.createdAt, this.progress});
  factory _ItemDetailModel.fromJson(Map<String, dynamic> json) => _$ItemDetailModelFromJson(json);

@override final  String id;
@override final  String orderId;
@override final  String name;
@override final  double overallWidth;
@override final  double overallHeight;
@override final  double overallDepth;
@override final  int quantity;
@override final  DateTime createdAt;
@override final  ProgressModel? progress;

/// Create a copy of ItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemDetailModelCopyWith<_ItemDetailModel> get copyWith => __$ItemDetailModelCopyWithImpl<_ItemDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.name, name) || other.name == name)&&(identical(other.overallWidth, overallWidth) || other.overallWidth == overallWidth)&&(identical(other.overallHeight, overallHeight) || other.overallHeight == overallHeight)&&(identical(other.overallDepth, overallDepth) || other.overallDepth == overallDepth)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.progress, progress) || other.progress == progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderId,name,overallWidth,overallHeight,overallDepth,quantity,createdAt,progress);
}

@override
String toString() {
    return 'ItemDetailModel(id: $id, orderId: $orderId, name: $name, overallWidth: $overallWidth, overallHeight: $overallHeight, overallDepth: $overallDepth, quantity: $quantity, createdAt: $createdAt, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$ItemDetailModelCopyWith<$Res> implements $ItemDetailModelCopyWith<$Res> {
  factory _$ItemDetailModelCopyWith(_ItemDetailModel value, $Res Function(_ItemDetailModel) _then) = __$ItemDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String orderId, String name, double overallWidth, double overallHeight, double overallDepth, int quantity, DateTime createdAt, ProgressModel? progress
});


@override $ProgressModelCopyWith<$Res>? get progress;

}
/// @nodoc
class __$ItemDetailModelCopyWithImpl<$Res>
    implements _$ItemDetailModelCopyWith<$Res> {
  __$ItemDetailModelCopyWithImpl(this._self, this._then);

  final _ItemDetailModel _self;
  final $Res Function(_ItemDetailModel) _then;

/// Create a copy of ItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? name = null,Object? overallWidth = null,Object? overallHeight = null,Object? overallDepth = null,Object? quantity = null,Object? createdAt = null,Object? progress = freezed,}) {
  return _then(_ItemDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,overallWidth: null == overallWidth ? _self.overallWidth : overallWidth // ignore: cast_nullable_to_non_nullable
as double,overallHeight: null == overallHeight ? _self.overallHeight : overallHeight // ignore: cast_nullable_to_non_nullable
as double,overallDepth: null == overallDepth ? _self.overallDepth : overallDepth // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgressModel?,
  ));
}

/// Create a copy of ItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressModelCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $ProgressModelCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// @nodoc
mixin _$ProgressModel {

 ItemStatus get status; int get totalPieces; int get completedPieces; int get pendingPieces; double get progressPercent; List<StagesModel>? get stages;
/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressModelCopyWith<ProgressModel> get copyWith => _$ProgressModelCopyWithImpl<ProgressModel>(this as ProgressModel, _$identity);

  /// Serializes this ProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProgressModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.totalPieces, _this.totalPieces) || other.totalPieces == _this.totalPieces)&&(identical(other.completedPieces, _this.completedPieces) || other.completedPieces == _this.completedPieces)&&(identical(other.pendingPieces, _this.pendingPieces) || other.pendingPieces == _this.pendingPieces)&&(identical(other.progressPercent, _this.progressPercent) || other.progressPercent == _this.progressPercent)&&const DeepCollectionEquality().equals(other.stages, _this.stages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProgressModel;
  return Object.hash(runtimeType,_this.status,_this.totalPieces,_this.completedPieces,_this.pendingPieces,_this.progressPercent,const DeepCollectionEquality().hash(_this.stages));
}

@override
String toString() {
  final _this = this as ProgressModel;
  return 'ProgressModel(status: ${_this.status}, totalPieces: ${_this.totalPieces}, completedPieces: ${_this.completedPieces}, pendingPieces: ${_this.pendingPieces}, progressPercent: ${_this.progressPercent}, stages: ${_this.stages})';
}


}

/// @nodoc
abstract mixin class $ProgressModelCopyWith<$Res>  {
  factory $ProgressModelCopyWith(ProgressModel value, $Res Function(ProgressModel) _then) = _$ProgressModelCopyWithImpl;
@useResult
$Res call({
 ItemStatus status, int totalPieces, int completedPieces, int pendingPieces, double progressPercent, List<StagesModel>? stages
});




}
/// @nodoc
class _$ProgressModelCopyWithImpl<$Res>
    implements $ProgressModelCopyWith<$Res> {
  _$ProgressModelCopyWithImpl(this._self, this._then);

  final ProgressModel _self;
  final $Res Function(ProgressModel) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? totalPieces = null,Object? completedPieces = null,Object? pendingPieces = null,Object? progressPercent = null,Object? stages = freezed,}) {
  return _then(ProgressModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ItemStatus,totalPieces: null == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int,completedPieces: null == completedPieces ? _self.completedPieces : completedPieces // ignore: cast_nullable_to_non_nullable
as int,pendingPieces: null == pendingPieces ? _self.pendingPieces : pendingPieces // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as double,stages: freezed == stages ? _self.stages : stages // ignore: cast_nullable_to_non_nullable
as List<StagesModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressModel].
extension ProgressModelPatterns on ProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ItemStatus status,  int totalPieces,  int completedPieces,  int pendingPieces,  double progressPercent,  List<StagesModel>? stages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
return $default(_that.status,_that.totalPieces,_that.completedPieces,_that.pendingPieces,_that.progressPercent,_that.stages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ItemStatus status,  int totalPieces,  int completedPieces,  int pendingPieces,  double progressPercent,  List<StagesModel>? stages)  $default,) {final _that = this;
switch (_that) {
case _ProgressModel():
return $default(_that.status,_that.totalPieces,_that.completedPieces,_that.pendingPieces,_that.progressPercent,_that.stages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ItemStatus status,  int totalPieces,  int completedPieces,  int pendingPieces,  double progressPercent,  List<StagesModel>? stages)?  $default,) {final _that = this;
switch (_that) {
case _ProgressModel() when $default != null:
return $default(_that.status,_that.totalPieces,_that.completedPieces,_that.pendingPieces,_that.progressPercent,_that.stages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressModel implements ProgressModel {
  const _ProgressModel({required this.status, required this.totalPieces, required this.completedPieces, required this.pendingPieces, required this.progressPercent,  List<StagesModel>? stages}): _stages = stages;
  factory _ProgressModel.fromJson(Map<String, dynamic> json) => _$ProgressModelFromJson(json);

@override final  ItemStatus status;
@override final  int totalPieces;
@override final  int completedPieces;
@override final  int pendingPieces;
@override final  double progressPercent;
 final  List<StagesModel>? _stages;
@override List<StagesModel>? get stages {
  final value = _stages;
  if (value == null) return null;
  if (_stages is EqualUnmodifiableListView) return _stages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressModelCopyWith<_ProgressModel> get copyWith => __$ProgressModelCopyWithImpl<_ProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressModel&&(identical(other.status, status) || other.status == status)&&(identical(other.totalPieces, totalPieces) || other.totalPieces == totalPieces)&&(identical(other.completedPieces, completedPieces) || other.completedPieces == completedPieces)&&(identical(other.pendingPieces, pendingPieces) || other.pendingPieces == pendingPieces)&&(identical(other.progressPercent, progressPercent) || other.progressPercent == progressPercent)&&const DeepCollectionEquality().equals(other.stages, _stages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,totalPieces,completedPieces,pendingPieces,progressPercent,const DeepCollectionEquality().hash(_stages));
}

@override
String toString() {
    return 'ProgressModel(status: $status, totalPieces: $totalPieces, completedPieces: $completedPieces, pendingPieces: $pendingPieces, progressPercent: $progressPercent, stages: $stages)';
}


}

/// @nodoc
abstract mixin class _$ProgressModelCopyWith<$Res> implements $ProgressModelCopyWith<$Res> {
  factory _$ProgressModelCopyWith(_ProgressModel value, $Res Function(_ProgressModel) _then) = __$ProgressModelCopyWithImpl;
@override @useResult
$Res call({
 ItemStatus status, int totalPieces, int completedPieces, int pendingPieces, double progressPercent, List<StagesModel>? stages
});




}
/// @nodoc
class __$ProgressModelCopyWithImpl<$Res>
    implements _$ProgressModelCopyWith<$Res> {
  __$ProgressModelCopyWithImpl(this._self, this._then);

  final _ProgressModel _self;
  final $Res Function(_ProgressModel) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? totalPieces = null,Object? completedPieces = null,Object? pendingPieces = null,Object? progressPercent = null,Object? stages = freezed,}) {
  return _then(_ProgressModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ItemStatus,totalPieces: null == totalPieces ? _self.totalPieces : totalPieces // ignore: cast_nullable_to_non_nullable
as int,completedPieces: null == completedPieces ? _self.completedPieces : completedPieces // ignore: cast_nullable_to_non_nullable
as int,pendingPieces: null == pendingPieces ? _self.pendingPieces : pendingPieces // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as double,stages: freezed == stages ? _self._stages : stages // ignore: cast_nullable_to_non_nullable
as List<StagesModel>?,
  ));
}


}


/// @nodoc
mixin _$StagesModel {

 String get name; int get total; int get completed; double get progressPercent;
/// Create a copy of StagesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StagesModelCopyWith<StagesModel> get copyWith => _$StagesModelCopyWithImpl<StagesModel>(this as StagesModel, _$identity);

  /// Serializes this StagesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StagesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StagesModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.completed, _this.completed) || other.completed == _this.completed)&&(identical(other.progressPercent, _this.progressPercent) || other.progressPercent == _this.progressPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StagesModel;
  return Object.hash(runtimeType,_this.name,_this.total,_this.completed,_this.progressPercent);
}

@override
String toString() {
  final _this = this as StagesModel;
  return 'StagesModel(name: ${_this.name}, total: ${_this.total}, completed: ${_this.completed}, progressPercent: ${_this.progressPercent})';
}


}

/// @nodoc
abstract mixin class $StagesModelCopyWith<$Res>  {
  factory $StagesModelCopyWith(StagesModel value, $Res Function(StagesModel) _then) = _$StagesModelCopyWithImpl;
@useResult
$Res call({
 String name, int total, int completed, double progressPercent
});




}
/// @nodoc
class _$StagesModelCopyWithImpl<$Res>
    implements $StagesModelCopyWith<$Res> {
  _$StagesModelCopyWithImpl(this._self, this._then);

  final StagesModel _self;
  final $Res Function(StagesModel) _then;

/// Create a copy of StagesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? total = null,Object? completed = null,Object? progressPercent = null,}) {
  return _then(StagesModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [StagesModel].
extension StagesModelPatterns on StagesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StagesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StagesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StagesModel value)  $default,){
final _that = this;
switch (_that) {
case _StagesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StagesModel value)?  $default,){
final _that = this;
switch (_that) {
case _StagesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int total,  int completed,  double progressPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StagesModel() when $default != null:
return $default(_that.name,_that.total,_that.completed,_that.progressPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int total,  int completed,  double progressPercent)  $default,) {final _that = this;
switch (_that) {
case _StagesModel():
return $default(_that.name,_that.total,_that.completed,_that.progressPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int total,  int completed,  double progressPercent)?  $default,) {final _that = this;
switch (_that) {
case _StagesModel() when $default != null:
return $default(_that.name,_that.total,_that.completed,_that.progressPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StagesModel implements StagesModel {
  const _StagesModel({required this.name, required this.total, required this.completed, required this.progressPercent});
  factory _StagesModel.fromJson(Map<String, dynamic> json) => _$StagesModelFromJson(json);

@override final  String name;
@override final  int total;
@override final  int completed;
@override final  double progressPercent;

/// Create a copy of StagesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StagesModelCopyWith<_StagesModel> get copyWith => __$StagesModelCopyWithImpl<_StagesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StagesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StagesModel&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.progressPercent, progressPercent) || other.progressPercent == progressPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,total,completed,progressPercent);
}

@override
String toString() {
    return 'StagesModel(name: $name, total: $total, completed: $completed, progressPercent: $progressPercent)';
}


}

/// @nodoc
abstract mixin class _$StagesModelCopyWith<$Res> implements $StagesModelCopyWith<$Res> {
  factory _$StagesModelCopyWith(_StagesModel value, $Res Function(_StagesModel) _then) = __$StagesModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int total, int completed, double progressPercent
});




}
/// @nodoc
class __$StagesModelCopyWithImpl<$Res>
    implements _$StagesModelCopyWith<$Res> {
  __$StagesModelCopyWithImpl(this._self, this._then);

  final _StagesModel _self;
  final $Res Function(_StagesModel) _then;

/// Create a copy of StagesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? total = null,Object? completed = null,Object? progressPercent = null,}) {
  return _then(_StagesModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
