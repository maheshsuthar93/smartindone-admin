import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';
import 'package:board_cut/features/warehouses/domain/usecases/get_warehouse_by_id.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class WarehouseDetailPage extends BaseStatefulScreen {
  const WarehouseDetailPage({super.key, required this.warehouseId});

  final String warehouseId;

  @override
  BaseState<WarehouseDetailPage> createState() => _WarehouseDetailPageState();
}

class _WarehouseDetailPageState extends BaseState<WarehouseDetailPage> {
  final GetWarehouseById _getWarehouseById = sl<GetWarehouseById>();
  WarehouseModel? _warehouse;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadWarehouse();
  }

  Future<void> _loadWarehouse() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    final result = await _getWarehouseById(warehouseId: widget.warehouseId);
    if (!mounted) return;
    result.match(
      (failure) => _error = failure.message,
      (warehouse) => _warehouse = warehouse,
    );
    setState(() => _isLoading = false);
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
            ? _errorView()
            : _warehouse == null
            ? _errorView(message: 'Warehouse not found.')
            : _content(_warehouse!),
      ),
    );
  }

  Widget _content(WarehouseModel warehouse) => SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _warehouseCard(warehouse),
        const SizedBox(height: 10),
        _metrics(warehouse),
      ],
    ),
  );

  Widget _warehouseCard(WarehouseModel warehouse) {
    final statusLabel = _statusLabel(warehouse.status);
    final statusColor = _statusColor(warehouse.status);
    return Card(
      color: AppColors.surfaceColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.warehouse_outlined,
                  color: AppColors.primaryColor,
                  size: 23,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    warehouse.name,
                    style: AppTextStyle.titleMedium.bold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                _statusChip(statusLabel, statusColor),
                IconButton(
                  tooltip: 'Refresh warehouse details',
                  visualDensity: VisualDensity.compact,
                  onPressed: _loadWarehouse,
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 33),
              child: Text(
                warehouse.factoryName.isEmpty
                    ? 'Factory not available'
                    : '${warehouse.factoryName}${warehouse.factoryCode == null ? '' : ' · ${warehouse.factoryCode}'}',
                style: AppTextStyle.bodySmall.regular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Divider(height: 1),
            const SizedBox(height: 14),
            LayoutBuilder(
              builder: (context, constraints) {
                final fieldWidth = constraints.maxWidth >= 650
                    ? (constraints.maxWidth - 20) / 2
                    : constraints.maxWidth;
                return Wrap(
                  spacing: 20,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: fieldWidth,
                      child: _detailItem(
                        Icons.location_on_outlined,
                        'Location',
                        _valueOrFallback(warehouse.location),
                      ),
                    ),
                    SizedBox(
                      width: fieldWidth,
                      child: _detailItem(
                        Icons.person_outline,
                        'Contact person',
                        _valueOrFallback(warehouse.contactName),
                      ),
                    ),
                    SizedBox(
                      width: fieldWidth,
                      child: _detailItem(
                        Icons.phone_outlined,
                        'Phone',
                        _valueOrFallback(warehouse.contactPhone),
                      ),
                    ),
                    SizedBox(
                      width: fieldWidth,
                      child: _detailItem(
                        Icons.email_outlined,
                        'Email',
                        _valueOrFallback(warehouse.contactEmail),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _metrics(WarehouseModel warehouse) {
    final cards = [
      _MetricData(
        label: 'Inventory lines',
        value: warehouse.inventoryBalanceCount,
        icon: Icons.inventory_2_outlined,
        color: const Color(0xFF7155D9),
        detail: 'Material and hardware balances',
      ),
      _MetricData(
        label: 'Physical sheets',
        value: warehouse.sheetCount,
        icon: Icons.view_agenda_outlined,
        color: const Color(0xFF1684C7),
        detail: 'Sheets stored at this warehouse',
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth >= 500
            ? (constraints.maxWidth - 10) / 2
            : constraints.maxWidth;
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: cards
              .map(
                (metric) =>
                    SizedBox(width: cardWidth, child: _metricCard(metric)),
              )
              .toList(),
        );
      },
    );
  }

  Widget _metricCard(_MetricData metric) => Card(
    color: AppColors.surfaceColor,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: metric.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(metric.icon, color: metric.color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${metric.value}',
                      style: AppTextStyle.titleMedium.bold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        metric.label,
                        style: AppTextStyle.bodySmall.semiBold.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  metric.detail,
                  style: AppTextStyle.bodySmall.regular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _detailItem(IconData icon, String label, String value) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 17, color: AppColors.textSecondary),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyle.bodySmall.semiBold.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              value,
              style: AppTextStyle.bodyMedium.regular.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _statusChip(String label, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );

  Widget _errorView({String? message}) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline,
            size: 42,
            color: AppColors.errorColor,
          ),
          const SizedBox(height: 12),
          Text(
            message ?? _error ?? 'Could not load warehouse details.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ButtonWidget.primary(
            label: 'Try Again',
            icon: Icons.refresh,
            onPressed: _loadWarehouse,
          ),
        ],
      ),
    ),
  );

  String _valueOrFallback(String? value) =>
      value == null || value.trim().isEmpty ? 'Not provided' : value;

  String _statusLabel(WarehouseStatus status) => switch (status) {
    WarehouseStatus.active => 'Active',
    WarehouseStatus.inActive => 'Inactive',
    WarehouseStatus.underMaintenance => 'Under Maintenance',
  };

  Color _statusColor(WarehouseStatus status) => switch (status) {
    WarehouseStatus.active => AppColors.successColor,
    WarehouseStatus.inActive => AppColors.errorColor,
    WarehouseStatus.underMaintenance => AppColors.warningColor,
  };
}

class _MetricData {
  const _MetricData({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.detail,
  });

  final String label;
  final int value;
  final IconData icon;
  final Color color;
  final String detail;
}
