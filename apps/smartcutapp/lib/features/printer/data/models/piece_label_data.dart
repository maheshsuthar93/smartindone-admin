import 'package:freezed_annotation/freezed_annotation.dart';

part 'piece_label_data.freezed.dart';

@freezed
abstract class PieceLabelData with _$PieceLabelData {
  const factory PieceLabelData({
    required String pieceCode,
    required String partName,
    required String orderReference,
    required String size,
    required String material,
    required String grain,
    required String edgeBands,
    String? serialNumber,
  }) = _PieceLabelData;
}
