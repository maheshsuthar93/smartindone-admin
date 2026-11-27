import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class BoardsPage extends BaseStatefulScreen {
  const BoardsPage({super.key});

  @override
  BaseState<BoardsPage> createState() => _BoardsPageState();
}

class _BoardsPageState extends BaseState<BoardsPage> {
  List<PieceModelNew> pieces = [
    PieceModelNew(
      id: "P1",
      name: "Side Panel",
      width: 2400,
      height: 600,
      quantity: 4,
    ),
    PieceModelNew(
      id: "P2",
      name: "Side Panel",
      width: 1200,
      height: 500,
      quantity: 2,
      cuttingStatus: ProductionStatus.done,
    ),
    PieceModelNew(
      id: "P3",
      name: "Side Panel",
      width: 800,
      height: 400,
      quantity: 6,
      cuttingStatus: ProductionStatus.inProgress,
      boringStatus: ProductionStatus.pending,
    ),
  ];

  final double boardViewWidth = 153;
  final double boardViewHeight = 305;

  final bool _isHorizontal = true;
  List<BoardModel> boards = [];

  final Map<String, dynamic> _cutDetail = {
    'cutId': "O12345",
    'orderId': "O12345",
    'itemId': "ITEM-01",
    'material': 'A - 12MM PLY ECO-BSL-21061',
    'grain': 'Yes',
    'length': '1000',
    'width': '400',
    'quantity': '15',
    'topEdge': '10',
    'bottomEdge': '20',
    'leftEdge': '10',
    'rightEdge': '20',
    'thickness': '1',
    'cuttingStatus': "pending", // pending | cut | rejected
    'edgeBandingStatus': "pending", // pending | partial | completed
    'multiboringStatus': "pending", // pending | completed
    // Optimization info
    'sourceType': "RAW_SHEET", // RAW_SHEET | OFFCUT
    'sourceInventoryId': null,

    // Packaging
    'packageId': null,

    // Meta
    'description': "Sample description",
    'createdAt': DateTime.now(),
  };

  // 1220, 2440
  @override
  void initState() {
    super.initState();
    _addPiece();
  }

  void _addPiece() {
    final List<PieceModelOld> pieces = [];

    // Add logic to add piece based on material detail
    for (int i = 0; i < int.parse(_cutDetail['quantity']!); i++) {
      final finalWidth = CutManager.calculateCutWidth(
        finalWidth: double.parse(_cutDetail['width']!),
        leftEdgeThickness: double.parse(_cutDetail['leftEdge']!),
        rightEdgeThickness: double.parse(_cutDetail['rightEdge']!),
      );
      final finalHeight = CutManager.calculateCutHeight(
        finalHeight: double.parse(_cutDetail['length']!),
        topEdgeThickness: double.parse(_cutDetail['topEdge']!),
        bottomEdgeThickness: double.parse(_cutDetail['bottomEdge']!),
      );
      pieces.add(
        PieceModelOld(
          'Piece_${i + 1}',
          finalHeight,
          finalWidth,
          color: AppColors.secondaryColor,
        ),
      );
    }
    boards.addAll(CutManager.cutIntoMultipleBoards(pieces, true));
    setState(() {});
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SubHeader(
                  title: 'Board Layout Optimization',
                  subtitle: 'Visualize and manage cutting plans for optimal material usage.',
                ),
                _buildActions(),
              ],
            ),
            const SizedBox(height: 20),
            _boards,
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _canvas),
                  Expanded(flex: 1, child: _pieces),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _pieces => Card(
    color: AppColors.surfaceColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: pieces.length,
        itemBuilder: (context, index) {
          final piece = pieces[index];
          return PieceStatusCard(piece: piece);
        },
      ),
    ),
  );

  Widget get _canvas => Card(
    color: AppColors.surfaceColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    child: SizedBox(
      width: double.maxFinite,
      child: SizedBox(
        width: double.maxFinite,
        // width: _isHorizontal ? 520 : 420,
        height: _isHorizontal ? 320 : 520,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onTapDown: (details) {
                _handleTap(details, constraints.biggest, boards[0]);
              },
              child: CustomPaint(
                size: Size.infinite,
                painter: BoardPainter(
                  1220,
                  2440,
                  boards[0],
                  isHorizontal: _isHorizontal,
                ),
              ),
            );
          },
        ),
      ),
    ),
  );

  Widget get _boards => SizedBox(
    height: 100,
    child: ListView.builder(
      itemCount: boards.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: AppColors.surfaceColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BRD-001",
                              style: AppTextStyle.titleMedium
                                  .responsive(context)
                                  .bold
                                  .copyWith(fontSize: 16),
                            ),
                            Text(
                              'Oak veneer 18mm',
                              style: AppTextStyle.titleMedium
                                  .responsive(context)
                                  .regular
                                  .copyWith(fontSize: 13),
                            ),
                            Text(
                              '12.4% Wastage',
                              style: AppTextStyle.titleMedium
                                  .responsive(context)
                                  .regular
                                  .copyWith(fontSize: 13, color: Colors.green),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 10),
                        // Expanded(
                        //   child: SizedBox(
                        //     width: _isHorizontal ? 520 : 420,
                        //     height: _isHorizontal ? 320 : 520,
                        //     child: LayoutBuilder(
                        //       builder: (context, constraints) {
                        //         return GestureDetector(
                        //           onTapDown: (details) {
                        //             _handleTap(
                        //               details,
                        //               constraints.biggest,
                        //               board,
                        //             );
                        //           },
                        //           child: CustomPaint(
                        //             size: Size.infinite,
                        //             painter: BoardPainter(
                        //               1220,
                        //               2440,
                        //               board,
                        //               isHorizontal: _isHorizontal,
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );

  // void _handleTap(TapDownDetails details, Size size, BoardModel board) {
  //   const padding = 20.0;
  //
  //   final boardW = _isHorizontal ? 2440.0 : 1220.0;
  //   final boardH = _isHorizontal ? 1220.0 : 2440.0;
  //
  //   final usableW = size.width - padding * 2;
  //   final usableH = size.height - padding * 2;
  //
  //   final scale = math.min(usableW / boardW, usableH / boardH);
  //   final origin = const Offset(padding, padding);
  //
  //   final local = details.localPosition;
  //
  //   final boardPos = Offset(
  //     (local.dx - origin.dx) / scale,
  //     (local.dy - origin.dy) / scale,
  //   );
  //
  //   bool pieceFound = false;
  //
  //   for (final p in board.placements) {
  //     final x = _isHorizontal ? p.y : p.x;
  //     final y = _isHorizontal ? p.x : p.y;
  //     final w = _isHorizontal ? p.height : p.width;
  //     final h = _isHorizontal ? p.width : p.height;
  //
  //     final rect = Rect.fromLTWH(x, y, w, h);
  //
  //     if (rect.contains(boardPos)) {
  //       pieceFound = true;
  //       debugPrint("Tapped on piece ${p.pieceId} on board ${board.id}");
  //
  //       setState(() {
  //         // Clear everything first
  //         for (final b in boards) {
  //           b.isSelected = false;
  //           for (final item in b.placements) {
  //             item.isSelected = false;
  //           }
  //         }
  //
  //         p.isSelected = true;
  //       });
  //
  //       break;
  //     }
  //   }
  //
  //   // If no piece clicked → select whole board
  //   if (!pieceFound) {
  //     final boardRect = Rect.fromLTWH(0, 0, boardW, boardH);
  //     debugPrint("Tapped on empty area of board ${board.id}");
  //
  //     if (boardRect.contains(boardPos)) {
  //       setState(() {
  //         for (final b in boards) {
  //           b.isSelected = false;
  //           for (final item in b.placements) {
  //             item.isSelected = false;
  //           }
  //         }
  //
  //         board.isSelected = true;
  //       });
  //     }
  //   }
  // }
  Widget _buildActions() {
    return Row(
      spacing: 10,
      children: [
        FilterChip(
          label: Row(
            children: [
              Icon(
                Icons.star_border_outlined,
                size: 16,
                color: AppColors.white,
              ),
              SizedBox(width: 4),
              Text(
                "Run Optimization",
                style: AppTextStyle.titleMedium
                    .responsive(context)
                    .regular
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
          backgroundColor: AppColors.primaryColor,
          labelStyle: TextStyle(color: AppColors.white),
          onSelected: (selected) {
            //CreatePartPageRoute("1", "1").push(context);
          },
        ),
        FilterChip(
          label: Row(
            children: [
              Icon(
                Icons.app_registration_rounded,
                size: 16,
                color: AppColors.white,
              ),
              SizedBox(width: 4),
              Text(
                "Approve Boards",
                style: AppTextStyle.titleMedium
                    .responsive(context)
                    .regular
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
          backgroundColor: AppColors.primaryColor,
          labelStyle: TextStyle(color: AppColors.white),
          onSelected: (selected) {},
        ),
      ],
    );
  }

  void _handleTap(TapDownDetails details, Size size, BoardModel board) {
    const padding = 20.0;

    final boardW = _isHorizontal ? 2440.0 : 1220.0;
    final boardH = _isHorizontal ? 1220.0 : 2440.0;

    final usableW = size.width - padding * 2;
    final usableH = size.height - padding * 2;

    final scale = math.min(usableW / boardW, usableH / boardH);
    final origin = const Offset(padding, padding);

    final local = details.localPosition;

    final boardPos = Offset(
      (local.dx - origin.dx) / scale,
      (local.dy - origin.dy) / scale,
    );

    bool pieceFound = false;

    for (final p in board.placements) {
      final x = _isHorizontal ? p.y : p.x;
      final y = _isHorizontal ? p.x : p.y;
      final w = _isHorizontal ? p.height : p.width;
      final h = _isHorizontal ? p.width : p.height;

      final rect = Rect.fromLTWH(x, y, w, h);

      if (rect.contains(boardPos)) {
        pieceFound = true;
        debugPrint("Tapped on piece ${p.pieceId} on board ${board.id}");

        setState(() {
          // Clear everything first
          for (final b in boards) {
            b.isSelected = false;
            for (final item in b.placements) {
              item.isSelected = false;
            }
          }

          p.isSelected = true;
        });

        break;
      }
    }

    // If no piece clicked → select whole board
    if (!pieceFound) {
      final boardRect = Rect.fromLTWH(0, 0, boardW, boardH);
      debugPrint("Tapped on empty area of board ${board.id}");

      if (boardRect.contains(boardPos)) {
        setState(() {
          for (final b in boards) {
            b.isSelected = false;
            for (final item in b.placements) {
              item.isSelected = false;
            }
          }

          board.isSelected = true;
        });
      }
    }
  }
}

class PieceStatusCard extends StatelessWidget {
  final PieceModelNew piece;

  const PieceStatusCard({super.key, required this.piece});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surfaceColor,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(AppSize.borderRadius),
        //   // color: Color(0xffe9eef3),
        //   border: Border.all(color: Color(0xffc4d1de)),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selected Piece",
                style: AppTextStyle.titleSmall.responsive(context).bold,
              ),
              const SizedBox(height: 8),
              Text(
                "P001",
                style: AppTextStyle.titleSmall.responsive(context).bold,
              ),
              const SizedBox(height: 2),
              Text(
                "300 x 600 mm",
                style: AppTextStyle.titleSmall.responsive(context).bold,
              ),
              const SizedBox(height: 10),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${piece.name} Piece- ${piece.id}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cutting:",
                    style: AppTextStyle.titleSmall.responsive(context).regular,
                  ),
                  StatusSelector(
                    processStatus: ProcessStatus.completed,
                    onChanged: (status) {
                      // Handle status change
                    },
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Boring:",
                    style: AppTextStyle.titleSmall.responsive(context).regular,
                  ),
                  StatusSelector(
                    processStatus: ProcessStatus.completed,
                    onChanged: (status) {
                      // Handle status change
                    },
                  ),
                ],
              ),
              const SizedBox(height: 4),

              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edge Banding:",
                    style: AppTextStyle.titleSmall.responsive(context).regular,
                  ),
                  StatusSelector(
                    processStatus: ProcessStatus.completed,
                    onChanged: (status) {
                      // Handle status change
                    },
                  ),
                ],
              ),
              // Wrap(
              //   spacing: 8,
              //   runSpacing: 8,
              //   children: [
              //     StatusChip(label: "Cutting", status: piece.cuttingStatus.name),
              //     StatusChip(label: "Boring", status: piece.boringStatus.name),
              //     StatusChip(label: "Edge", status: piece.edgeBandingStatus.name),
              //     StatusChip(label: "QC", status: piece.qcStatus.name),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String label;
  final String status;

  const StatusChip({super.key, required this.label, required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // open bottom sheet to change status
      },
      child: Chip(
        label: Text("$label: $status"),
        backgroundColor: AppColors.statusColor(status),
      ),
    );
  }
}

class PieceModelNew {
  final String id;
  final String name;
  final double width;
  final double height;
  final int quantity;

  final ProductionStatus cuttingStatus;
  final ProductionStatus boringStatus;
  final ProductionStatus edgeBandingStatus;
  final ProductionStatus qcStatus;

  PieceModelNew({
    required this.id,
    required this.name,
    required this.width,
    required this.height,
    required this.quantity,
    this.cuttingStatus = ProductionStatus.pending,
    this.boringStatus = ProductionStatus.pending,
    this.edgeBandingStatus = ProductionStatus.pending,
    this.qcStatus = ProductionStatus.pending,
  });

  /// Copy with (for updating single status)
  PieceModelNew copyWith({
    ProductionStatus? cuttingStatus,
    ProductionStatus? boringStatus,
    ProductionStatus? edgeBandingStatus,
    ProductionStatus? qcStatus,
  }) {
    return PieceModelNew(
      id: id,
      name: name,
      width: width,
      height: height,
      quantity: quantity,
      cuttingStatus: cuttingStatus ?? this.cuttingStatus,
      boringStatus: boringStatus ?? this.boringStatus,
      edgeBandingStatus: edgeBandingStatus ?? this.edgeBandingStatus,
      qcStatus: qcStatus ?? this.qcStatus,
    );
  }

  /// Convert from JSON (for API)
  factory PieceModelNew.fromJson(Map<String, dynamic> json) {
    return PieceModelNew(
      id: json['id'],
      name: json['name'],
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      quantity: json['quantity'],
      cuttingStatus: ProductionStatus.values.firstWhere(
        (e) => e.name == json['cuttingStatus'],
      ),
      boringStatus: ProductionStatus.values.firstWhere(
        (e) => e.name == json['boringStatus'],
      ),
      edgeBandingStatus: ProductionStatus.values.firstWhere(
        (e) => e.name == json['edgeBandingStatus'],
      ),
      qcStatus: ProductionStatus.values.firstWhere(
        (e) => e.name == json['qcStatus'],
      ),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'width': width,
      'height': height,
      'quantity': quantity,
      'cuttingStatus': cuttingStatus.name,
      'boringStatus': boringStatus.name,
      'edgeBandingStatus': edgeBandingStatus.name,
      'qcStatus': qcStatus.name,
    };
  }
}

class StatusSelector extends StatelessWidget {
  final ProcessStatus processStatus;
  final ValueChanged<ProcessStatus> onChanged;

  const StatusSelector({
    super.key,
    required this.processStatus,
    required this.onChanged,
  });

  Color _getColor(ProcessStatus status) {
    return AppColors.statusColor(status.name);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ProcessStatus.values.map((status) {
        final bool isSelected = status == processStatus;
        return ChoiceChip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),

          label: Text(
            status.label,
            style: AppTextStyle.labelSmall
                .responsive(context)
                .regular
                .copyWith(
                  color: isSelected ? Colors.white : AppColors.primaryColor,
                ),
          ),
          labelPadding: EdgeInsets.zero,
          selected: isSelected,
          checkmarkColor: Colors.white,
          selectedColor: _getColor(status),
          backgroundColor: isSelected
              ? AppColors.primaryColor
              : Colors.grey.shade200,
          labelStyle: AppTextStyle.labelSmall
              .responsive(context)
              .regular
              .copyWith(color: isSelected ? Colors.white : Colors.black),
          onSelected: (_) => onChanged(status),
        );
      }).toList(),
    );
  }
}
