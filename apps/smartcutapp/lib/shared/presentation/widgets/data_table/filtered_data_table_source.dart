import 'package:flutter/material.dart';

class FilteredDataTableSource<T> extends DataTableSource {
  FilteredDataTableSource({
    required this.source,
    required List<T> records,
    required bool Function(T record) predicate,
  }) : _visibleIndexes = [
         for (var index = 0; index < records.length; index++)
           if (predicate(records[index])) index,
       ];

  final DataTableSource source;
  final List<int> _visibleIndexes;

  @override
  DataRow? getRow(int index) {
    if (index < 0 || index >= _visibleIndexes.length) return null;
    return source.getRow(_visibleIndexes[index]);
  }

  @override
  bool get isRowCountApproximate => source.isRowCountApproximate;

  @override
  int get rowCount => _visibleIndexes.length;

  @override
  int get selectedRowCount => source.selectedRowCount;
}
