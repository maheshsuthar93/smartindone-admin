import 'dart:async';

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../viewmodels/users_view_model.dart';

class UsersPage extends BaseStatefulScreen {
  const UsersPage({super.key});

  @override
  BaseState<UsersPage> createState() => _UsersPagePageState();
}

class _UsersPagePageState extends BaseState<UsersPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _statusFilter = 'All Status';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  var _isSmallScreen = false;

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    _isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;

    return ChangeNotifierProvider(
      create: (_) => sl<UsersViewModel>()..fetchUsers(),
      child: Consumer<UsersViewModel>(
        builder: (context, vm, child) {
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

  Widget _buildDesktopLayout(UsersViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecordListToolbar(
              title: 'Users',
              subtitle: 'Manage users and access across your workspace.',
              description: 'Find users by name, email, role, company, or account status.',
              action: ButtonWidget.primary(
                onPressed: () => unawaited(_createUser(vm)),
                label: 'Create User',
                icon: Icons.add,
                iconPosition: IconPosition.left,
              ),
              searchController: _searchController,
              searchHint: 'Search by name, email, role or company...',
              onSearchChanged: (value) =>
                  setState(() => _searchQuery = value.trim().toLowerCase()),
              statusOptions: const [
                'All Status',
                'Active',
                'Inactive',
                'Suspended',
              ],
              selectedStatus: _statusFilter,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onClear: _clearFilters,
            ),
            const SizedBox(height: 16),
            _boxSections(),
            const SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: _users(vm, isSmallScreen: _isSmallScreen),
            ),
          ],
        ),
      ),
    );
  }

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _statusFilter = 'All Status';
    });
  }

  bool _matchesUser(UserModel user) {
    final matchesText =
        _searchQuery.isEmpty ||
        [
          user.name,
          user.email,
          user.role.name,
          user.company?.name ?? '',
        ].any((value) => value.toLowerCase().contains(_searchQuery));
    final status = switch (user.status) {
      UserStatus.active => 'Active',
      UserStatus.inActive => 'Inactive',
      UserStatus.suspended => 'Suspended',
    };
    return matchesText &&
        (_statusFilter == 'All Status' || _statusFilter == status);
  }

  Widget _boxSections() {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BoxSection(
            label: "Total Users",
            value: "1,200".toString(),
            label2: '05 New, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "Active Users",
            value: "2,100",
            label2: '2 shipped, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "In Active Users",
            value: "10",
            label2: '10 order, this month',
          ),
        ),
      ],
    );
  }

  Widget _users(UsersViewModel vm, {bool isSmallScreen = false}) =>
      DataTableWidget(
        sortColumnIndex: vm.sortBy == "name" ? 0 : null,
        sortAscending: vm.isAscending,
        rowsPerPage: vm.rowsPerPage(isSmallScreen),
        columns: <DataColumn>[
          DataColumn(
            label: TableHeader(label: "NAME"),
            onSort: (columnIndex, ascending) {
              vm.sort((u) => u.name, "name");
            },
          ),
          DataColumn(label: TableHeader(label: "ROLE")),
          DataColumn(label: TableHeader(label: "COMPANY")),
          DataColumn(label: TableHeader(label: "STATUS")),
          DataColumn(label: TableHeader(label: "ACTIONS")),
        ],
        dataSource: FilteredDataTableSource<UserModel>(
          source: UsersDataSource(
            viewModel: vm,
            onEdit: _onEdit,
            onView: _onView,
          ),
          records: vm.users,
          predicate: _matchesUser,
        ),
        onPageChanged: (int page) =>
            vm.fetchUsers(page: (page ~/ vm.rowsPerPage(isSmallScreen)) + 1),
      );

  void _onView(UserModel user) {
    //const CustomerDetailPageRoute('1').push(context);
  }

  void _onEdit(UserModel user) {
    unawaited(_editUser(user));
  }

  Future<void> _editUser(UserModel user) async {
    final didUpdate = await context.push<bool>(
      CreateUserPageRoute().location,
      extra: user,
    );
    if (didUpdate != true || !mounted) return;
    final viewModel = context.read<UsersViewModel>();
    await viewModel.fetchUsers(page: viewModel.currentPage);
  }

  Future<void> _createUser(UsersViewModel viewModel) async {
    final didCreate = await context.push<bool>(CreateUserPageRoute().location);
    if (didCreate != true || !mounted) return;
    await viewModel.fetchUsers(page: viewModel.currentPage);
  }
}

class UsersDataSource extends DataTableSource {
  final UsersViewModel viewModel;
  final Function(UserModel user)? onView;
  final Function(UserModel user)? onEdit;
  final bool isSmallScreen;

  UsersDataSource({
    required this.viewModel,
    this.onEdit,
    this.onView,
    this.isSmallScreen = false,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= viewModel.users.length) return null;

    final user = viewModel.users[index];

    return DataRow.byIndex(
      index: index,
      //color: WidgetStateProperty.all(AppColors.gray1),
      cells: [
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColors.primaryColor.withValues(alpha: .10),
                child: Text(
                  user.name.trim().isEmpty
                      ? '?'
                      : user.name.trim()[0].toUpperCase(),
                  style: AppTextStyle.labelSmall.bold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodySmall.medium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.labelSmall.regular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        DataCell(TableValue(label: user.role.name.toUpperCase())),
        DataCell(TableValue(label: user.company?.name ?? '—')),
        DataCell(
          TableStatusValue(
            label: switch (user.status) {
              UserStatus.active => 'Active',
              UserStatus.inActive => 'Inactive',
              UserStatus.suspended => 'Suspended',
            },
            color: AppColors.statusColor(switch (user.status) {
              UserStatus.active => 'active',
              UserStatus.inActive => 'inactive',
              UserStatus.suspended => 'suspended',
            }),
          ),
        ),
        DataCell(
          Row(
            children: [
              // IconButton(
              //   icon: Icon(Icons.open_in_new_outlined, size: 20),
              //   onPressed: onView == null ? null : () => onView!(data),
              // ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(user),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void updateData(List<Map<String, dynamic>> newOrders) {
    // customers.clear();
    //customers.addAll(newOrders);
    notifyListeners(); // 🔥 refresh table
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => viewModel.users.length;

  @override
  int get selectedRowCount => 0;
}
