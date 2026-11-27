import 'package:flutter/material.dart';

import '../controllers/sheet_viewer_controller.dart';

class SheetNavigator extends StatelessWidget {
  const SheetNavigator({
    super.key,
    required this.controller,
    this.maxVisible = 7,
  });

  final SheetViewerController controller;

  /// Maximum number of visible sheet buttons.
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        final total = controller.layout.sheets.length;

        if (total <= 1) {
          return const SizedBox.shrink();
        }

        if (total <= maxVisible) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(total, (index) => _buildChip(index)),
          );
        }

        final current = controller.currentSheetIndex;

        final start = (current - 2).clamp(0, total - maxVisible);
        final end = (start + maxVisible).clamp(0, total);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (start > 0) ...[
              _buildChip(0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('...'),
              ),
            ],
            for (int i = start; i < end; i++) _buildChip(i),
            if (end < total) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('...'),
              ),
              _buildChip(total - 1),
            ],
          ],
        );
      },
    );
  }

  Widget _buildChip(int index) {
    final selected = index == controller.currentSheetIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ChoiceChip(
        selected: selected,
        showCheckmark: false,
        label: Text('${index + 1}'),
        onSelected: (_) => controller.showSheet(index),
      ),
    );
  }
}
