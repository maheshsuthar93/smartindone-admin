// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_piece_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectedPieceModel {

 String get id; int get width; int get height; String? get pieceCode; String? get partName; String? get materialName; String? get orderCode; double? get edgeBandTop; double? get edgeBandBottom; double? get edgeBandLeft; double? get edgeBandRight; int get thickness; PieceRules get part; String get createdAt; String get updatedAt; List<PieceProcess> get processes;
/// Create a copy of SelectedPieceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedPieceModelCopyWith<SelectedPieceModel> get copyWith => _$SelectedPieceModelCopyWithImpl<SelectedPieceModel>(this as SelectedPieceModel, _$identity);

  /// Serializes this SelectedPieceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SelectedPieceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedPieceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.pieceCode, _this.pieceCode) || other.pieceCode == _this.pieceCode)&&(identical(other.partName, _this.partName) || other.partName == _this.partName)&&(identical(other.materialName, _this.materialName) || other.materialName == _this.materialName)&&(identical(other.orderCode, _this.orderCode) || other.orderCode == _this.orderCode)&&(identical(other.edgeBandTop, _this.edgeBandTop) || other.edgeBandTop == _this.edgeBandTop)&&(identical(other.edgeBandBottom, _this.edgeBandBottom) || other.edgeBandBottom == _this.edgeBandBottom)&&(identical(other.edgeBandLeft, _this.edgeBandLeft) || other.edgeBandLeft == _this.edgeBandLeft)&&(identical(other.edgeBandRight, _this.edgeBandRight) || other.edgeBandRight == _this.edgeBandRight)&&(identical(other.thickness, _this.thickness) || other.thickness == _this.thickness)&&(identical(other.part, _this.part) || other.part == _this.part)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.processes, _this.processes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SelectedPieceModel;
  return Object.hash(runtimeType,_this.id,_this.width,_this.height,_this.pieceCode,_this.partName,_this.materialName,_this.orderCode,_this.edgeBandTop,_this.edgeBandBottom,_this.edgeBandLeft,_this.edgeBandRight,_this.thickness,_this.part,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.processes));
}

@override
String toString() {
  final _this = this as SelectedPieceModel;
  return 'SelectedPieceModel(id: ${_this.id}, width: ${_this.width}, height: ${_this.height}, pieceCode: ${_this.pieceCode}, partName: ${_this.partName}, materialName: ${_this.materialName}, orderCode: ${_this.orderCode}, edgeBandTop: ${_this.edgeBandTop}, edgeBandBottom: ${_this.edgeBandBottom}, edgeBandLeft: ${_this.edgeBandLeft}, edgeBandRight: ${_this.edgeBandRight}, thickness: ${_this.thickness}, part: ${_this.part}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, processes: ${_this.processes})';
}


}

/// @nodoc
abstract mixin class $SelectedPieceModelCopyWith<$Res>  {
  factory $SelectedPieceModelCopyWith(SelectedPieceModel value, $Res Function(SelectedPieceModel) _then) = _$SelectedPieceModelCopyWithImpl;
@useResult
$Res call({
 String id, int width, int height, String? pieceCode, String? partName, String? materialName, String? orderCode, double? edgeBandTop, double? edgeBandBottom, double? edgeBandLeft, double? edgeBandRight, int thickness, PieceRules part, String createdAt, String updatedAt, List<PieceProcess> processes
});


$PieceRulesCopyWith<$Res> get part;

}
/// @nodoc
class _$SelectedPieceModelCopyWithImpl<$Res>
    implements $SelectedPieceModelCopyWith<$Res> {
  _$SelectedPieceModelCopyWithImpl(this._self, this._then);

  final SelectedPieceModel _self;
  final $Res Function(SelectedPieceModel) _then;

/// Create a copy of SelectedPieceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? width = null,Object? height = null,Object? pieceCode = freezed,Object? partName = freezed,Object? materialName = freezed,Object? orderCode = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? thickness = null,Object? part = null,Object? createdAt = null,Object? updatedAt = null,Object? processes = null,}) {
  return _then(SelectedPieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,pieceCode: freezed == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String?,partName: freezed == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String?,materialName: freezed == materialName ? _self.materialName : materialName // ignore: cast_nullable_to_non_nullable
as String?,orderCode: freezed == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as double?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as double?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as double?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as double?,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as PieceRules,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,processes: null == processes ? _self.processes : processes // ignore: cast_nullable_to_non_nullable
as List<PieceProcess>,
  ));
}
/// Create a copy of SelectedPieceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieceRulesCopyWith<$Res> get part {
  
  return $PieceRulesCopyWith<$Res>(_self.part, (value) {
    return _then(_self.copyWith(part: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectedPieceModel].
extension SelectedPieceModelPatterns on SelectedPieceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedPieceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedPieceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedPieceModel value)  $default,){
final _that = this;
switch (_that) {
case _SelectedPieceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedPieceModel value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedPieceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int width,  int height,  String? pieceCode,  String? partName,  String? materialName,  String? orderCode,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  int thickness,  PieceRules part,  String createdAt,  String updatedAt,  List<PieceProcess> processes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedPieceModel() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.pieceCode,_that.partName,_that.materialName,_that.orderCode,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.thickness,_that.part,_that.createdAt,_that.updatedAt,_that.processes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int width,  int height,  String? pieceCode,  String? partName,  String? materialName,  String? orderCode,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  int thickness,  PieceRules part,  String createdAt,  String updatedAt,  List<PieceProcess> processes)  $default,) {final _that = this;
switch (_that) {
case _SelectedPieceModel():
return $default(_that.id,_that.width,_that.height,_that.pieceCode,_that.partName,_that.materialName,_that.orderCode,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.thickness,_that.part,_that.createdAt,_that.updatedAt,_that.processes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int width,  int height,  String? pieceCode,  String? partName,  String? materialName,  String? orderCode,  double? edgeBandTop,  double? edgeBandBottom,  double? edgeBandLeft,  double? edgeBandRight,  int thickness,  PieceRules part,  String createdAt,  String updatedAt,  List<PieceProcess> processes)?  $default,) {final _that = this;
switch (_that) {
case _SelectedPieceModel() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.pieceCode,_that.partName,_that.materialName,_that.orderCode,_that.edgeBandTop,_that.edgeBandBottom,_that.edgeBandLeft,_that.edgeBandRight,_that.thickness,_that.part,_that.createdAt,_that.updatedAt,_that.processes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectedPieceModel implements SelectedPieceModel {
  const _SelectedPieceModel({required this.id, required this.width, required this.height, this.pieceCode, this.partName, this.materialName, this.orderCode, this.edgeBandTop, this.edgeBandBottom, this.edgeBandLeft, this.edgeBandRight, required this.thickness, required this.part, required this.createdAt, required this.updatedAt, required  List<PieceProcess> processes}): _processes = processes;
  factory _SelectedPieceModel.fromJson(Map<String, dynamic> json) => _$SelectedPieceModelFromJson(json);

@override final  String id;
@override final  int width;
@override final  int height;
@override final  String? pieceCode;
@override final  String? partName;
@override final  String? materialName;
@override final  String? orderCode;
@override final  double? edgeBandTop;
@override final  double? edgeBandBottom;
@override final  double? edgeBandLeft;
@override final  double? edgeBandRight;
@override final  int thickness;
@override final  PieceRules part;
@override final  String createdAt;
@override final  String updatedAt;
 final  List<PieceProcess> _processes;
@override List<PieceProcess> get processes {
  if (_processes is EqualUnmodifiableListView) return _processes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_processes);
}


/// Create a copy of SelectedPieceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedPieceModelCopyWith<_SelectedPieceModel> get copyWith => __$SelectedPieceModelCopyWithImpl<_SelectedPieceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectedPieceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedPieceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.pieceCode, pieceCode) || other.pieceCode == pieceCode)&&(identical(other.partName, partName) || other.partName == partName)&&(identical(other.materialName, materialName) || other.materialName == materialName)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.edgeBandTop, edgeBandTop) || other.edgeBandTop == edgeBandTop)&&(identical(other.edgeBandBottom, edgeBandBottom) || other.edgeBandBottom == edgeBandBottom)&&(identical(other.edgeBandLeft, edgeBandLeft) || other.edgeBandLeft == edgeBandLeft)&&(identical(other.edgeBandRight, edgeBandRight) || other.edgeBandRight == edgeBandRight)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.part, part) || other.part == part)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.processes, _processes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,width,height,pieceCode,partName,materialName,orderCode,edgeBandTop,edgeBandBottom,edgeBandLeft,edgeBandRight,thickness,part,createdAt,updatedAt,const DeepCollectionEquality().hash(_processes));
}

@override
String toString() {
    return 'SelectedPieceModel(id: $id, width: $width, height: $height, pieceCode: $pieceCode, partName: $partName, materialName: $materialName, orderCode: $orderCode, edgeBandTop: $edgeBandTop, edgeBandBottom: $edgeBandBottom, edgeBandLeft: $edgeBandLeft, edgeBandRight: $edgeBandRight, thickness: $thickness, part: $part, createdAt: $createdAt, updatedAt: $updatedAt, processes: $processes)';
}


}

/// @nodoc
abstract mixin class _$SelectedPieceModelCopyWith<$Res> implements $SelectedPieceModelCopyWith<$Res> {
  factory _$SelectedPieceModelCopyWith(_SelectedPieceModel value, $Res Function(_SelectedPieceModel) _then) = __$SelectedPieceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int width, int height, String? pieceCode, String? partName, String? materialName, String? orderCode, double? edgeBandTop, double? edgeBandBottom, double? edgeBandLeft, double? edgeBandRight, int thickness, PieceRules part, String createdAt, String updatedAt, List<PieceProcess> processes
});


@override $PieceRulesCopyWith<$Res> get part;

}
/// @nodoc
class __$SelectedPieceModelCopyWithImpl<$Res>
    implements _$SelectedPieceModelCopyWith<$Res> {
  __$SelectedPieceModelCopyWithImpl(this._self, this._then);

  final _SelectedPieceModel _self;
  final $Res Function(_SelectedPieceModel) _then;

/// Create a copy of SelectedPieceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? width = null,Object? height = null,Object? pieceCode = freezed,Object? partName = freezed,Object? materialName = freezed,Object? orderCode = freezed,Object? edgeBandTop = freezed,Object? edgeBandBottom = freezed,Object? edgeBandLeft = freezed,Object? edgeBandRight = freezed,Object? thickness = null,Object? part = null,Object? createdAt = null,Object? updatedAt = null,Object? processes = null,}) {
  return _then(_SelectedPieceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,pieceCode: freezed == pieceCode ? _self.pieceCode : pieceCode // ignore: cast_nullable_to_non_nullable
as String?,partName: freezed == partName ? _self.partName : partName // ignore: cast_nullable_to_non_nullable
as String?,materialName: freezed == materialName ? _self.materialName : materialName // ignore: cast_nullable_to_non_nullable
as String?,orderCode: freezed == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String?,edgeBandTop: freezed == edgeBandTop ? _self.edgeBandTop : edgeBandTop // ignore: cast_nullable_to_non_nullable
as double?,edgeBandBottom: freezed == edgeBandBottom ? _self.edgeBandBottom : edgeBandBottom // ignore: cast_nullable_to_non_nullable
as double?,edgeBandLeft: freezed == edgeBandLeft ? _self.edgeBandLeft : edgeBandLeft // ignore: cast_nullable_to_non_nullable
as double?,edgeBandRight: freezed == edgeBandRight ? _self.edgeBandRight : edgeBandRight // ignore: cast_nullable_to_non_nullable
as double?,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,part: null == part ? _self.part : part // ignore: cast_nullable_to_non_nullable
as PieceRules,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,processes: null == processes ? _self._processes : processes // ignore: cast_nullable_to_non_nullable
as List<PieceProcess>,
  ));
}

/// Create a copy of SelectedPieceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieceRulesCopyWith<$Res> get part {
  
  return $PieceRulesCopyWith<$Res>(_self.part, (value) {
    return _then(_self.copyWith(part: value));
  });
}
}


/// @nodoc
mixin _$PieceRules {

 bool get grain; GrainDirection get grainDirection; bool get rotatable;
/// Create a copy of PieceRules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceRulesCopyWith<PieceRules> get copyWith => _$PieceRulesCopyWithImpl<PieceRules>(this as PieceRules, _$identity);

  /// Serializes this PieceRules to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PieceRules;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieceRules&&(identical(other.grain, _this.grain) || other.grain == _this.grain)&&(identical(other.grainDirection, _this.grainDirection) || other.grainDirection == _this.grainDirection)&&(identical(other.rotatable, _this.rotatable) || other.rotatable == _this.rotatable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PieceRules;
  return Object.hash(runtimeType,_this.grain,_this.grainDirection,_this.rotatable);
}

@override
String toString() {
  final _this = this as PieceRules;
  return 'PieceRules(grain: ${_this.grain}, grainDirection: ${_this.grainDirection}, rotatable: ${_this.rotatable})';
}


}

/// @nodoc
abstract mixin class $PieceRulesCopyWith<$Res>  {
  factory $PieceRulesCopyWith(PieceRules value, $Res Function(PieceRules) _then) = _$PieceRulesCopyWithImpl;
@useResult
$Res call({
 bool grain, GrainDirection grainDirection, bool rotatable
});




}
/// @nodoc
class _$PieceRulesCopyWithImpl<$Res>
    implements $PieceRulesCopyWith<$Res> {
  _$PieceRulesCopyWithImpl(this._self, this._then);

  final PieceRules _self;
  final $Res Function(PieceRules) _then;

/// Create a copy of PieceRules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? grain = null,Object? grainDirection = null,Object? rotatable = null,}) {
  return _then(PieceRules(
grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PieceRules].
extension PieceRulesPatterns on PieceRules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieceRules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieceRules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieceRules value)  $default,){
final _that = this;
switch (_that) {
case _PieceRules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieceRules value)?  $default,){
final _that = this;
switch (_that) {
case _PieceRules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool grain,  GrainDirection grainDirection,  bool rotatable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieceRules() when $default != null:
return $default(_that.grain,_that.grainDirection,_that.rotatable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool grain,  GrainDirection grainDirection,  bool rotatable)  $default,) {final _that = this;
switch (_that) {
case _PieceRules():
return $default(_that.grain,_that.grainDirection,_that.rotatable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool grain,  GrainDirection grainDirection,  bool rotatable)?  $default,) {final _that = this;
switch (_that) {
case _PieceRules() when $default != null:
return $default(_that.grain,_that.grainDirection,_that.rotatable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PieceRules implements PieceRules {
  const _PieceRules({required this.grain, required this.grainDirection, required this.rotatable});
  factory _PieceRules.fromJson(Map<String, dynamic> json) => _$PieceRulesFromJson(json);

@override final  bool grain;
@override final  GrainDirection grainDirection;
@override final  bool rotatable;

/// Create a copy of PieceRules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceRulesCopyWith<_PieceRules> get copyWith => __$PieceRulesCopyWithImpl<_PieceRules>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PieceRulesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceRules&&(identical(other.grain, grain) || other.grain == grain)&&(identical(other.grainDirection, grainDirection) || other.grainDirection == grainDirection)&&(identical(other.rotatable, rotatable) || other.rotatable == rotatable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,grain,grainDirection,rotatable);
}

@override
String toString() {
    return 'PieceRules(grain: $grain, grainDirection: $grainDirection, rotatable: $rotatable)';
}


}

/// @nodoc
abstract mixin class _$PieceRulesCopyWith<$Res> implements $PieceRulesCopyWith<$Res> {
  factory _$PieceRulesCopyWith(_PieceRules value, $Res Function(_PieceRules) _then) = __$PieceRulesCopyWithImpl;
@override @useResult
$Res call({
 bool grain, GrainDirection grainDirection, bool rotatable
});




}
/// @nodoc
class __$PieceRulesCopyWithImpl<$Res>
    implements _$PieceRulesCopyWith<$Res> {
  __$PieceRulesCopyWithImpl(this._self, this._then);

  final _PieceRules _self;
  final $Res Function(_PieceRules) _then;

/// Create a copy of PieceRules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? grain = null,Object? grainDirection = null,Object? rotatable = null,}) {
  return _then(_PieceRules(
grain: null == grain ? _self.grain : grain // ignore: cast_nullable_to_non_nullable
as bool,grainDirection: null == grainDirection ? _self.grainDirection : grainDirection // ignore: cast_nullable_to_non_nullable
as GrainDirection,rotatable: null == rotatable ? _self.rotatable : rotatable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PieceProcess {

 String? get id; ProcessType get processType; ProcessStatus get status; String? get remarks; String? get machineId; String? get operatorId; DateTime? get startedAt; DateTime? get completedAt;
/// Create a copy of PieceProcess
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieceProcessCopyWith<PieceProcess> get copyWith => _$PieceProcessCopyWithImpl<PieceProcess>(this as PieceProcess, _$identity);

  /// Serializes this PieceProcess to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PieceProcess;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieceProcess&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.processType, _this.processType) || other.processType == _this.processType)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.remarks, _this.remarks) || other.remarks == _this.remarks)&&(identical(other.machineId, _this.machineId) || other.machineId == _this.machineId)&&(identical(other.operatorId, _this.operatorId) || other.operatorId == _this.operatorId)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PieceProcess;
  return Object.hash(runtimeType,_this.id,_this.processType,_this.status,_this.remarks,_this.machineId,_this.operatorId,_this.startedAt,_this.completedAt);
}

@override
String toString() {
  final _this = this as PieceProcess;
  return 'PieceProcess(id: ${_this.id}, processType: ${_this.processType}, status: ${_this.status}, remarks: ${_this.remarks}, machineId: ${_this.machineId}, operatorId: ${_this.operatorId}, startedAt: ${_this.startedAt}, completedAt: ${_this.completedAt})';
}


}

/// @nodoc
abstract mixin class $PieceProcessCopyWith<$Res>  {
  factory $PieceProcessCopyWith(PieceProcess value, $Res Function(PieceProcess) _then) = _$PieceProcessCopyWithImpl;
@useResult
$Res call({
 String? id, ProcessType processType, ProcessStatus status, String? remarks, String? machineId, String? operatorId, DateTime? startedAt, DateTime? completedAt
});


$ProcessTypeCopyWith<$Res> get processType;

}
/// @nodoc
class _$PieceProcessCopyWithImpl<$Res>
    implements $PieceProcessCopyWith<$Res> {
  _$PieceProcessCopyWithImpl(this._self, this._then);

  final PieceProcess _self;
  final $Res Function(PieceProcess) _then;

/// Create a copy of PieceProcess
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? processType = null,Object? status = null,Object? remarks = freezed,Object? machineId = freezed,Object? operatorId = freezed,Object? startedAt = freezed,Object? completedAt = freezed,}) {
  return _then(PieceProcess(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,processType: null == processType ? _self.processType : processType // ignore: cast_nullable_to_non_nullable
as ProcessType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProcessStatus,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,machineId: freezed == machineId ? _self.machineId : machineId // ignore: cast_nullable_to_non_nullable
as String?,operatorId: freezed == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of PieceProcess
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessTypeCopyWith<$Res> get processType {
  
  return $ProcessTypeCopyWith<$Res>(_self.processType, (value) {
    return _then(_self.copyWith(processType: value));
  });
}
}


/// Adds pattern-matching-related methods to [PieceProcess].
extension PieceProcessPatterns on PieceProcess {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieceProcess value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieceProcess() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieceProcess value)  $default,){
final _that = this;
switch (_that) {
case _PieceProcess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieceProcess value)?  $default,){
final _that = this;
switch (_that) {
case _PieceProcess() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  ProcessType processType,  ProcessStatus status,  String? remarks,  String? machineId,  String? operatorId,  DateTime? startedAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieceProcess() when $default != null:
return $default(_that.id,_that.processType,_that.status,_that.remarks,_that.machineId,_that.operatorId,_that.startedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  ProcessType processType,  ProcessStatus status,  String? remarks,  String? machineId,  String? operatorId,  DateTime? startedAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _PieceProcess():
return $default(_that.id,_that.processType,_that.status,_that.remarks,_that.machineId,_that.operatorId,_that.startedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  ProcessType processType,  ProcessStatus status,  String? remarks,  String? machineId,  String? operatorId,  DateTime? startedAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _PieceProcess() when $default != null:
return $default(_that.id,_that.processType,_that.status,_that.remarks,_that.machineId,_that.operatorId,_that.startedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PieceProcess implements PieceProcess {
  const _PieceProcess({this.id, required this.processType, required this.status, this.remarks, this.machineId, this.operatorId, this.startedAt, this.completedAt});
  factory _PieceProcess.fromJson(Map<String, dynamic> json) => _$PieceProcessFromJson(json);

@override final  String? id;
@override final  ProcessType processType;
@override final  ProcessStatus status;
@override final  String? remarks;
@override final  String? machineId;
@override final  String? operatorId;
@override final  DateTime? startedAt;
@override final  DateTime? completedAt;

/// Create a copy of PieceProcess
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieceProcessCopyWith<_PieceProcess> get copyWith => __$PieceProcessCopyWithImpl<_PieceProcess>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PieceProcessToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieceProcess&&(identical(other.id, id) || other.id == id)&&(identical(other.processType, processType) || other.processType == processType)&&(identical(other.status, status) || other.status == status)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.machineId, machineId) || other.machineId == machineId)&&(identical(other.operatorId, operatorId) || other.operatorId == operatorId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,processType,status,remarks,machineId,operatorId,startedAt,completedAt);
}

@override
String toString() {
    return 'PieceProcess(id: $id, processType: $processType, status: $status, remarks: $remarks, machineId: $machineId, operatorId: $operatorId, startedAt: $startedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$PieceProcessCopyWith<$Res> implements $PieceProcessCopyWith<$Res> {
  factory _$PieceProcessCopyWith(_PieceProcess value, $Res Function(_PieceProcess) _then) = __$PieceProcessCopyWithImpl;
@override @useResult
$Res call({
 String? id, ProcessType processType, ProcessStatus status, String? remarks, String? machineId, String? operatorId, DateTime? startedAt, DateTime? completedAt
});


@override $ProcessTypeCopyWith<$Res> get processType;

}
/// @nodoc
class __$PieceProcessCopyWithImpl<$Res>
    implements _$PieceProcessCopyWith<$Res> {
  __$PieceProcessCopyWithImpl(this._self, this._then);

  final _PieceProcess _self;
  final $Res Function(_PieceProcess) _then;

/// Create a copy of PieceProcess
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? processType = null,Object? status = null,Object? remarks = freezed,Object? machineId = freezed,Object? operatorId = freezed,Object? startedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_PieceProcess(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,processType: null == processType ? _self.processType : processType // ignore: cast_nullable_to_non_nullable
as ProcessType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProcessStatus,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,machineId: freezed == machineId ? _self.machineId : machineId // ignore: cast_nullable_to_non_nullable
as String?,operatorId: freezed == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of PieceProcess
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessTypeCopyWith<$Res> get processType {
  
  return $ProcessTypeCopyWith<$Res>(_self.processType, (value) {
    return _then(_self.copyWith(processType: value));
  });
}
}


/// @nodoc
mixin _$ProcessType {

 String get id; String get name; int get sequenceOrder;
/// Create a copy of ProcessType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessTypeCopyWith<ProcessType> get copyWith => _$ProcessTypeCopyWithImpl<ProcessType>(this as ProcessType, _$identity);

  /// Serializes this ProcessType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProcessType;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessType&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sequenceOrder, _this.sequenceOrder) || other.sequenceOrder == _this.sequenceOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProcessType;
  return Object.hash(runtimeType,_this.id,_this.name,_this.sequenceOrder);
}

@override
String toString() {
  final _this = this as ProcessType;
  return 'ProcessType(id: ${_this.id}, name: ${_this.name}, sequenceOrder: ${_this.sequenceOrder})';
}


}

/// @nodoc
abstract mixin class $ProcessTypeCopyWith<$Res>  {
  factory $ProcessTypeCopyWith(ProcessType value, $Res Function(ProcessType) _then) = _$ProcessTypeCopyWithImpl;
@useResult
$Res call({
 String id, String name, int sequenceOrder
});




}
/// @nodoc
class _$ProcessTypeCopyWithImpl<$Res>
    implements $ProcessTypeCopyWith<$Res> {
  _$ProcessTypeCopyWithImpl(this._self, this._then);

  final ProcessType _self;
  final $Res Function(ProcessType) _then;

/// Create a copy of ProcessType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sequenceOrder = null,}) {
  return _then(ProcessType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessType].
extension ProcessTypePatterns on ProcessType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessType value)  $default,){
final _that = this;
switch (_that) {
case _ProcessType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessType value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int sequenceOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessType() when $default != null:
return $default(_that.id,_that.name,_that.sequenceOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int sequenceOrder)  $default,) {final _that = this;
switch (_that) {
case _ProcessType():
return $default(_that.id,_that.name,_that.sequenceOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int sequenceOrder)?  $default,) {final _that = this;
switch (_that) {
case _ProcessType() when $default != null:
return $default(_that.id,_that.name,_that.sequenceOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessType implements ProcessType {
  const _ProcessType({required this.id, required this.name, required this.sequenceOrder});
  factory _ProcessType.fromJson(Map<String, dynamic> json) => _$ProcessTypeFromJson(json);

@override final  String id;
@override final  String name;
@override final  int sequenceOrder;

/// Create a copy of ProcessType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessTypeCopyWith<_ProcessType> get copyWith => __$ProcessTypeCopyWithImpl<_ProcessType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessTypeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,sequenceOrder);
}

@override
String toString() {
    return 'ProcessType(id: $id, name: $name, sequenceOrder: $sequenceOrder)';
}


}

/// @nodoc
abstract mixin class _$ProcessTypeCopyWith<$Res> implements $ProcessTypeCopyWith<$Res> {
  factory _$ProcessTypeCopyWith(_ProcessType value, $Res Function(_ProcessType) _then) = __$ProcessTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int sequenceOrder
});




}
/// @nodoc
class __$ProcessTypeCopyWithImpl<$Res>
    implements _$ProcessTypeCopyWith<$Res> {
  __$ProcessTypeCopyWithImpl(this._self, this._then);

  final _ProcessType _self;
  final $Res Function(_ProcessType) _then;

/// Create a copy of ProcessType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sequenceOrder = null,}) {
  return _then(_ProcessType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
