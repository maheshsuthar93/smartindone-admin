import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/optimizations/data/model/material_group_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/optimizations_view_model.dart';

class OptimizationsPage extends BaseStatefulScreen {
  const OptimizationsPage({super.key, required this.orderId});

  final String orderId;

  @override
  BaseState<OptimizationsPage> createState() => _OptimizationsPageState();
}

class _OptimizationsPageState extends BaseState<OptimizationsPage> {
  // final List<Map<String, dynamic>> packages = [
  //   {
  //     "id": "MG-001",
  //     "optimizationId": "OPT-001",
  //     "material": {"id": "MAT-001", "name": "MDF White", "code": "MDF-WH"},
  //     "thickness": 18,
  //     "sheetSize": {"width": 2440, "height": 1220},
  //     "status": "completed",
  //     "totalPieces": 66,
  //     "totalSheets": 3,
  //     "efficiency": 92.4,
  //     "wastePercentage": 7.6,
  //     "usedArea": 8.25,
  //     "wasteArea": 0.68,
  //     "sheets": [
  //       {"id": "S-001", "sheetNumber": 1, "pieceCount": 22, "efficiency": 93.6},
  //       {"id": "S-002", "sheetNumber": 2, "pieceCount": 21, "efficiency": 91.8},
  //       {"id": "S-003", "sheetNumber": 3, "pieceCount": 23, "efficiency": 91.8},
  //     ],
  //     "createdAt": "2026-08-11T09:30:00Z",
  //   },
  //   {
  //     "id": "MG-002",
  //     "optimizationId": "OPT-001",
  //     "material": {"id": "MAT-001", "name": "MDF White", "code": "MDF-WH"},
  //     "thickness": 16,
  //     "sheetSize": {"width": 2440, "height": 1220},
  //     "status": "completed",
  //     "totalPieces": 38,
  //     "totalSheets": 2,
  //     "efficiency": 89.7,
  //     "wastePercentage": 10.3,
  //     "usedArea": 5.34,
  //     "wasteArea": 0.61,
  //     "sheets": [
  //       {"id": "S-004", "sheetNumber": 1, "pieceCount": 20, "efficiency": 90.5},
  //       {"id": "S-005", "sheetNumber": 2, "pieceCount": 18, "efficiency": 88.9},
  //     ],
  //     "createdAt": "2026-08-11T09:30:00Z",
  //   },
  //   {
  //     "id": "MG-003",
  //     "optimizationId": "OPT-001",
  //     "material": {"id": "MAT-002", "name": "MDF Grey", "code": "MDF-GR"},
  //     "thickness": 18,
  //     "sheetSize": {"width": 2440, "height": 1220},
  //     "status": "completed",
  //     "totalPieces": 24,
  //     "totalSheets": 1,
  //     "efficiency": 94.2,
  //     "wastePercentage": 5.8,
  //     "usedArea": 2.80,
  //     "wasteArea": 0.17,
  //     "sheets": [
  //       {"id": "S-006", "sheetNumber": 1, "pieceCount": 24, "efficiency": 94.2},
  //     ],
  //     "createdAt": "2026-08-11T09:30:00Z",
  //   },
  //   {
  //     "id": "MG-004",
  //     "optimizationId": "OPT-001",
  //     "material": {"id": "MAT-003", "name": "Plywood", "code": "PLY-BIRCH"},
  //     "thickness": 12,
  //     "sheetSize": {"width": 2440, "height": 1220},
  //     "status": "needs_optimization",
  //     "totalPieces": 18,
  //     "totalSheets": 0,
  //     "efficiency": null,
  //     "wastePercentage": null,
  //     "usedArea": null,
  //     "wasteArea": null,
  //     "sheets": [],
  //     "createdAt": "2026-08-11T10:15:00Z",
  //   },
  // ];

  bool _isSmallScreen = false;
  late OptimizationsViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = sl<OptimizationsViewModel>();
    _vm.orderId = widget.orderId;
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    _isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;

    return ChangeNotifierProvider(
      create: (_) => _vm..fetchOptimizationsByOrderId(),
      child: Consumer<OptimizationsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              primary: true,
              child: switch (screenType) {
                ScreenType.mobile => _buildDesktopLayout(vm),
                ScreenType.tablet => _buildDesktopLayout(vm),
                ScreenType.desktop => _buildDesktopLayout(vm),
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildDesktopLayout(OptimizationsViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Optimizations',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _buildActions,
                ],
              ),
              _optimizations(vm),
              Divider(color: Colors.grey.withAlpha(100)),
              _selectedLayout(vm),
              SizedBox(width: double.maxFinite, child: _materialGroups(vm)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _optimizations(OptimizationsViewModel vm) {
    if (vm.optimizations.isEmpty) {
      return Container(
        height: 72,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        child: Text(
          'No optimizations yet. Run an order optimization to create one.',
          style: AppTextStyle.bodySmall.regular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return SizedBox(
      height: 112,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vm.optimizations.length,
        itemBuilder: (context, index) {
          final optimization = vm.optimizations[index];
          final isSelected = optimization.id == vm.selectedOptimizationId;
          final statusColor = AppColors.statusColor(optimization.status.label);
          return SizedBox(
            height: 112,
            width: 280,
            child: Card(
              color: AppColors.surfaceColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
                side: BorderSide(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.dividerColor,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => vm.selectOptimizationById(optimization.id),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '#${optimization.optimizationNo}',
                            style: AppTextStyle.labelLarge
                                .responsive(context)
                                .semiBold
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          _optimizationStatus(
                            optimization.status.label,
                            statusColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            size: 15,
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.textMuted,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            isSelected ? 'Selected' : 'View material groups',
                            style: AppTextStyle.labelSmall
                                .responsive(context)
                                .regular
                                .copyWith(color: AppColors.textSecondary),
                          ),
                          const Spacer(),
                          if (optimization.kerf != null)
                            Text(
                              'Kerf ${optimization.kerf} mm',
                              style: AppTextStyle.labelSmall
                                  .responsive(context)
                                  .regular
                                  .copyWith(color: AppColors.textSecondary),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _optimizationStatus(String status, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      height: 20,
      decoration: BoxDecoration(
        color: color.withAlpha(50),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Row(
        children: [
          Text(
            status,
            style: AppTextStyle.labelSmall
                .responsive(context)
                .regular
                .copyWith(color: color),
          ),
        ],
      ),
    );
  }

  Widget _selectedLayout(OptimizationsViewModel vm) {
    final optimization = vm.selectedOptimization;
    final pieceCount = vm.materialGroups.fold<int>(
      0,
      (total, group) => total + (group.pieceCount ?? 0),
    );

    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected optimization',
                    style: AppTextStyle.labelSmall
                        .responsive(context)
                        .regular
                        .copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    optimization == null
                        ? 'No optimization selected'
                        : '#${optimization.optimizationNo}',
                    style: AppTextStyle.titleSmall
                        .responsive(context)
                        .semiBold
                        .copyWith(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
            if (optimization != null) ...[
              _optimizationStatus(
                optimization.status.label,
                AppColors.statusColor(optimization.status.label),
              ),
              const SizedBox(width: 20),
            ],
            IconLabel(
              label: 'Material groups',
              value: '${vm.materialGroups.length}',
              icon: Icons.layers_outlined,
              hasIcon: !_isSmallScreen,
            ),
            const SizedBox(width: 18),
            IconLabel(
              label: 'Pieces',
              value: '$pieceCount',
              icon: Icons.inventory_2_outlined,
              hasIcon: !_isSmallScreen,
            ),
            if (optimization?.kerf != null) ...[
              const SizedBox(width: 18),
              IconLabel(
                label: 'Kerf',
                value: '${optimization!.kerf} mm',
                icon: Icons.straighten_outlined,
                hasIcon: !_isSmallScreen,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget get _buildActions => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        tooltip: 'How optimization works',
        onPressed: _showAlgorithmExplanation,
        icon: const Icon(Icons.help_outline),
      ),
      ButtonWidget(
        label: _isSmallScreen ? 'Generate' : 'Generate for New Pieces',
        icon: Icons.add,
        iconPosition: IconPosition.left,
        onPressed: () {
          _vm.createOptimization();
        },
      ),
    ],
  );

  void _showAlgorithmExplanation() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('How cutting optimization works'),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The optimizer creates a practical row-based cutting layout '
                  'for each material group. It uses the piece sizes, available '
                  'sheets and configured kerf (the width removed by each cut).',
                  style: AppTextStyle.bodySmall.regular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 18),
                _algorithmStep(
                  1,
                  'Prepare pieces',
                  'Pieces are grouped by material and thickness, then checked '
                      'against the available sheet sizes.',
                ),
                _algorithmStep(
                  2,
                  'Try different orders',
                  'The layout is generated using up to five deterministic '
                      'piece orders, such as largest area, longest side, '
                      'shortest side, width and height first.',
                ),
                _algorithmStep(
                  3,
                  'Choose the best valid layout',
                  'Candidates are compared by sheet count first, then full '
                      'sheet count, total sheet area and reusable offcut area.',
                ),
                _algorithmStep(
                  4,
                  'Review and cut',
                  'The selected layout and its material usage are saved for '
                      'review. This is a heuristic, so another cutting '
                      'strategy may find a more efficient layout.',
                ),
              ],
            ),
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

  Widget _algorithmStep(int number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.primaryColor.withValues(alpha: .1),
            child: Text(
              '$number',
              style: AppTextStyle.labelSmall.semiBold.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.bodySmall.semiBold.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: AppTextStyle.bodySmall.regular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _materialGroups(OptimizationsViewModel vm) {
    final optimization = vm.selectedOptimization;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 4),
          child: Text(
            optimization == null
                ? 'Material groups'
                : 'Material groups for #${optimization.optimizationNo}',
            style: AppTextStyle.titleXSmall
                .responsive(context)
                .semiBold
                .copyWith(color: AppColors.textPrimary),
          ),
        ),
        if (vm.isLoadingMaterialGroups)
          const Padding(
            padding: EdgeInsets.all(28),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (optimization == null)
          const EmptyStateWidget(
            title: 'Select an optimization',
            description: 'Choose an optimization to view its material groups.',
            icon: Icons.tune_outlined,
          )
        else if (vm.materialGroups.isEmpty)
          const EmptyStateWidget(
            title: 'No material groups yet',
            description:
                'Material groups for this optimization will appear here.',
            icon: Icons.category_outlined,
          )
        else
          DataTableWidget(
            sortAscending: true,
            rowsPerPage: 5,
            columns: <DataColumn>[
              DataColumn(label: TableHeader(label: 'MATERIAL GROUP')),
              DataColumn(label: TableHeader(label: 'PIECES')),
              DataColumn(label: TableHeader(label: 'STATUS')),
              DataColumn(label: TableHeader(label: 'ACTIONS')),
            ],
            dataSource: MaterialGroupsDataSource(
              vm: vm,
              onRefresh: _onRefresh,
              onView: _onView,
              context: context,
            ),
          ),
      ],
    );
  }

  void _onView(MaterialGroupModel data) {
    LayoutViewPageRoute(data.id, "1", {'layoutId': ''}).push(context);
  }

  void _onRefresh(MaterialGroupModel data) {
    debugPrint("Refreshing material group: ${data.id}");
    _vm.runOptimizationMaterialGroupById(data.id);
  }

  // void _sort<T>(
  //   Comparable<T> Function(Map<String, dynamic> data) getField,
  //   int columnIndex,
  //   bool ascending,
  // ) {
  //   _dataSource.sort<T>(getField, ascending);
  //
  //   setState(() {
  //     _sortColumnIndex = columnIndex;
  //     _sortAscending = ascending;
  //   });
  // }
}

class MaterialGroupsDataSource extends DataTableSource {
  final OptimizationsViewModel vm;
  final Function(MaterialGroupModel data)? onView;
  final Function(MaterialGroupModel data)? onRefresh;

  final BuildContext context;

  MaterialGroupsDataSource({
    required this.vm,
    required this.onRefresh,
    this.onView,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index < 0 || index >= vm.materialGroups.length) return null;
    final materialGroup = vm.materialGroups[index];
    final material = materialGroup.material;
    final canRunOptimization =
        (materialGroup.status == MaterialGroupStatus.ready ||
            materialGroup.status == MaterialGroupStatus.failed) &&
        onRefresh != null;
    final refreshTooltip = switch (materialGroup.status) {
      MaterialGroupStatus.completed =>
        'Completed. Use Generate for New Pieces to create another run.',
      MaterialGroupStatus.optimizing => 'Optimization is already running.',
      _ => 'Generate layout',
    };
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Row(
            spacing: 2,
            children: [
              TableValue(label: material.name),
              Text(
                '(${material.thickness.toString()}mm)',
                style: AppTextStyle.labelSmall
                    .responsive(context)
                    .semiBold
                    .copyWith(color: AppColors.textPrimary, fontSize: 11),
              ),
            ],
          ),
        ),
        DataCell(
          TableValue(label: materialGroup.pieceCount?.toString() ?? '0'),
        ),
        //DataCell(TableValue(label: '0')),
        DataCell(
          TableStatusValue(
            label: materialGroup.status.label,
            color: AppColors.statusColor(materialGroup.status.label),
          ),
        ),
        DataCell(
          Row(
            children: [
              // if (materialGroup.status == MaterialGroupStatus.completed)
              IconButton(
                icon: Icon(Icons.open_in_new_outlined, size: 20),
                onPressed: onView == null ? null : () => onView!(materialGroup),
              ),
              // else
              IconButton(
                tooltip: refreshTooltip,
                icon: Icon(
                  Icons.refresh,
                  size: 20,
                  color: canRunOptimization
                      ? AppColors.warningColor
                      : AppColors.textMuted,
                ),
                onPressed: canRunOptimization
                    ? () => onRefresh!(materialGroup)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // void updateData(List<Map<String, dynamic>> newOrders) {
  //   packages.clear();
  //   packages.addAll(newOrders);
  //   notifyListeners(); // 🔥 refresh table
  // }

  // void sort<T>(
  //   Comparable<T> Function(Map<String, dynamic> data) getField,
  //   bool ascending,
  // ) {
  //   packages.sort((a, b) {
  //     final aValue = getField(a);
  //     final bValue = getField(b);
  //     return ascending
  //         ? Comparable.compare(aValue, bValue)
  //         : Comparable.compare(bValue, aValue);
  //   });
  //
  //   notifyListeners();
  // }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.materialGroups.length;

  @override
  int get selectedRowCount => 0;
}

// class MyApp extends StatelessWidget {
//   final List<ListItem> items;
//
//   const MyApp({super.key, required this.items});
//
//   @override
//   Widget build(BuildContext context) {
//     const title = 'Mixed List';
//
//     return ListView.builder(
//       // Let the ListView know how many items it needs to build.
//       itemCount: items.length,
//       // Provide a builder function. This is where the magic happens.
//       // Convert each item into a widget based on the type of item it is.
//       itemBuilder: (context, index) {
//         final item = items[index];
//
//         return ListTile(
//           title: item.buildTitle(context),
//           subtitle: item.buildSubtitle(context),
//         );
//       },
//     );
//   }
// }
//
// /// The base class for the different types of items the list can contain.
// abstract class ListItem {
//   /// The title line to show in a list item.
//   Widget buildTitle(BuildContext context);
//
//   /// The subtitle line, if any, to show in a list item.
//   Widget buildSubtitle(BuildContext context);
// }
//
// /// A ListItem that contains data to display a heading.
// class HeadingItem implements ListItem {
//   final String heading;
//
//   HeadingItem(this.heading);
//
//   @override
//   Widget buildTitle(BuildContext context) {
//     return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
//   }
//
//   @override
//   Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
// }
//
// /// A ListItem that contains data to display a message.
// class MessageItem implements ListItem {
//   final String sender;
//   final String body;
//
//   MessageItem(this.sender, this.body);
//
//   @override
//   Widget buildTitle(BuildContext context) => Text(sender);
//
//   @override
//   Widget buildSubtitle(BuildContext context) => Text(body);
// }
