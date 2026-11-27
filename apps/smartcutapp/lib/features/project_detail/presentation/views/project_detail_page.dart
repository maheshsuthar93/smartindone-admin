import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/project_detail/presentation/viewmodels/project_detail_view_model.dart';
import 'package:board_cut/features/projects/data/models/project_detail_model.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectDetailPage extends BaseStatefulScreen {
  const ProjectDetailPage({super.key, required this.projectId});

  final String projectId;

  @override
  BaseState<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends BaseState<ProjectDetailPage> {
  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    return ChangeNotifierProvider(
      create: (_) =>
          sl<ProjectDetailViewModel>()..fetchProject(widget.projectId),
      child: Consumer<ProjectDetailViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.error != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(viewModel.error!)));
              viewModel.clearError();
            });
          }

          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : viewModel.project == null
                ? const Center(child: EmptyWidget(text: 'Project not found'))
                : _buildProject(
                    context,
                    viewModel.project!,
                    viewModel.orders,
                    isSmallScreen,
                  ),
          );
        },
      ),
    );
  }

  Widget _buildProject(
    BuildContext context,
    ProjectDetailModel project,
    List<OrderModel> orders,
    bool isSmallScreen,
  ) {
    final customer = project.customer;
    String date(DateTime? value) => value == null
        ? '—'
        : '${value.day.toString().padLeft(2, '0')}-${_month(value.month)}-${value.year}';
    final address = [
      project.deliveryAddress,
      project.deliveryAddress2,
      project.deliveryCity,
      project.deliveryState,
      project.deliveryPostalCode,
      project.deliveryCountry,
    ].where((part) => part != null && part.trim().isNotEmpty).join(', ');

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: _detailCard('Project Information', [
                            _item('Project Name', project.name),
                            _item('Description', _value(project.description)),
                            _item('No. of Orders', '${project.ordersCount}'),
                            _item('Created At', date(project.createdAt)),
                            _item('Start Date', date(project.startDate)),
                            _item(
                              'Expected End Date',
                              date(project.expectedEndDate),
                            ),
                            _item(
                              'Actual End Date',
                              date(project.actualEndDate),
                            ),
                            _item('Status', project.status.label),
                          ], isSmallScreen),
                        ),
                        Expanded(
                          child: _detailCard('Customer Information', [
                            _item('Name', _value(customer?.name)),
                            _item('Phone', _value(customer?.phone)),
                            _item('Email', _value(customer?.email)),
                          ], isSmallScreen),
                        ),
                        Expanded(
                          child: _detailCard('Contact Information', [
                            _item('Name', _value(project.contactName)),
                            _item('Phone', _value(project.contactPhone)),
                            _item('Email', _value(project.contactEmail)),
                          ], isSmallScreen),
                        ),
                        Expanded(
                          child: _detailCard('Delivery Information', [
                            _item('Delivery Address', _value(address)),
                          ], isSmallScreen),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  Text(
                    'Orders (${orders.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (orders.isEmpty)
                    const EmptyWidget(text: 'No orders found for this project')
                  else
                    SizedBox(
                      width: double.maxFinite,
                      child: DataTableWidget(
                        rowsPerPage: isSmallScreen ? 5 : 8,
                        showEmptyRows: false,
                        sortAscending: true,
                        columns: [
                          const DataColumn(
                            label: TableHeader(label: 'CUSTOMER'),
                          ),
                          const DataColumn(label: TableHeader(label: 'STATUS')),
                          if (!isSmallScreen)
                            const DataColumn(
                              label: TableHeader(label: 'ORDER DATE'),
                            ),
                          const DataColumn(label: TableHeader(label: 'ACTION')),
                        ],
                        dataSource: ProjectOrdersDataSource(
                          orders: orders,
                          isSmallScreen: isSmallScreen,
                          context: context,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailCard(String title, List<Widget> items, bool isSmallScreen) {
    return SizedBox(
      width: isSmallScreen ? double.infinity : 480,
      child: Card(
        color: AppColors.surfaceColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              ...items,
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 9),
    child: ItemSectionWidget(label: label, value: value, maxLines: 3),
  );

  String _value(String? value) =>
      value == null || value.trim().isEmpty ? '—' : value;

  String _month(int month) => const [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ][month - 1];
}

class ProjectOrdersDataSource extends DataTableSource {
  ProjectOrdersDataSource({
    required this.orders,
    required this.isSmallScreen,
    required this.context,
  });

  final List<OrderModel> orders;
  final bool isSmallScreen;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    if (index >= orders.length) return null;
    final order = orders[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: order.customer.name)),
        DataCell(
          TableStatusValue(
            label: order.status.label,
            color: AppColors.statusColor(order.status.label),
          ),
        ),
        if (!isSmallScreen)
          DataCell(TableValue(label: order.createdAt.toDdMMMyyyy())),
        DataCell(
          IconButton(
            icon: Icon(
              Icons.open_in_new_outlined,
              color: AppColors.textSecondary,
            ),
            onPressed: () =>
                OrderDetailPageRoute(orderId: order.id).push(context),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
