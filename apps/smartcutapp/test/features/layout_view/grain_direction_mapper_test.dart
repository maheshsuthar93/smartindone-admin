import 'package:board_cut/core/enums/enums.dart';
import 'package:board_cut/features/layout_view/data/model/optimization_material_group_model.dart';
import 'package:board_cut/features/layout_view/presentation/extensions/optimization_material_group_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sheet_viewer/sheet_viewer.dart' as sheet_lib;

void main() {
  test('grain-off pieces have no grain indicator', () {
    final layout =
        _group(
          grain: false,
          direction: GrainDirection.length,
          itemRotated: false,
        ).toSheetLayout(
          _layout(
            rotatedSheet: false,
            grain: false,
            direction: GrainDirection.length,
          ),
        );

    expect(
      layout.sheets.single.pieces.single.grainDirection,
      sheet_lib.GrainDirection.none,
    );
  });

  test('rotated pieces show their grain axis after rotation', () {
    final group = _group(
      grain: true,
      direction: GrainDirection.length,
      itemRotated: true,
    );

    expect(
      group
          .toSheetLayout(
            _layout(
              rotatedSheet: false,
              grain: true,
              direction: GrainDirection.length,
              rotated: true,
            ),
          )
          .sheets
          .single
          .pieces
          .single
          .grainDirection,
      sheet_lib.GrainDirection.horizontal,
    );
  });

  test('viewer accounts for a physical sheet rotated against the layout', () {
    final group = _group(
      grain: true,
      direction: GrainDirection.length,
      itemRotated: false,
    );

    final sheet = group
        .toSheetLayout(
          _layout(
            rotatedSheet: true,
            grain: true,
            direction: GrainDirection.length,
          ),
        )
        .sheets
        .single;

    expect(sheet.width, 1220);
    expect(sheet.height, 2440);
    expect(sheet.pieces.single.bounds.x, 1020);
    expect(sheet.pieces.single.bounds.y, 0);
    expect(sheet.pieces.single.bounds.width, 200);
    expect(sheet.pieces.single.bounds.height, 100);
    expect(
      sheet.pieces.single.grainDirection,
      sheet_lib.GrainDirection.horizontal,
    );
  });
}

OptimizationMaterialGroupModel _group({
  required bool grain,
  required GrainDirection direction,
  required bool itemRotated,
}) {
  final now = DateTime.utc(2026);
  final optimizationPiece = OptimizationPiece(
    id: 'optimization-piece',
    materialGroupId: 'group',
    pieceId: 'piece',
    piece: Piece2(
      id: 'piece',
      pieceCode: 'P-1',
      width: 100,
      height: 200,
      thickness: 18,
      isDeleted: false,
      createdAt: now,
      updatedAt: now,
      partId: 'part',
      part: Part(
        id: 'part',
        name: 'Panel',
        materialId: 'material',
        grain: grain,
        grainDirection: direction,
        rotatable: true,
      ),
    ),
  );

  return OptimizationMaterialGroupModel(
    id: 'group',
    optimizationId: 'optimization',
    materialId: 'material',
    createdAt: now,
    updatedAt: now,
    status: 'COMPLETED',
    optimization: const Optimization(
      id: 'optimization',
      optimizationNo: 'OPT-1',
      orderId: 'order',
      status: 'COMPLETED',
    ),
    material: MaterialModel(
      id: 'material',
      name: 'Plywood',
      code: 'PLY-1',
      type: MaterialType.plywood,
      thickness: 18,
      createdAt: now,
      updatedAt: now,
      unit: 'SHEET',
    ),
    pieces: [optimizationPiece],
    layouts: [
      _layout(
        rotatedSheet: false,
        grain: grain,
        direction: direction,
        piece: optimizationPiece,
        rotated: itemRotated,
      ),
    ],
  );
}

OptimizationLayoutModel _layout({
  required bool rotatedSheet,
  required bool grain,
  required GrainDirection direction,
  OptimizationPiece? piece,
  bool rotated = false,
}) {
  final now = DateTime.utc(2026);
  final optimizationPiece =
      piece ??
      OptimizationPiece(
        id: 'optimization-piece',
        materialGroupId: 'group',
        pieceId: 'piece',
        piece: Piece2(
          id: 'piece',
          pieceCode: 'P-1',
          width: 100,
          height: 200,
          thickness: 18,
          isDeleted: false,
          createdAt: now,
          updatedAt: now,
          partId: 'part',
          part: Part(
            id: 'part',
            name: 'Panel',
            materialId: 'material',
            grain: grain,
            grainDirection: direction,
            rotatable: true,
          ),
        ),
      );

  return OptimizationLayoutModel(
    id: 'layout',
    materialGroupId: 'group',
    status: LayoutStatus.selected,
    sheetCount: 1,
    createdAt: now,
    updatedAt: now,
    sheets: [
      OptimizationSheetModel(
        id: 'optimization-sheet',
        layoutId: 'layout',
        sheetId: rotatedSheet ? 'physical-sheet' : null,
        sheetNo: 1,
        width: 2440,
        height: 1220,
        sheet: rotatedSheet
            ? const PhysicalSheetOrientation(
                id: 'physical-sheet',
                width: 1220,
                height: 2440,
                grainDirection: GrainDirection.length,
              )
            : null,
        createdAt: now,
        updatedAt: now,
        layoutItems: [
          LayoutItem(
            id: 'layout-item',
            optimizationSheetId: 'optimization-sheet',
            optimizationPieceId: 'optimization-piece',
            x: 0,
            y: 0,
            width: 100,
            height: 200,
            rotated: rotated,
            createdAt: now,
            optimizationPiece: optimizationPiece,
          ),
        ],
      ),
    ],
  );
}
