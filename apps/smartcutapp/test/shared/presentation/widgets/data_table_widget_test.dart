import 'package:board_cut/shared/presentation/widgets/data_table/data_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the shared empty state when the data source has no rows', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DataTableWidget(
            dataSource: _EmptyDataSource(),
            sortAscending: true,
            columns: const [DataColumn(label: Text('Name'))],
          ),
        ),
      ),
    );

    expect(find.text('No records found'), findsOneWidget);
    expect(
      find.text('There are no records to display here yet.'),
      findsOneWidget,
    );
    expect(find.byType(PaginatedDataTable), findsNothing);
  });
}

class _EmptyDataSource extends DataTableSource {
  @override
  DataRow? getRow(int index) => null;

  @override
  int get rowCount => 0;

  @override
  int get selectedRowCount => 0;

  @override
  bool get isRowCountApproximate => false;
}
