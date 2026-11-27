import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

import '../empty/empty_state_widget.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.dataSource,
    this.sortColumnIndex,
    required this.sortAscending,
    required this.columns,
    this.rowsPerPage = 10,
    this.showCheckboxColumn = false,
    this.showEmptyRows = true,
    this.availableRowsPerPage,
    this.onPageChanged,
    this.emptyState,
  });

  final int? sortColumnIndex;
  final bool sortAscending;

  final DataTableSource dataSource;
  final List<DataColumn> columns;

  final int rowsPerPage;
  final bool showCheckboxColumn;
  final bool showEmptyRows;
  final List<int>? availableRowsPerPage;
  final ValueChanged<int>? onPageChanged;
  final Widget? emptyState;

  @override
  Widget build(BuildContext context) {
    if (dataSource.rowCount == 0) {
      return emptyState ??
          const EmptyStateWidget(
            title: 'No records found',
            description: 'There are no records to display here yet.',
          );
    }

    return CardTheme(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: PaginatedDataTable(
        columnSpacing: 10,
        horizontalMargin: 20,
        // headingRowColor:
        // MaterialStateProperty.all(Colors.blue.shade100),
        showCheckboxColumn: showCheckboxColumn,
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
        showFirstLastButtons: true,
        dividerThickness: AppSize.dividerThickness,
        rowsPerPage: rowsPerPage,
        showEmptyRows: showEmptyRows,
        // availableRowsPerPage: availableRowsPerPage,
        columns: columns,
        source: dataSource,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
