import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/item_detail/data/model/model.dart';
import 'package:board_cut/features/item_detail/presentation/viewmodels/item_detail_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetailPage extends BaseStatefulScreen {
  const ItemDetailPage({
    super.key,
    required this.itemId,
    required this.orderId,
    required this.orderCode,
    required this.projectName,
    required this.clientName,
  });

  final String itemId;
  final String orderId;
  final String orderCode;
  final String projectName;
  final String clientName;

  @override
  BaseState<ItemDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends BaseState<ItemDetailPage> {
  int? _sortColumnIndex;
  final bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    _vm = sl<ItemDetailViewModel>();
    _vm.itemId = widget.itemId;
  }

  late ItemDetailViewModel _vm;

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider(
      create: (_) => _vm
        ..fetchItem()
        ..fetchPartsByItemId(),

      child: Consumer<ItemDetailViewModel>(
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

  Widget _buildDesktopLayout(ItemDetailViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          const SizedBox(height: 5),
          SubHeader(
            title: _vm.item?.name ?? '',
            subtitle:
                '${widget.clientName} — ${widget.projectName} — ${widget.orderCode}',
            desc: '',
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(flex: 1, child: _itemDetailCard()),
                Expanded(flex: 1, child: _cutDetailCard()),
                Expanded(flex: 1, child: _noteCard()),
              ],
            ),
          ),
          partsInfo(),
          Divider(color: AppColors.dividerColor, height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Parts',
                style: AppTextStyle.labelLarge
                    .responsive(context)
                    .bold
                    .copyWith(color: AppColors.textPrimary),
              ),
              _buildActions(),
            ],
          ),
          SizedBox(width: double.maxFinite, child: _parts),
        ],
      ),
    );
  }

  Widget _cutDetailCard() {
    final progress = _vm.item?.progress;
    final itemProgress =
        (double.tryParse(progress?.progressPercent.toString() ?? '0') ?? 0.0)
            .clamp(0.0, 100.0);
    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header("Cut Details"),
            const SizedBox(height: 10),
            ItemSectionWidget(
              label: 'Total Pieces',
              value: '${progress?.totalPieces ?? '0'}',
            ),
            ItemSectionWidget(
              label: 'Completed Pieces',
              value: '${progress?.completedPieces ?? '0'}',
            ),
            ItemSectionWidget(
              label: 'Pending Pieces',
              value: '${progress?.pendingPieces ?? '0'}',
            ),
            ItemSectionWidget(
              label: 'Progress',
              value: '${progress?.progressPercent.toString() ?? '0'}%',
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              child: LinearProgressIndicator(
                value: itemProgress / 100,
                minHeight: 5,
                backgroundColor: AppColors.dividerColor,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemDetailCard() {
    final progress = _vm.item?.progress;

    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header("Item Details"),
            const SizedBox(height: 10),

            ItemSectionWidget(label: 'Name', value: _vm.item?.name ?? ''),
            ItemSectionWidget(
              label: 'Quantity',
              value: _vm.item?.quantity.toString() ?? '',
            ),
            ItemSectionWidget(
              label: 'Allocation Strategy',
              value: _vm.item?.allocationStrategy ?? '',
            ),
            ItemSectionWidget(
              label: 'Dimension',
              value:
                  '${_vm.item?.overallWidth ?? '—'} x ${_vm.item?.overallHeight ?? '—'} x ${_vm.item?.overallDepth ?? '—'}',
            ),
            ItemSectionWidget(
              label: 'Created At',
              value: _vm.item?.createdAt.toDdMMMyyyy() ?? '',
            ),
            ItemSectionWidget(
              label: 'Updated At',
              value: _vm.item?.updatedAt?.toDdMMMyyyy() ?? '',
            ),
            ItemSectionWidget(
              label: 'Status',
              value: progress?.status.label ?? '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _noteCard() {
    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            _header("Remarks"),
            const SizedBox(height: 10),

            Text(
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              '',
              style: AppTextStyle.labelSmall
                  .responsive(context)
                  .bold
                  .copyWith(color: AppColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }

  Widget partsInfo() {
    final progress = _vm.item?.progress;
    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: progress?.stages?.isNotEmpty ?? false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 6,
                children: progress!.stages!
                    .map(
                      (stage) => ItemSectionWidget(
                        label: stage.name,
                        value: '${stage.completed}/${stage.total}',
                        orientation: ItemOrientation.vertical,
                      ),
                    )
                    .toList(),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Future<void> uploadExcel() async {
    final PlatformFile? file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (file == null) return;

    // Read file bytes using the file_picker 13.x API
    final bytes = await file.readAsBytes();

    final formData = FormData.fromMap({
      'orderItemId': _vm.itemId,
      'file': MultipartFile.fromBytes(bytes, filename: file.name),
    });

    await _vm.uploadParts(data: formData);
  }

  Widget _buildActions() {
    return Row(
      spacing: 10,
      children: [
        ButtonWidget.primary(
          onPressed: () {
            uploadExcel();
          },
          label: "Upload Parts",
          icon: Icons.upload,
          iconPosition: IconPosition.left,
        ),
        ButtonWidget.primary(
          onPressed: () async {
            await CreatePartPageRoute(
              _vm.itemId,
              widget.orderId,
              '',
            ).push(context);
            await _vm.fetchPartsByItemId();
          },
          label: "Create Part",
          icon: Icons.add,
          iconPosition: IconPosition.left,
        ),
      ],
    );
  }

  Widget _header(String label) {
    return Text(
      label,
      style: AppTextStyle.labelLarge
          .responsive(context)
          .bold
          .copyWith(color: AppColors.textPrimary),
    );
  }

  Widget get _parts {
    return DataTableWidget(
      sortColumnIndex: _sortColumnIndex,
      rowsPerPage: 3,
      sortAscending: _sortAscending,
      columns: <DataColumn>[
        DataColumn(label: TableHeader(label: "PART NAME")),
        DataColumn(
          label: TableHeader(label: "MATERIAL"),
          // onSort: (columnIndex, ascending) =>
          //     _sort<String>((data) => data['customer'], columnIndex, ascending),
        ),
        DataColumn(label: TableHeader(label: "QUANTITY")),
        DataColumn(label: TableHeader(label: "DIMENSION")),
        // DataColumn(label: TableHeader(label: "EDGE BANDING")),
        // DataColumn(label: TableHeader(label: "MULTI BORING")),
        DataColumn(label: TableHeader(label: "GRAIN DIRECTION")),
        DataColumn(label: TableHeader(label: "ACTION")),
      ],
      dataSource: PartsDataSource(
        vm: _vm,
        onEdit: _onEdit,
        onView: _onView,
        context: context,
      ),
    );
  }

  void _onView(PartModel part) {
    PartDetailPageRoute(part.id, _vm.itemId, widget.orderId, {}).push(context);
  }

  Future<void> _onEdit(PartModel part) async {
    await CreatePartPageRoute(
      _vm.itemId,
      widget.orderId,
      part.id,
    ).push(context);
    await _vm.fetchPartsByItemId();
  }
}

class PartsDataSource extends DataTableSource {
  final ItemDetailViewModel vm;
  final Function(PartModel part)? onView;
  final Function(PartModel part)? onEdit;
  final BuildContext context;

  PartsDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.parts.length) return null;

    final part = vm.parts[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: part.name)),
        DataCell(TableValue(label: part.material.name)),
        DataCell(TableValue(label: part.quantity.toString())),
        DataCell(TableValue(label: "${part.width}x${part.height}")),
        // DataCell(
        //   TableStatusValue(
        //     label: 'Completed',
        //     color: AppColors.statusColor('Completed'),
        //   ),
        // ),
        // DataCell(
        //   TableStatusValue(
        //     label: 'In Progress',
        //     color: AppColors.statusColor('In Progress'),
        //   ),
        // ),
        DataCell(TableValue(label: part.grainDirection.label)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.open_in_new_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onView == null ? null : () => onView!(part),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(part),
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
  int get rowCount => vm.parts.length;

  @override
  int get selectedRowCount => 0;
}
