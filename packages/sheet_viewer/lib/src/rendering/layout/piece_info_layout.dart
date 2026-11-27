import '../../../sheet_viewer.dart';
import 'package:characters/characters.dart';

final class PieceInfoLayout {
  const PieceInfoLayout({required this.lines});

  final List<String> lines;

  bool get isEmpty => lines.isEmpty;

  String get text => lines.join('\n');

  factory PieceInfoLayout.build({
    required Piece piece,
    required double width,
    required double height,
  }) {
    final shortest = width < height ? width : height;

    // Too small
    if (shortest < 20) {
      return const PieceInfoLayout(lines: []);
    }

    // Very small
    if (shortest < 40) {
      return PieceInfoLayout(lines: [piece.label.characters.first]);
    }

    // Small
    if (shortest < 80) {
      return PieceInfoLayout(lines: [piece.label]);
    }

    // Normal
    if (shortest < 160) {
      return PieceInfoLayout(lines: [piece.label, piece.sizeLabel]);
    }

    // Large
    return PieceInfoLayout(
      lines: [piece.label, piece.sizeLabel, 'Qty ${piece.quantity}'],
    );
  }
}
