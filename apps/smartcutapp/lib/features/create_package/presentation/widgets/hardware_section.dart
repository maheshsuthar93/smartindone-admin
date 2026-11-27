import 'package:board_cut/core/theme/app_colors.dart';
import 'package:board_cut/core/theme/app_size.dart';
import 'package:board_cut/core/theme/app_text_style.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/responsive_text_style_extension.dart';
import '../../../../core/theme/text_style_extension.dart';
import '../../data/models/available_package_hardware_model.dart';
import 'package_summary_card.dart';

class HardwareSection extends StatefulWidget {
  const HardwareSection({
    super.key,
    required this.hardware,
    required this.isLoading,
    required this.hasWarehouse,
    this.searchQuery = '',
  });

  final List<AvailablePackageHardwareModel> hardware;
  final bool isLoading;
  final bool hasWarehouse;
  final String searchQuery;

  @override
  State<HardwareSection> createState() => _HardwareSectionState();
}

class _HardwareSectionState extends State<HardwareSection> {
  late final PackageHardwareSelectionDataSource _hardwareDataSource;

  @override
  void initState() {
    super.initState();
    _hardwareDataSource = PackageHardwareSelectionDataSource(
      context: context,
      hardware: widget.hardware,
      searchQuery: widget.searchQuery,
    );
  }

  @override
  void didUpdateWidget(covariant HardwareSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.hardware, widget.hardware)) {
      _hardwareDataSource.updateHardware(widget.hardware);
    }
    if (oldWidget.searchQuery != widget.searchQuery) {
      _hardwareDataSource.setSearchQuery(widget.searchQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.hasWarehouse) {
      return const EmptyStateWidget(
        title: 'Select a warehouse',
        description: 'Choose a warehouse to view available hardware.',
        icon: Icons.warehouse_outlined,
      );
    }
    if (widget.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (widget.hardware.isEmpty ||
        _hardwareDataSource.visibleHardware.isEmpty) {
      final hasSearch = widget.searchQuery.trim().isNotEmpty;
      return EmptyStateWidget(
        title: hasSearch
            ? 'No hardware matches your search'
            : 'No hardware available',
        description: hasSearch
            ? 'Try a different search term or clear your search.'
            : 'Available hardware in this warehouse will appear here.',
        icon: hasSearch ? Icons.search_off_outlined : Icons.hardware_outlined,
      );
    }
    return SizedBox(
      width: double.maxFinite,
      child: ListenableBuilder(
        listenable: _hardwareDataSource,
        builder: (context, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = constraints.maxWidth >= 850
                    ? (constraints.maxWidth - 24) / 3
                    : constraints.maxWidth >= 560
                    ? (constraints.maxWidth - 12) / 2
                    : constraints.maxWidth;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: PackageSummaryCard(
                          icon: Icons.widgets_outlined,
                          label: 'Hardware types selected',
                          value: _hardwareDataSource.selectedHardwareTypeCount,
                          accent: const Color(0xFF1684C7),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: PackageSummaryCard(
                          icon: Icons.inventory_2_outlined,
                          label: 'Total units',
                          value: _hardwareDataSource.selectedUnitCount,
                          accent: const Color(0xFF20A36A),
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: PackageSummaryCard(
                          icon: Icons.warehouse_outlined,
                          label: 'Available in warehouse',
                          value: _hardwareDataSource.availableUnitCount,
                          accent: const Color(0xFF7155D9),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            DataTableWidget(
              rowsPerPage: _hardwareDataSource.visibleHardware.length
                  .clamp(1, 5)
                  .toInt(),
              availableRowsPerPage: const [1, 2, 3, 4, 5],
              showEmptyRows: false,
              sortAscending: true,
              showCheckboxColumn: true,
              columns: const [
                DataColumn(label: TableHeader(label: 'HARDWARE')),
                DataColumn(label: TableHeader(label: 'TYPE')),
                DataColumn(label: TableHeader(label: 'UNIT')),
                DataColumn(label: TableHeader(label: 'AVAILABLE STOCK')),
                DataColumn(label: TableHeader(label: 'QUANTITY')),
              ],
              dataSource: _hardwareDataSource,
            ),
          ],
        ),
      ),
    );
  }
}

class PackageHardwareSelectionDataSource extends DataTableSource {
  PackageHardwareSelectionDataSource({
    required this.hardware,
    this.searchQuery = '',
    required this.context,
  });

  List<AvailablePackageHardwareModel> hardware;
  String searchQuery;
  final Map<String, int> _selectedQuantitiesByHardwareId = {};
  final BuildContext context;

  List<AvailablePackageHardwareModel> get visibleHardware {
    if (searchQuery.isEmpty) return hardware;
    return hardware.where((item) {
      final fields = [
        item.name,
        item.code,
        item.type,
        item.unit,
        item.brand ?? '',
        item.finish ?? '',
        item.specification ?? '',
      ];
      return fields.any((field) => field.toLowerCase().contains(searchQuery));
    }).toList();
  }

  void setSearchQuery(String query) {
    if (searchQuery == query) return;
    searchQuery = query;
    notifyListeners();
  }

  int quantityForHardware(String hardwareId) =>
      _selectedQuantitiesByHardwareId[hardwareId] ?? 0;

  void setQuantity(AvailablePackageHardwareModel item, int quantity) {
    final clampedQuantity = quantity.clamp(0, item.availableStock).toInt();
    if (clampedQuantity == 0) {
      _selectedQuantitiesByHardwareId.remove(item.id);
    } else {
      _selectedQuantitiesByHardwareId[item.id] = clampedQuantity;
    }
    notifyListeners();
  }

  void updateHardware(List<AvailablePackageHardwareModel> value) {
    hardware = value;
    final ids = value.map((item) => item.id).toSet();
    _selectedQuantitiesByHardwareId.removeWhere((id, _) => !ids.contains(id));
    for (final item in value) {
      final quantity = _selectedQuantitiesByHardwareId[item.id];
      if (quantity != null && quantity > item.availableStock) {
        if (item.availableStock == 0) {
          _selectedQuantitiesByHardwareId.remove(item.id);
        } else {
          _selectedQuantitiesByHardwareId[item.id] = item.availableStock;
        }
      }
    }
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    final items = visibleHardware;
    if (index < 0 || index >= items.length) return null;
    final item = items[index];
    return DataRow.byIndex(
      index: index,
      color: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.primaryColor.withAlpha(18)
            : null,
      ),
      onSelectChanged: item.availableStock <= 0
          ? null
          : (selected) => setQuantity(item, selected == true ? 1 : 0),
      selected: quantityForHardware(item.id) > 0,
      cells: [
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                [item.code, item.brand, item.finish, item.specification]
                    .where((value) => value != null && value.isNotEmpty)
                    .join(' · '),
                style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        DataCell(TableValue(label: item.type.replaceAll('_', ' '))),
        DataCell(TableValue(label: item.unit)),
        DataCell(_stockBadge(item.availableStock)),
        DataCell(_quantityControl(context, item)),
      ],
    );
  }

  Widget _quantityControl(
    BuildContext context,
    AvailablePackageHardwareModel item,
  ) {
    final quantity = quantityForHardware(item.id);
    final disabled = item.availableStock <= 0;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dividerColor),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _quantityButton(
            context,
            icon: Icons.remove,
            enabled: !disabled && quantity > 0,
            onPressed: () => setQuantity(item, quantity - 1),
          ),
          SizedBox(
            width: 30,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          _quantityButton(
            context,
            icon: Icons.add,
            enabled: !disabled && quantity < item.availableStock,
            onPressed: () => setQuantity(item, quantity + 1),
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(
    BuildContext context, {
    required IconData icon,
    required bool enabled,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints.tightFor(width: 32, height: 32),
      padding: EdgeInsets.zero,
      tooltip: icon == Icons.add ? 'Increase quantity' : 'Decrease quantity',
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon, size: 16),
    );
  }

  Widget _stockBadge(int stock) {
    final isLowStock = stock > 0 && stock <= 5;
    final foreground = stock == 0
        ? AppColors.errorColor
        : isLowStock
        ? AppColors.warningColor
        : AppColors.successColor;
    //    final background = foreground.withAlpha(22);
    return Text(
      stock == 1 ? '1' : '$stock',
      style: AppTextStyle.bodySmall
          .responsive(context)
          .bold
          .copyWith(color: foreground),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => visibleHardware.length;

  @override
  int get selectedRowCount => selectedHardwareTypeCount;

  int get selectedHardwareTypeCount => _selectedQuantitiesByHardwareId.values
      .where((quantity) => quantity > 0)
      .length;

  int get selectedUnitCount => _selectedQuantitiesByHardwareId.values.fold(
    0,
    (total, quantity) => total + quantity,
  );

  int get availableUnitCount =>
      hardware.fold(0, (total, item) => total + item.availableStock);
}
