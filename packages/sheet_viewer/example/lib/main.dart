import 'package:flutter/material.dart';
import 'package:sheet_viewer/sheet_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sheet Viewer Demo',
      theme: ThemeData(useMaterial3: true),
      home: const ViewerPage(),
    );
  }
}

class ViewerPage extends StatefulWidget {
  const ViewerPage({super.key});

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  late final SheetViewerController controller;

  @override
  void initState() {
    super.initState();

    controller = SheetViewerController(layout: _layout);
    controller.status.setStatuses([
      PieceStatusUpdate(pieceId: 'P1', status: PieceStatus.completed),
      PieceStatusUpdate(pieceId: 'P2', status: PieceStatus.cutting),
      PieceStatusUpdate(pieceId: 'P3', status: PieceStatus.edgeBanding),
      PieceStatusUpdate(pieceId: 'P4', status: PieceStatus.drilling),
      PieceStatusUpdate(pieceId: 'P5', status: PieceStatus.pending),
      PieceStatusUpdate(pieceId: 'P6', status: PieceStatus.rejected),
    ]);
    debugPrint(controller.status.statusById('P1').toString());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fitToScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Sheet Viewer V1')),
      body: SheetViewer(
        controller: controller,
        theme: const SheetViewerThemeData(
          showLabels: true,
          showGrain: true,
          pieceCornerRadius: 0,
          showPieceShadow: false,
        ),
        callbacks: SheetViewerCallbacks(
          onPieceTap: (event) {
            debugPrint('Tapped: ${event.piece.label}');
          },
          onBackgroundTap: () {
            debugPrint('Background tapped');
          },
        ),
      ),
    );
  }
}

final _layout = SheetLayout(
  materials: [
    SheetMaterial(id: 'mdf', name: '18mm MDF', color: const Color(0xFFE6C79C)),
    SheetMaterial(id: 'white', name: 'White Laminate', color: Colors.white),
  ],
  sheets: [
    Sheet(
      id: 'sheet-1',
      name: '2440 x 1220',
      width: 2440,
      height: 1220,
      pieces: [
        Piece(
          id: 'P1',
          label: 'Side Panel',
          materialId: 'mdf',
          grainDirection: GrainDirection.vertical,
          bounds: const PieceBounds(x: 20, y: 20, width: 720, height: 560),
          type: PieceType.normal,
        ),
        Piece(
          id: 'P2',
          label: 'Bottom',
          materialId: 'mdf',
          grainDirection: GrainDirection.horizontal,
          bounds: const PieceBounds(x: 760, y: 20, width: 500, height: 300),
          type: PieceType.normal,
        ),
        Piece(
          id: 'P3',
          label: 'Shelf',
          materialId: 'white',
          grainDirection: GrainDirection.horizontal,
          bounds: const PieceBounds(x: 760, y: 340, width: 500, height: 240),
          type: PieceType.normal,
        ),
        Piece(
          id: 'P4',
          label: 'Door',
          materialId: 'white',
          grainDirection: GrainDirection.vertical,
          bounds: const PieceBounds(x: 20, y: 600, width: 600, height: 580),
          type: PieceType.normal,
        ),
        Piece(
          id: 'P5',
          label: 'Drawer Front',
          materialId: 'mdf',
          grainDirection: GrainDirection.horizontal,
          bounds: const PieceBounds(x: 640, y: 600, width: 620, height: 250),
          type: PieceType.normal,
        ),
        Piece(
          id: 'P6',
          label: 'Kick Plate',
          materialId: 'mdf',
          grainDirection: GrainDirection.horizontal,
          bounds: const PieceBounds(x: 640, y: 870, width: 620, height: 120),
          type: PieceType.unused,
        ),
      ],
    ),
  ],
);
