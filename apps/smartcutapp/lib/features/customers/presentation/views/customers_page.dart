import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/customers/presentation/viewmodels/customers_view_model.dart';
import 'package:flutter/material.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomersPage extends BaseStatefulScreen {
  const CustomersPage({super.key});

  @override
  BaseState<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends BaseState<CustomersPage> {
  var _isSmallScreen = false;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _statusFilter = 'All Status';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider(
      create: (_) => sl<CustomersViewModel>()
        ..fetchCustomers()
        ..fetchCustomerAnalytics(),

      child: Consumer<CustomersViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          _isSmallScreen =
              screenType == ScreenType.mobile ||
              screenType == ScreenType.tablet;

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

  Widget _buildDesktopLayout(CustomersViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecordListToolbar(
              title: 'Customers',
              subtitle: 'Manage customers across your workspace.',
              description: 'Review contact details, projects, orders, and customer status.',
              action: ButtonWidget.primary(
                onPressed: () => _openCreate(vm),
                label: 'Create Customer',
                icon: Icons.add,
                iconPosition: IconPosition.left,
              ),
              searchController: _searchController,
              searchHint: 'Search by customer, contact, email or phone...',
              onSearchChanged: (value) =>
                  setState(() => _searchQuery = value.trim().toLowerCase()),
              statusOptions: const ['All Status', 'Active', 'Inactive'],
              selectedStatus: _statusFilter,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onClear: _clearFilters,
            ),
            const SizedBox(height: 16),
            _boxSections(vm),
            const SizedBox(height: 16),
            SizedBox(width: double.maxFinite, child: _customers(vm, context)),
          ],
        ),
      ),
    );
  }

  Widget _boxSections(CustomersViewModel vm) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BoxSection(
            label: "Total Customers",
            value: "${vm.totalCustomers}".toString(),
            label2: '05 New, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "Active Customers",
            value: "${vm.totalActiveCustomers}".toString(),
            label2: '2 shipped, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "In Active Customers",
            value: "${vm.totalInActiveCustomers}".toString(),
            label2: '10 order, this month',
          ),
        ),
      ],
    );
  }

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _statusFilter = 'All Status';
    });
  }

  bool _matchesCustomer(CustomerModel customer) {
    final matchesText =
        _searchQuery.isEmpty ||
        [
          customer.name,
          customer.contactName ?? '',
          customer.email ?? '',
          customer.phone ?? '',
          customer.contactEmail ?? '',
          customer.contactPhone ?? '',
        ].any((value) => value.toLowerCase().contains(_searchQuery));
    final isActive = customer.status == CustomerStatus.active;
    final matchesStatus =
        _statusFilter == 'All Status' ||
        (_statusFilter == 'Active' && isActive) ||
        (_statusFilter == 'Inactive' && !isActive);
    return matchesText && matchesStatus;
  }

  Future<void> _openCreate(CustomersViewModel vm) async {
    final saved = await const CreateCustomerPageRoute().push<bool>(context);
    if (saved == true) await vm.refresh();
  }

  Widget _customers(CustomersViewModel vm, BuildContext context) =>
      DataTableWidget(
        sortColumnIndex: vm.sortBy == "name"
            ? 0
            : vm.sortBy == "email"
            ? 1
            : null,
        sortAscending: vm.isAscending,
        rowsPerPage: vm.rowsPerPage(_isSmallScreen),
        columns: <DataColumn>[
          //DataColumn(label: _tableHeader("Customer ID")),
          DataColumn(
            label: TableHeader(label: "CUSTOMER"),
            onSort: (columnIndex, ascending) {
              vm.sort((u) => u.name, "name");
            },
          ),
          DataColumn(label: TableHeader(label: "CONTACT PERSON")),
          DataColumn(label: TableHeader(label: "PHONE")),
          DataColumn(label: TableHeader(label: "STATUS")),
          DataColumn(label: TableHeader(label: "PROJECTS")),
          //DataColumn(label: _tableHeader("Created At")),
          DataColumn(label: TableHeader(label: "ACTIONS")),
        ],
        dataSource: FilteredDataTableSource<CustomerModel>(
          source: CustomersDataSource(
            vm: vm,
            context: context,
            onView: _onView,
            onEdit: (customer) => _onEdit(customer, vm),
          ),
          records: vm.customers,
          predicate: _matchesCustomer,
        ),
      );

  void _onView(CustomerModel customer) {
    CustomerDetailPageRoute(customer.id).push(context);
  }

  void _onEdit(CustomerModel customer, CustomersViewModel vm) {
    _openEdit(customer, vm);
  }

  Future<void> _openEdit(CustomerModel customer, CustomersViewModel vm) async {
    final location = Uri(
      path: '/customers/create-customer',
      queryParameters: {'customerId': customer.id},
    ).toString();
    final saved = await context.push<bool>(location);
    if (saved == true && mounted) await vm.refresh();
  }
}

class CustomersDataSource extends DataTableSource {
  final CustomersViewModel vm;

  final Function(CustomerModel customer)? onView;
  final Function(CustomerModel customer)? onEdit;
  final BuildContext context;

  CustomersDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.customers.length) return null;

    final customer = vm.customers[index];

    return DataRow.byIndex(
      index: index,
      //color: WidgetStateProperty.all(AppColors.gray1),
      cells: [
        //DataCell(Text(data['customerId'])),
        DataCell(TableValue(label: customer.name)),
        DataCell(TableValue(label: customer.contactName ?? '')),
        DataCell(TableValue(label: customer.contactPhone ?? '')),
        DataCell(
          TableStatusValue(
            label: customer.status == CustomerStatus.active
                ? 'Active'
                : 'Inactive',
            color: AppColors.statusColor(
              customer.status == CustomerStatus.active ? 'Active' : 'Inactive',
            ),
          ),
        ),
        DataCell(TableValue(label: customer.projectCount.toString())),
        //DataCell(Text(data['createdAt'])),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.open_in_new_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onView == null ? null : () => onView!(customer),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(customer),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void updateData(List<Map<String, dynamic>> newOrders) {
    //customers.clear();
    //customers.addAll(newOrders);
    notifyListeners(); // 🔥 refresh table
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.customers.length;

  @override
  int get selectedRowCount => 0;
}
