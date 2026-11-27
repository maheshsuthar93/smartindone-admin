import 'package:board_cut/core/enums/enums.dart';
import 'package:board_cut/features/layout_view/data/model/optimization_material_group_model.dart';
import 'package:board_cut/features/layout_view/presentation/extensions/optimization_material_group_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OptimizationPieceStatusMapper', () {
    test('maps the first unfinished process using its master data', () {
      final result = _optimizationPiece([
        _process('boring-id', ProcessStatus.pending),
        _process('cutting-id', ProcessStatus.completed),
      ]).sheetStatusUpdateFor(_processTypes);

      expect(result?.pieceId, 'piece-1');
      expect(result?.label, 'Boring');
      expect(result?.sequenceOrder, 2);
      expect(result?.color, const Color(0xFF9E9E9E));
    });

    test('colors the stripe using the current process status', () {
      final result = _optimizationPiece([
        _process('cutting-id', ProcessStatus.inProgress),
      ]).sheetStatusUpdateFor(_processTypes);

      expect(result?.color, const Color(0xFF2196F3));
    });

    test('uses the final process when all processes are completed', () {
      final result = _optimizationPiece([
        _process('boring-id', ProcessStatus.completed),
        _process('cutting-id', ProcessStatus.completed),
      ]).sheetStatusUpdateFor(_processTypes);

      expect(result?.label, 'Boring');
      expect(result?.color, const Color(0xFF4CAF50));
    });

    test('uses the failed status color for a failed current process', () {
      final result = _optimizationPiece([
        _process('cutting-id', ProcessStatus.failed),
      ]).sheetStatusUpdateFor(_processTypes);

      expect(result?.color, const Color(0xFFF44336));
    });

    test('returns no status when the piece has no process master records', () {
      expect(_optimizationPiece([]).sheetStatusUpdateFor([]), isNull);
    });

    test('shows a newly added process master as pending', () {
      final result = _optimizationPiece([]).sheetStatusUpdateFor(_processTypes);

      expect(result?.label, 'Cutting');
      expect(result?.color, const Color(0xFF9E9E9E));
    });
  });
}

OptimizationPieceProcess _process(String processTypeId, ProcessStatus status) {
  return OptimizationPieceProcess(processTypeId: processTypeId, status: status);
}

final _processTypes = [
  const OptimizationProcessType(
    id: 'cutting-id',
    name: 'Cutting',
    sequenceOrder: 1,
  ),
  const OptimizationProcessType(
    id: 'boring-id',
    name: 'Boring',
    sequenceOrder: 2,
  ),
];

OptimizationPiece _optimizationPiece(List<OptimizationPieceProcess> processes) {
  return OptimizationPiece(
    id: 'optimization-piece-1',
    materialGroupId: 'material-group-1',
    pieceId: 'piece-1',
    piece: Piece2(
      id: 'piece-1',
      pieceCode: 'P-1',
      width: 100,
      height: 200,
      thickness: 18,
      isDeleted: false,
      createdAt: DateTime.utc(2025),
      updatedAt: DateTime.utc(2025),
      partId: 'part-1',
      pieceProcesses: processes,
    ),
  );
}
