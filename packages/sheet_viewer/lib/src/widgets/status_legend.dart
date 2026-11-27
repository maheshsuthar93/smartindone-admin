import 'package:flutter/material.dart';

import '../models/process_type_legend_item.dart';
import '../theme/sheet_viewer_theme.dart';

class StatusLegend extends StatelessWidget {
  const StatusLegend({super.key, this.statuses});

  final Iterable<ProcessTypeLegendItem>? statuses;

  @override
  Widget build(BuildContext context) {
    final theme = SheetViewerTheme.of(context);
    final dynamicStatuses = statuses?.toList();

    if (dynamicStatuses != null) {
      final byLabel = <String, ProcessTypeLegendItem>{};
      for (final status in dynamicStatuses) {
        byLabel.putIfAbsent(status.name, () => status);
      }
      final orderedStatuses = byLabel.values.toList()
        ..sort((a, b) => a.sequenceOrder.compareTo(b.sequenceOrder));

      return Wrap(
        spacing: 14,
        children: orderedStatuses
            .map((status) => _item(status.name, status.color))
            .toList(),
      );
    }

    return Wrap(
      spacing: 14,
      children: [
        _item("Pending", theme.statusTheme.pending),
        _item("Cutting", theme.statusTheme.cutting),
        _item("Edge", theme.statusTheme.edgeBanding),
        _item("Drilling", theme.statusTheme.drilling),
        _item("Completed", theme.statusTheme.completed),
        _item("Rejected", theme.statusTheme.rejected),
      ],
    );
  }

  Widget _item(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
