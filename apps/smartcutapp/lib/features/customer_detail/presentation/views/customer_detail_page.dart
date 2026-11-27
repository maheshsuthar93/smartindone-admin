import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/customer_detail/presentation/viewmodels/customer_detail_view_model.dart';
import 'package:board_cut/features/projects/data/models/project_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomerDetailPage extends BaseStatefulScreen {
  const CustomerDetailPage({super.key, required this.customerId});

  final String customerId;

  @override
  BaseState<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends BaseState<CustomerDetailPage> {
  final _viewModel = sl<CustomerDetailViewModel>();

  CustomerModel? get _customer => _viewModel.customer;
  List<ProjectModel> get _projects => _viewModel.projects;
  String? get _customerError => _viewModel.customerError;
  String? get _projectsError => _viewModel.projectsError;
  bool get _isLoading => _viewModel.isLoading;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _viewModel.load(widget.customerId);
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _customerError != null
            ? _errorView()
            : _customer == null
            ? const EmptyWidget(text: 'Customer not found')
            : _details(_customer!, isSmallScreen),
      ),
    );
  }

  Widget _details(CustomerModel customer, bool isSmallScreen) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: _infoCard(
                        width: isSmallScreen ? double.infinity : 480,
                        title: 'Customer Information',
                        details: [
                          _detail('Customer ID', customer.id),
                          _detail('Name', customer.name),
                          _detail('Phone', customer.phone),
                          _detail('Email', customer.email),
                          _detail('Address', customer.address),
                          _detail('Status', _statusLabel(customer.status)),
                          _detail('Company ID', customer.companyId),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _infoCard(
                        width: isSmallScreen ? double.infinity : 480,
                        title: 'Contact Person',
                        details: [
                          _detail('Name', customer.contactName),
                          _detail('Phone', customer.contactPhone),
                          _detail('Email', customer.contactEmail),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _infoCard(
                        width: isSmallScreen ? double.infinity : 480,
                        title: 'Activity',
                        details: [
                          _detail('Projects', '${customer.projectCount}'),
                          _detail('Orders', '${customer.orderCount}'),
                          _detail('Created', _formatDate(customer.createdAt)),
                          _detail(
                            'Last updated',
                            _formatDate(customer.updatedAt),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Projects (${_projects.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // ButtonWidget.primary(
                  //   label: 'Create Project',
                  //   icon: Icons.add,
                  //   iconPosition: IconPosition.left,
                  //   onPressed: () => _createProject(customer.id),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              if (_projectsError != null)
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _projectsError!,
                        style: const TextStyle(color: AppColors.errorColor),
                      ),
                    ),
                    TextButton(
                      onPressed: _loadData,
                      child: const Text('Retry'),
                    ),
                  ],
                )
              else if (_projects.isEmpty)
                const EmptyWidget(text: 'No projects found for this customer')
              else
                SizedBox(
                  width: double.infinity,
                  child: DataTableWidget(
                    rowsPerPage: 5,
                    sortAscending: true,
                    showEmptyRows: false,
                    columns: [
                      const DataColumn(label: TableHeader(label: 'NAME')),
                      if (!isSmallScreen)
                        const DataColumn(
                          label: TableHeader(label: 'CONTACT PERSON'),
                        ),
                      if (!isSmallScreen)
                        const DataColumn(label: TableHeader(label: 'PHONE')),
                      if (!isSmallScreen)
                        const DataColumn(
                          label: TableHeader(label: 'START DATE'),
                        ),
                      const DataColumn(label: TableHeader(label: 'END DATE')),
                      const DataColumn(label: TableHeader(label: 'STATUS')),
                      // const DataColumn(label: TableHeader(label: 'ACTION')),
                    ],
                    dataSource: CustomerProjectsDataSource(
                      projects: _projects,
                      isSmallScreen: isSmallScreen,
                      onView: (project) => ProjectDetailPageRoute(
                        projectId: project.id,
                      ).push(context),
                      onEdit: _editProject,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _infoCard({
    required double width,
    required String title,
    required List<Widget> details,
  }) => SizedBox(
    width: width,
    child: Card(
      color: AppColors.surfaceColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.labelLarge
                  .responsive(context)
                  .bold
                  .copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 12),
            ...details,
          ],
        ),
      ),
    ),
  );

  Widget _detail(String label, String? value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: ItemSectionWidget(
      label: label,
      value: value?.trim().isNotEmpty == true ? value! : '—',
      maxLines: 2,
    ),
  );

  Widget _errorView() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _customerError!,
          style: const TextStyle(color: AppColors.errorColor),
        ),
        const SizedBox(height: 12),
        ButtonWidget.secondary(label: 'Retry', onPressed: _loadData),
      ],
    ),
  );

  String _statusLabel(CustomerStatus status) => switch (status) {
    CustomerStatus.active => 'Active',
    CustomerStatus.inActive => 'Inactive',
  };

  String _formatDate(DateTime? date) => date == null ? '—' : date.toDdMMMyyyy();

  // Future<void> _createProject(String customerId) async {
  //   final saved = await CreateProjectPageRoute(
  //     customerId: customerId,
  //   ).push<bool>(context);
  //   if (saved == true) await _loadData();
  // }

  Future<void> _editProject(ProjectModel project) async {
    final uri = Uri(
      path: '/projects/add-project',
      queryParameters: {'projectId': project.id},
    );
    final saved = await router.push<bool>(uri.toString());
    if (saved == true) await _loadData();
  }
}

class CustomerProjectsDataSource extends DataTableSource {
  CustomerProjectsDataSource({
    required this.projects,
    required this.isSmallScreen,
    required this.onView,
    required this.onEdit,
  });

  final List<ProjectModel> projects;
  final bool isSmallScreen;
  final ValueChanged<ProjectModel> onView;
  final ValueChanged<ProjectModel> onEdit;

  @override
  DataRow? getRow(int index) {
    if (index >= projects.length) return null;
    final project = projects[index];
    final status = project.status.label;
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: project.name)),
        if (!isSmallScreen)
          DataCell(TableValue(label: project.contactName ?? '—')),
        if (!isSmallScreen)
          DataCell(TableValue(label: project.contactPhone ?? '—')),
        if (!isSmallScreen)
          DataCell(TableValue(label: project.startDate?.toDdMMMyyyy() ?? '—')),
        DataCell(
          TableValue(label: project.expectedEndDate?.toDdMMMyyyy() ?? '—'),
        ),
        DataCell(
          TableStatusValue(label: status, color: AppColors.statusColor(status)),
        ),
        // DataCell(
        //   Row(
        //     children: [
        //       // IconButton(
        //       //   tooltip: 'View project',
        //       //   icon: Icon(
        //       //     Icons.open_in_new_outlined,
        //       //     color: AppColors.textSecondary,
        //       //   ),
        //       //   onPressed: () => onView(project),
        //       // ),
        //       // IconButton(
        //       //   tooltip: 'Edit project',
        //       //   icon: Icon(Icons.edit, color: AppColors.textSecondary),
        //       //   onPressed: () => onEdit(project),
        //       // ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => projects.length;

  @override
  int get selectedRowCount => 0;
}
