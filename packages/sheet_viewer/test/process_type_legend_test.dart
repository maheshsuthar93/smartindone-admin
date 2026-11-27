import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sheet_viewer/src/models/process_type_legend_item.dart';
import 'package:sheet_viewer/src/widgets/status_legend.dart';

void main() {
  testWidgets('does not show fixed labels when a dynamic list is empty', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: StatusLegend(statuses: [])),
      ),
    );

    expect(find.text('Cutting'), findsNothing);
    expect(find.text('Pending'), findsNothing);
  });

  testWidgets('shows all master process types in sequence order', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StatusLegend(
            statuses: [
              ProcessTypeLegendItem(
                name: 'Drilling',
                sequenceOrder: 2,
                color: Colors.orange,
              ),
              ProcessTypeLegendItem(
                name: 'Cutting',
                sequenceOrder: 1,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Cutting'), findsOneWidget);
    expect(find.text('Drilling'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('Cutting')).dx,
      lessThan(tester.getTopLeft(find.text('Drilling')).dx),
    );
  });
}
