import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_detail_piece_model.freezed.dart';
part 'part_detail_piece_model.g.dart';

/*
 *      "id": "cd897fe8-cd6a-4486-865f-96c49419f7ec",
    "pieceCode": "PC-RO9QUBMT8",
    "serialNo": null,
    "width": 100,
    "height": 100,
    "thickness": 2,
    "isDeleted": false,
    "createdAt": "2026-06-20T15:55:18.040Z",
    "updatedAt": "2026-06-20T15:55:18.040Z",
    "partId": "f689d0ca-2542-48e1-853d-e4424dfffa4a",
    "barcode": null,
    "qrCode": null,
    "rotatable": true,
    "grainDirection": null,
    "edgeBandTop": null,
    "edgeBandBottom": null,
    "edgeBandLeft": null,
    "edgeBandRight": null,
    "operatorId": null
 */
@freezed
abstract class PartDetailPieceModel with _$PartDetailPieceModel {
  const factory PartDetailPieceModel({
    required String id,
    required String partId,
    required String pieceCode,
    String? serialNo,
    required double width,
    required double height,
    required double thickness,
    // required ProductionStatus cuttingStatus,
    // required ProductionStatus boringStatus,
    // required ProductionStatus edgeBandingStatus,
    // required ProductionStatus qcStatus,
    // required PackingStatus packingStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PartDetailPieceModel;

  factory PartDetailPieceModel.fromJson(Map<String, dynamic> json) =>
      _$PartDetailPieceModelFromJson(json);
}
