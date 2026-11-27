import 'dart:ui';

import '../../../../core/enums/enums.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/model/optimization_material_group_model.dart';

import 'package:sheet_viewer/sheet_viewer.dart' as sheet_lib;

extension OptimizationPieceStatusMapper on OptimizationPiece {
  sheet_lib.PieceStatusUpdate? sheetStatusUpdateFor(
    Iterable<OptimizationProcessType> processTypes,
  ) {
    final orderedProcessTypes = processTypes.toList()
      ..sort((a, b) => a.sequenceOrder.compareTo(b.sequenceOrder));
    if (orderedProcessTypes.isEmpty) return null;
    final pieceProcessesByType = {
      for (final process in piece.pieceProcesses)
        process.processTypeId: process,
    };

    final currentProcessType = orderedProcessTypes.firstWhere(
      (processType) =>
          pieceProcessesByType[processType.id]?.status !=
          ProcessStatus.completed,
      orElse: () => orderedProcessTypes.last,
    );
    final currentProcessStatus =
        pieceProcessesByType[currentProcessType.id]?.status;

    return sheet_lib.PieceStatusUpdate(
      pieceId: piece.id,
      label: currentProcessType.name,
      color: AppColors.statusColor(
        (currentProcessStatus ?? ProcessStatus.pending).name,
      ),
      sequenceOrder: currentProcessType.sequenceOrder,
    );
  }
}

extension OptimizationProcessTypeMapper on OptimizationProcessType {
  sheet_lib.ProcessTypeLegendItem get legendItem =>
      sheet_lib.ProcessTypeLegendItem(
        name: name,
        sequenceOrder: sequenceOrder,
        color: _processTypeColor(sequenceOrder),
      );
}

Color _processTypeColor(int sequenceOrder) {
  const colors = [
    Color(0xFF2196F3),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFF009688),
    Color(0xFF3F51B5),
    Color(0xFFE91E63),
    Color(0xFF795548),
    Color(0xFF607D8B),
  ];
  return colors[(sequenceOrder > 0 ? sequenceOrder - 1 : 0) % colors.length];
}

extension OptimizationMaterialGroupMapper on OptimizationMaterialGroupModel {
  sheet_lib.SheetLayout toSheetLayout(OptimizationLayoutModel layout) {
    return sheet_lib.SheetLayout(
      materials: [
        sheet_lib.SheetMaterial(
          id: material.id,
          name: material.name,
          color: _materialColor(material.type),
        ),
      ],
      sheets: layout.sheets.map((sheet) {
        final physicalSheet = sheet.sheet;
        final sheetRotated =
            physicalSheet != null &&
            physicalSheet.width == sheet.height &&
            physicalSheet.height == sheet.width &&
            !(physicalSheet.width == sheet.width &&
                physicalSheet.height == sheet.height);
        final displayWidth = sheetRotated ? physicalSheet.width : sheet.width;
        final displayHeight = sheetRotated
            ? physicalSheet.height
            : sheet.height;
        return sheet_lib.Sheet(
          id: sheet.id,
          name: '$displayWidth x $displayHeight',
          width: displayWidth,
          height: displayHeight,

          pieces: [
            // --------------------------------------------------
            // Normal pieces
            // --------------------------------------------------
            ...sheet.layoutItems.map((item) {
              final piece = item.optimizationPiece.piece;

              return sheet_lib.Piece(
                id: piece.id,
                label: piece.part?.name ?? '',
                materialId: material.id,
                type: sheet_lib.PieceType.normal,
                grainDirection: _grainDirection(
                  piece.part?.grain == true ? piece.part?.grainDirection : null,
                  rotated: item.rotated != sheetRotated,
                ),
                bounds: sheet_lib.PieceBounds(
                  x: sheetRotated
                      ? sheet.height - item.y - item.height
                      : item.x,
                  y: sheetRotated ? item.x : item.y,
                  width: sheetRotated ? item.height : item.width,
                  height: sheetRotated ? item.width : item.height,
                ),
              );
            }),

            // --------------------------------------------------
            // Unused / remaining areas
            // --------------------------------------------------
            // ...sheet.remainingAreas.map((area) {
            //   return sheet_lib.Piece(
            //     id: area.id,
            //     label: 'Unused Area',
            //     materialId: material.id,
            //     type: sheet_lib.PieceType.unused,
            //     bounds: sheet_lib.PieceBounds(
            //       x: area.x,
            //       y: area.y,
            //       width: area.width,
            //       height: area.height,
            //     ),
            //   );
            // }),
            ...sheet.remainingAreas.map((area) {
              return sheet_lib.Piece(
                id: area.id,
                label: 'Unused',
                materialId: material.id,
                type: sheet_lib.PieceType.unused,
                data: area,
                bounds: sheet_lib.PieceBounds(
                  x: sheetRotated
                      ? sheet.height - area.y - area.height
                      : area.x,
                  y: sheetRotated ? area.x : area.y,
                  width: sheetRotated ? area.height : area.width,
                  height: sheetRotated ? area.width : area.height,
                ),
              );
            }),
          ],
        );
      }).toList(),
    );
  }

  Color _materialColor(MaterialType type) {
    switch (type) {
      case MaterialType.mdf:
        return const Color(0xFFE6C79C);

      case MaterialType.hdhmr:
        return const Color(0xFFD6B98C);

      case MaterialType.plywood:
        return const Color(0xFFC89B6D);

      case MaterialType.particleBoard:
        return const Color(0xFFBFA47A);

      case MaterialType.laminate:
        return const Color(0x0fffffff);

      case MaterialType.acrylic:
        return const Color(0xFFE8F1F8);

      case MaterialType.aluminium:
        return const Color(0xFFB8BEC5);

      case MaterialType.other:
        return const Color(0xFFD1D5DB);
      case MaterialType.consumable:
        return const Color(0xFFD1D5DB);
      case MaterialType.unknown:
        return const Color(0xFFD1D5DB);
    }
  }

  sheet_lib.GrainDirection _grainDirection(
    GrainDirection? value, {
    required bool rotated,
  }) {
    if (value == null || value == GrainDirection.none) {
      return sheet_lib.GrainDirection.none;
    }

    final visibleDirection = rotated
        ? switch (value) {
            GrainDirection.length => GrainDirection.width,
            GrainDirection.width => GrainDirection.length,
            GrainDirection.none => GrainDirection.none,
          }
        : value;

    switch (visibleDirection) {
      case GrainDirection.length:
        return sheet_lib.GrainDirection.vertical;

      case GrainDirection.width:
        return sheet_lib.GrainDirection.horizontal;
      case GrainDirection.none:
        return sheet_lib.GrainDirection.none;
    }
  }
}
