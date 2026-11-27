import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/order_detail/data/model/order_item_model.dart';
import 'package:board_cut/features/order_detail/presentation/viewmodels/order_detail_view_model.dart';
import 'package:board_cut/features/order_detail/presentation/widgets/order_status_widget.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class OrderDetailPage extends BaseStatefulScreen {
  const OrderDetailPage({super.key, required this.orderId});

  final String orderId;

  @override
  BaseState<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends BaseState<OrderDetailPage> {
  int? _sortColumnIndex;
  final bool _sortAscending = true;
  late OrderDetailViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = sl<OrderDetailViewModel>();
    _vm.orderId = widget.orderId;
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider(
      create: (_) => _vm
        ..fetchOrder()
        ..fetchItemsByOrderId(),

      child: Consumer<OrderDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: switch (screenType) {
              ScreenType.mobile => _buildDesktopLayout(vm),
              ScreenType.tablet => _buildDesktopLayout(vm),
              ScreenType.desktop => _buildDesktopLayout(vm),
            },
          );
        },
      ),
    );
  }

  Widget _buildDesktopLayout(OrderDetailViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                SubHeader(
                  title: vm.order?.orderCode ?? '',
                  subtitle: vm.order?.project.name ?? '',
                  desc: vm.order?.description ?? '',
                ),
                OrderProgressTracker(
                  currentStatus: vm.order?.status ?? OrderStatus.cancelled,
                ),
                // if (_isSmallScreen) ...{
                //   Column(
                //     children: [_customerCard(), _orderCard(), _noteCard()],
                //   ),
                // } else
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 1, child: _customerCard()),
                      Expanded(flex: 1, child: _orderCard()),
                      Expanded(flex: 1, child: _noteCard()),
                    ],
                  ),
                ),
                Divider(color: AppColors.dividerColor, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Order Items',
                      style: AppTextStyle.labelLarge
                          .responsive(context)
                          .bold
                          .copyWith(color: AppColors.textPrimary),
                    ),
                    _buildActions(),
                  ],
                ),
                SizedBox(width: double.maxFinite, child: _items),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderCard() {
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
            _header("Order Information"),
            const SizedBox(height: 10),

            ItemSectionWidget(
              label: 'No of Items',
              value: _vm.order?.counts.totalItems.toString() ?? '0',
            ),
            ItemSectionWidget(
              label: 'No of Pieces',
              value: _vm.order?.counts.totalPieces.toString() ?? '0',
            ),
            ItemSectionWidget(
              label: 'Created Date',
              value: _vm.order?.createdAt.toDdMMMyyyy() ?? '',
            ),
            ItemSectionWidget(
              label: 'Delivery Date',
              value: _vm.order?.deliveryDate.toDdMMMyyyy() ?? '',
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
              _vm.order?.description ?? '',
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

  Widget _customerCard() {
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
            _header("Customer Information"),
            const SizedBox(height: 10),
            ItemSectionWidget(
              label: 'Customer',
              value: _vm.order?.customer.name ?? '',
            ),

            ItemSectionWidget(
              label: 'Project',
              value: _vm.order?.project.name ?? '',
            ),
            ItemSectionWidget(
              label: 'Contact person',
              value: _vm.order?.customer.contactName ?? '',
            ),
            ItemSectionWidget(
              label: 'Contact phone',
              value: _vm.order?.customer.contactPhone ?? '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      spacing: 10,
      children: [
        // ButtonWidget.primary(
        //   onPressed: () {
        //     _vm.generatePieceForOrderId();
        //   },
        //   label: "Generate Pieces",
        //   icon: Icons.add,
        //   iconPosition: IconPosition.left,
        // ),
        ButtonWidget.primary(
          onPressed: () {
            OptimizationsPageRoute(_vm.orderId).push(context);
          },
          label: "View Layout",
          icon: Icons.remove_red_eye,
          iconPosition: IconPosition.left,
        ),
        ButtonWidget.primary(
          onPressed: _createItem,
          label: "Create Item",
          icon: Icons.add,
          iconPosition: IconPosition.left,
        ),
        ButtonWidget.primary(
          onPressed: () {
            uploadExcel();
            //UploadItemsPageRoute(_vm.orderId).push(context);
          },
          label: "Upload Items",
          icon: Icons.upload,
          iconPosition: IconPosition.left,
        ),
      ],
    );
  }

  Future<void> _createItem() async {
    await context.push<bool>(
      CreateItemPageRoute(_vm.orderId).location,
      extra: _refreshItems,
    );
  }

  Future<void> _refreshItems() => _vm.fetchItemsByOrderId();

  Future<void> uploadExcel() async {
    final PlatformFile? file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (file == null) return;

    // Read file bytes using the file_picker 13.x API
    final bytes = await file.readAsBytes();

    final formData = FormData.fromMap({
      'orderId': _vm.orderId,
      'file': MultipartFile.fromBytes(bytes, filename: file.name),
    });

    _vm.uploadItems(data: formData);
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

  Widget get _items => DataTableWidget(
    sortColumnIndex: _sortColumnIndex,
    rowsPerPage: 4,
    sortAscending: _sortAscending,
    columns: <DataColumn>[
      DataColumn(label: TableHeader(label: "ITEM")),
      DataColumn(label: TableHeader(label: "QUANTITY")),
      DataColumn(label: TableHeader(label: "DIMENSION")),
      DataColumn(label: TableHeader(label: "STATUS")),
      DataColumn(label: TableHeader(label: "ACTION")),
    ],
    dataSource: ItemsDataSource(
      vm: _vm,
      onEdit: _onEdit,
      onView: _onView,
      context: context,
    ),
  );

  void _onView(OrderItemModel item) {
    ItemDetailPageRoute(item.id, item.orderId, {
      'orderCode': _vm.order?.orderCode ?? '',
      'clientName': _vm.order?.customer.name ?? '',
      'projectName': _vm.order?.project.name ?? '',
    }).push(context);
  }

  Future<void> _onEdit(OrderItemModel item) async {
    await context.push<bool>(
      '${CreateItemPageRoute(item.orderId).location}?itemId=${Uri.encodeComponent(item.id)}',
      extra: _refreshItems,
    );
  }
}

class ItemsDataSource extends DataTableSource {
  final OrderDetailViewModel vm;
  final Function(OrderItemModel item)? onView;
  final Function(OrderItemModel item)? onEdit;
  final BuildContext context;

  ItemsDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.orderItems.length) return null;

    final item = vm.orderItems[index];

    String dimen(OrderItemModel item) {
      return '${item.overallWidth ?? '—'} x ${item.overallHeight ?? '—'} x ${item.overallDepth ?? '—'} mm';
    }

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: item.name)),
        DataCell(TableValue(label: item.quantity.toString())),
        DataCell(TableValue(label: dimen(item))),
        DataCell(TableStatusValue(label: item.production.status.label)),

        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.open_in_new_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onView == null ? null : () => onView!(item),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(item),
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
  int get rowCount => vm.orderItems.length;

  @override
  int get selectedRowCount => 0;
}
