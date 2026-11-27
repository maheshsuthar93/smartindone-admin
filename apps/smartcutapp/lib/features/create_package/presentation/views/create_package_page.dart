import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_package/presentation/viewmodels/package_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/models/available_package_piece_model.dart';
import '../../../warehouses/data/models/warehouse_model.dart';

import '../widgets/hardware_section.dart';
import '../widgets/package_content_tabs.dart';
import '../widgets/package_summary_card.dart';

class CreatePackagePage extends BaseStatefulScreen {
  const CreatePackagePage({
    super.key,
    required this.shipmentId,
    required this.orderId,
    this.packageId,
  });

  final String shipmentId;
  final String orderId;
  final String? packageId;

  @override
  BaseState<CreatePackagePage> createState() => _CreatePackagePageState();
}

class _CreatePackagePageState extends BaseState<CreatePackagePage> {
  late final PackageViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contentSearchController = TextEditingController();
  String _status = 'PACKING';
  bool _isInitialized = false;
  WarehouseModel? _selectedWarehouse;
  String _contentSearchQuery = '';

  late final PackagePieceDataSource _pieceDataSource;

  int? _sortColumnIndex;
  bool _sortAscending = true;
  PackageTab _selectedTab = PackageTab.pieces;

  @override
  void initState() {
    super.initState();
    _viewModel = sl<PackageViewModel>();
    _viewModel.orderId = widget.orderId;
    _viewModel.fetchWarehouses();
    _pieceDataSource = PackagePieceDataSource(pieces: []);
    _viewModel.fetchAvailablePieces(widget.orderId).then((_) {
      if (mounted) _pieceDataSource.updatePieces(_viewModel.pieces);
    });
    if (widget.packageId != null) _viewModel.fetchPackage(widget.packageId!);
  }

  final _deliveryDateController = TextEditingController();

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<PackageViewModel>(
        builder: (context, viewModel, child) {
          if (!viewModel.isLoading &&
              !_isInitialized &&
              viewModel.package != null) {
            _nameController.text = viewModel.package!.name;
            _status = viewModel.package!.status;
            _isInitialized = true;
          }
          if (viewModel.error != null) {
            final message = viewModel.error!;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
              viewModel.clearError();
            });
          }
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildPage(context, screenType);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, ScreenType screenType) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Scrollbar(
        child: SingleChildScrollView(
          primary: true,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: switch (screenType) {
                ScreenType.mobile => _buildContent(),
                ScreenType.tablet => _buildContent(),
                ScreenType.desktop => _buildContent(),
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: _statusField),
              if (_selectedTab == PackageTab.hardware)
                Expanded(child: _warehouseField),
              Expanded(child: _contentSearchField),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Package Contents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Expanded(
                flex: 2,
                child: PackageContentTabs(
                  selectedTab: _selectedTab,
                  piecesCount: _viewModel.pieces.length,
                  hardwareCount: _viewModel.hardware.length,
                  onTabChanged: (tab) {
                    setState(() {
                      _selectedTab = tab;
                    });
                  },
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: _contentSearchField,
              // ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _selectedTab == PackageTab.pieces
                ? (_viewModel.isPiecesLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _viewModel.pieces.isEmpty
                      ? const EmptyStateWidget(
                          title: 'No items available',
                          description: 'Items from this order that can be added to the package will appear here.',
                          icon: Icons.widgets_outlined,
                        )
                      : _piecesSection)
                : HardwareSection(
                    hardware: _viewModel.hardware,
                    isLoading: _viewModel.isHardwareLoading,
                    hasWarehouse: _selectedWarehouse != null,
                    searchQuery: _contentSearchQuery,
                  ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: ButtonWidget.secondary(
                    label: 'Cancel',
                    onPressed: () {
                      router.pop();
                    },
                  ),
                ),
                SizedBox(width: 200, child: _buildCreateButton),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildCreateButton => ButtonWidget(
    label: widget.packageId == null ? 'Create Package' : 'Update Package',
    onPressed: _viewModel.isSaving ? null : _savePackage,
  );

  Future<void> _savePackage() async {
    if (!_formKey.currentState!.validate()) return;
    final isSaved = await _viewModel.save(
      packageId: widget.packageId,
      data: {
        'name': _nameController.text.trim(),
        'status': _status,
        'shipmentId': widget.shipmentId,
      },
    );
    if (!mounted) return;
    if (isSaved) {
      router.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_viewModel.error ?? 'Could not save package')),
      );
    }
  }

  Widget get _statusField => _buildAutoCompleteField(
    labelText: 'Status',
    options: const ['PACKING', 'PACKED', 'LOADED'],
    initialValue: _status,
    hintText: 'Select status',
    displayStringForOption: (status) => status,
    onSelected: (value) {
      setState(() => _status = value);
    },
    onChanged: (value) {
      if (value != _status) setState(() => _status = '');
    },
    filterFn: (value, query) {
      return value.toLowerCase().contains(query);
    },
    isRequired: true,
    validator: (_) => _status.isEmpty ? 'Select a status' : null,
    prefixIcon: const Icon(
      Icons.search,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _contentSearchField => _buildTextFormField(
    hintText: 'Search pieces or hardware...',
    keyboardType: TextInputType.text,
    hasLabel: false,
    controller: _contentSearchController,
    prefixIcon: const Icon(Icons.search, size: 20),
    onChanged: (value) {
      final query = value.trim().toLowerCase();
      _pieceDataSource.setSearchQuery(query);
      setState(() => _contentSearchQuery = query);
    },
  );

  Widget get _warehouseField => _buildAutoCompleteField<WarehouseModel>(
    labelText: 'Warehouse',
    hintText: _viewModel.isWarehousesLoading
        ? 'Loading warehouses...'
        : 'Select a warehouse to load hardware',
    options: _viewModel.warehouses,
    initialValue: _selectedWarehouse?.name,
    isRequired: true,
    displayStringForOption: (warehouse) => warehouse.name,
    onSelected: _onWarehouseSelected,
    filterFn: (warehouse, query) {
      final normalizedQuery = query.toLowerCase();
      return warehouse.name.toLowerCase().contains(normalizedQuery) ||
          (warehouse.location ?? '').toLowerCase().contains(normalizedQuery);
    },
    prefixIcon: const Icon(Icons.warehouse_outlined),
  );

  void _onWarehouseSelected(WarehouseModel warehouse) {
    if (!mounted) return;
    setState(() => _selectedWarehouse = warehouse);
    _viewModel.fetchAvailableHardware(warehouse.id);
  }

  Widget _buildAutoCompleteField<T extends Object>({
    String? labelText,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    bool readOnly = false,
    GestureTapCallback? onTap,
    required List<T> options,
    TextEditingController? controller,
    required String Function(T) displayStringForOption,
    required void Function(T) onSelected,
    bool Function(T option, String query)? filterFn,
    String? initialValue,
    bool isRequired = false,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
  }) {
    return AutoCompleteWidget(
      labelText: labelText,
      hintText: hintText,
      options: options,
      displayStringForOption: displayStringForOption,
      onSelected: onSelected,
      initialValue: initialValue,
      isRequired: isRequired,
      prefixIcon: prefixIcon,
      validator: validator,
      onChanged: onChanged,
    );
  }

  Widget _buildTextFormField({
    String? labelText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    String? hintText,
    Widget? prefixIcon,
    bool isRequired = false,
    bool hasLabel = true,
    TextEditingController? controller,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
  }) {
    return TextFormFieldWidget(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      isRequired: isRequired,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      hasLabel: hasLabel,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _deliveryDateController.dispose();
    _nameController.dispose();
    _contentSearchController.dispose();
    _viewModel.dispose();
  }

  Widget get _piecesTable => SizedBox(
    width: double.maxFinite,
    child: DataTableWidget(
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      rowsPerPage: _pieceDataSource.visiblePieces.length.clamp(1, 5).toInt(),
      availableRowsPerPage: const [1, 2, 3, 4, 5],
      showEmptyRows: false,
      showCheckboxColumn: true,
      columns: <DataColumn>[
        DataColumn(label: TableHeader(label: "PIECE")),
        DataColumn(
          label: TableHeader(label: "ITEM"),
          onSort: (columnIndex, ascending) =>
              _sort<String>((data) => data.pieceCode, columnIndex, ascending),
        ),
        //DataColumn(label: TableHeader(label: "QUANTITY")),
        DataColumn(label: TableHeader(label: "DIMENSION")),
        // DataColumn(label: _tableHeader("EDGE BANDING")),
        //DataColumn(label: _tableHeader("MULTI BORING")),
        //DataColumn(label: _tableHeader("GRAIN")),
      ],
      dataSource: _pieceDataSource,
    ),
  );

  Widget get _piecesSection => SizedBox(
    width: double.maxFinite,
    child: ListenableBuilder(
      listenable: _pieceDataSource,
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
                        icon: Icons.checklist_outlined,
                        label: 'Selected Piece',
                        value: _pieceDataSource.selectedPieceCount,
                        accent: const Color(0xFF1684C7),
                      ),
                    ),
                    SizedBox(
                      width: cardWidth,
                      child: PackageSummaryCard(
                        icon: Icons.view_in_ar_outlined,
                        label: 'Total Piece',
                        value: _pieceDataSource.totalPieceCount,
                        accent: const Color(0xFF20A36A),
                      ),
                    ),
                    SizedBox(
                      width: cardWidth,
                      child: PackageSummaryCard(
                        icon: Icons.inventory_2_outlined,
                        label: 'Available pieces',
                        value: _pieceDataSource.availablePieceCount,
                        accent: const Color(0xFF7155D9),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          _pieceDataSource.visiblePieces.isEmpty
              ? EmptyStateWidget(
                  title: _contentSearchQuery.isEmpty
                      ? 'No items available'
                      : 'No items match your search',
                  description: _contentSearchQuery.isEmpty
                      ? 'Items from this order that can be added to the package will appear here.'
                      : 'Try a different search term or clear your search.',
                  icon: _contentSearchQuery.isEmpty
                      ? Icons.widgets_outlined
                      : Icons.search_off_outlined,
                )
              : _piecesTable,
        ],
      ),
    ),
  );

  void _sort<T>(
    Comparable<T> Function(AvailablePackagePieceModel data) getField,
    int columnIndex,
    bool ascending,
  ) {
    _pieceDataSource.sort<T>(getField, ascending);

    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }
}

class PackagePieceDataSource extends DataTableSource {
  List<AvailablePackagePieceModel> visiblePieces;
  List<AvailablePackagePieceModel> _allPieces;
  final Set<String> selectedPieceIds = {};
  String _searchQuery = '';

  PackagePieceDataSource({required List<AvailablePackagePieceModel> pieces})
    : visiblePieces = List.of(pieces),
      _allPieces = List.of(pieces);

  @override
  DataRow? getRow(int index) {
    if (index >= visiblePieces.length) return null;

    final piece = visiblePieces[index];
    final isSelected = selectedPieceIds.contains(piece.id);

    return DataRow.byIndex(
      index: index,
      selected: isSelected,
      onSelectChanged: (isSelected) {
        if (isSelected == true) {
          selectedPieceIds.add(piece.id);
        } else {
          selectedPieceIds.remove(piece.id);
        }
        notifyListeners(); // refresh table
      },
      cells: [
        DataCell(TableValue(label: piece.pieceCode)),
        DataCell(TableValue(label: piece.itemLabel)),
        // DataCell(
        //   QuantitySelector(
        //     value: int.tryParse(data['quantity']) ?? 0,
        //     min: 1,
        //     max: 100,
        //     onChanged: (newValue) {
        //       data['quantity'] = newValue.toString();
        //       notifyListeners(); // refresh table
        //     },
        //   ),
        // ),

        //DataCell(Text(data['quantity'])),
        DataCell(TableValue(label: piece.dimension)),
        // DataCell(Text('Completed')),
        // DataCell(Text('Completed')),
        // DataCell(Text(data['grain'])),
      ],
    );
  }

  void updatePieces(List<AvailablePackagePieceModel> pieces) {
    _allPieces = List.of(pieces);
    _applySearch();
    final pieceIds = _allPieces.map((piece) => piece.id).toSet();
    selectedPieceIds.removeWhere((id) => !pieceIds.contains(id));
    notifyListeners();
  }

  void setSearchQuery(String query) {
    if (_searchQuery == query) return;
    _searchQuery = query;
    _applySearch();
    notifyListeners();
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      visiblePieces = List.of(_allPieces);
      return;
    }
    visiblePieces = _allPieces.where((piece) {
      final fields = [
        piece.pieceCode,
        piece.itemLabel,
        piece.itemName,
        piece.dimension,
        piece.partNumber?.toString() ?? '',
        piece.barcode ?? '',
        piece.qrCode ?? '',
      ];
      return fields.any((field) => field.toLowerCase().contains(_searchQuery));
    }).toList();
  }

  void sort<T>(
    Comparable<T> Function(AvailablePackagePieceModel data) getField,
    bool ascending,
  ) {
    visiblePieces.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => visiblePieces.length;

  @override
  int get selectedRowCount => selectedPieceCount;

  int get selectedPieceCount => selectedPieceIds.length;

  int get totalPieceCount => _allPieces.length;

  int get availablePieceCount => totalPieceCount - selectedPieceCount;
}
