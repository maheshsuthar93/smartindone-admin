import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:board_cut/core/enums/enums.dart';

part 'piece_model.freezed.dart';

part 'piece_model.g.dart';

@freezed
abstract class PieceModel with _$PieceModel {
  const factory PieceModel({
    required String id,
    required String pieceCode,
    required double width,
    required double height,
    required double thickness,
    required ProductionStatus cuttingStatus,
    required ProductionStatus qcStatus,
    required PackingStatus packingStatus,
  }) = _PieceModel;

  factory PieceModel.fromJson(Map<String, dynamic> json) =>
      _$PieceModelFromJson(json);
}
