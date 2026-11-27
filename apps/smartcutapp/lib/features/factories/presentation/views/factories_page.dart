import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/factories/data/models/factory_model.dart';
import 'package:board_cut/features/factories/presentation/viewmodels/factories_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactoriesPage extends BaseStatefulScreen {
  const FactoriesPage({super.key});

  @override
  BaseState<FactoriesPage> createState() => _FactoriesPageState();
}

class _FactoriesPageState extends BaseState<FactoriesPage> {
  final _viewModel = sl<FactoriesViewModel>();
  bool _isSmallScreen = false;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _statusFilter = 'All Status';

  @override
  void initState() {
    super.initState();
    _viewModel.fetchFactories();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    _isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<FactoriesViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: switch (screenType) {
                    ScreenType.mobile => _buildDesktopLayout(vm),
                    ScreenType.tablet => _buildDesktopLayout(vm),
                    ScreenType.desktop => _buildDesktopLayout(vm),
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDesktopLayout(FactoriesViewModel vm) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 10,
      children: [
        RecordListToolbar(
          title: 'Factories',
          subtitle: 'Manage your production facilities.',
          description:
              'Review factory locations, contacts, and account status.',
          action: ButtonWidget.primary(
            label: 'Add Factory',
            icon: Icons.add,
            iconPosition: IconPosition.left,
            onPressed: _addFactory,
          ),
          searchController: _searchController,
          searchHint: 'Search by factory, code or contact...',
          onSearchChanged: (value) =>
              setState(() => _searchQuery = value.trim().toLowerCase()),
          statusOptions: const ['All Status', 'Active', 'Inactive'],
          selectedStatus: _statusFilter,
          onStatusChanged: (value) => setState(() => _statusFilter = value),
          onClear: _clearFilters,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.maxFinite,
          child: _factories(vm, isSmallScreen: _isSmallScreen),
        ),
      ],
    ),
  );

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _statusFilter = 'All Status';
    });
  }

  bool _matchesFactory(FactoryModel factory) {
    final matchesText =
        _searchQuery.isEmpty ||
        [
          factory.name,
          factory.code,
          factory.city ?? '',
          factory.state ?? '',
          factory.phone ?? '',
          factory.email ?? '',
        ].any((value) => value.toLowerCase().contains(_searchQuery));
    final status = factory.isActive ? 'Active' : 'Inactive';
    return matchesText &&
        (_statusFilter == 'All Status' || status == _statusFilter);
  }

  Widget _factories(FactoriesViewModel vm, {bool isSmallScreen = false}) =>
      DataTableWidget(
        rowsPerPage: _isSmallScreen ? 5 : 8,
        showEmptyRows: false,
        sortAscending: true,
        columns: [
          const DataColumn(label: TableHeader(label: 'NAME')),
          const DataColumn(label: TableHeader(label: 'CODE')),
          if (!_isSmallScreen)
            const DataColumn(label: TableHeader(label: 'LOCATION')),
          const DataColumn(label: TableHeader(label: 'PHONE')),
          if (!_isSmallScreen)
            const DataColumn(label: TableHeader(label: 'EMAIL')),
          const DataColumn(label: TableHeader(label: 'STATUS')),
          const DataColumn(label: TableHeader(label: 'ACTION')),
        ],
        dataSource: FilteredDataTableSource<FactoryModel>(
          source: FactoryDataSource(
            factories: vm.factories,
            isSmallScreen: _isSmallScreen,
            context: context,
            onView: _showDetails,
            onEdit: _editFactory,
          ),
          records: vm.factories,
          predicate: _matchesFactory,
        ),
      );

  Future<void> _addFactory() async {
    final saved = await const FactoryFormPageRoute(null).push<bool>(context);
    if (saved == true) await _viewModel.fetchFactories();
  }

  Future<void> _editFactory(FactoryModel factory) async {
    final saved = await FactoryFormPageRoute(factory).push<bool>(context);
    if (saved == true) await _viewModel.fetchFactories();
  }

  void _showDetails(FactoryModel factory) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(factory.name),
        content: SizedBox(
          width: 460,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detail('Factory Code', factory.code),
              _detail('Address', factory.address),
              _detail('City', factory.city),
              _detail('State', factory.state),
              _detail('Phone', factory.phone),
              _detail('Email', factory.email),
              _detail('Kerf', factory.kerf?.toString()),
              _detail('Status', factory.isActive ? 'Active' : 'Inactive'),
              _detail('Warehouses', '${factory.warehouseCount}'),
              _detail('Orders', '${factory.orderCount}'),
              _detail('Created At', factory.createdAt.toDdMMMyyyy()),
              _detail('Updated At', factory.updatedAt.toDdMMMyyyy()),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _detail(String label, String? value) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: ItemSectionWidget(
      label: label,
      value: value?.trim().isNotEmpty == true ? value! : '—',
    ),
  );
}

class FactoryDataSource extends DataTableSource {
  FactoryDataSource({
    required this.factories,
    required this.isSmallScreen,
    required this.context,
    required this.onView,
    required this.onEdit,
  });

  final List<FactoryModel> factories;
  final bool isSmallScreen;
  final BuildContext context;
  final ValueChanged<FactoryModel> onView;
  final ValueChanged<FactoryModel> onEdit;

  @override
  DataRow? getRow(int index) {
    if (index >= factories.length) return null;
    final factory = factories[index];
    final location = [
      factory.city,
      factory.state,
    ].where((part) => part != null && part.trim().isNotEmpty).join(', ');
    final status = factory.isActive ? 'Active' : 'Inactive';
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: factory.name)),
        DataCell(TableValue(label: factory.code)),
        if (!isSmallScreen)
          DataCell(TableValue(label: location.isEmpty ? '—' : location)),
        DataCell(TableValue(label: factory.phone ?? '—')),
        if (!isSmallScreen) DataCell(TableValue(label: factory.email ?? '—')),
        DataCell(
          TableStatusValue(label: status, color: AppColors.statusColor(status)),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                tooltip: 'View factory',
                icon: Icon(
                  Icons.open_in_new_outlined,
                  color: AppColors.textSecondary,
                ),
                onPressed: () => onView(factory),
              ),
              IconButton(
                tooltip: 'Edit factory',
                icon: Icon(Icons.edit, color: AppColors.textSecondary),
                onPressed: () => onEdit(factory),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => factories.length;

  @override
  int get selectedRowCount => 0;
}
