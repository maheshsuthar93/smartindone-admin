import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/projects/data/models/project_model.dart';
import 'package:board_cut/features/projects/presentation/viewmodels/projects_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:provider/provider.dart';

class ProjectsPage extends BaseStatefulScreen {
  const ProjectsPage({super.key});

  @override
  BaseState<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends BaseState<ProjectsPage> {
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
      create: (_) => sl<ProjectsViewModel>()
        ..fetchProjects()
        ..fetchProjectAnalytics(),

      child: Consumer<ProjectsViewModel>(
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

  Widget _buildDesktopLayout(ProjectsViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecordListToolbar(
              title: 'Projects',
              subtitle: 'Manage projects for your customers.',
              description: 'Track project contacts, schedules, and progress.',
              action: ButtonWidget.primary(
                onPressed: () => _openProjectForm(
                  vm,
                  () => CreateProjectPageRoute().push<bool>(context),
                ),
                label: 'Create Project',
                icon: Icons.add,
                iconPosition: IconPosition.left,
              ),
              searchController: _searchController,
              searchHint: 'Search by project or contact...',
              onSearchChanged: (value) =>
                  setState(() => _searchQuery = value.trim().toLowerCase()),
              statusOptions: [
                'All Status',
                ...ProjectStatus.values.map((status) => status.label),
              ],
              selectedStatus: _statusFilter,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onClear: _clearFilters,
            ),
            const SizedBox(height: 16),
            _boxSections(vm),
            const SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: _projects(vm, isSmallScreen: _isSmallScreen),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxSections(ProjectsViewModel vm) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BoxSection(
            label: "Total Projects",
            value: "${vm.totalProjects}".toString(),
            label2: '05 New, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "Active Projects",
            value: "${vm.totalActiveProjects}".toString(),
            label2: '2 shipped, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "Completed Projects",
            value: "${vm.totalCompleteProjects}".toString(),
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

  bool _matchesProject(ProjectModel project) {
    final matchesText =
        _searchQuery.isEmpty ||
        [
          project.name,
          project.contactName ?? '',
          project.contactEmail ?? '',
        ].any((value) => value.toLowerCase().contains(_searchQuery));
    return matchesText &&
        (_statusFilter == 'All Status' ||
            project.status.label == _statusFilter);
  }

  Widget _projects(
    ProjectsViewModel vm, {
    bool isSmallScreen = false,
  }) => DataTableWidget(
    sortColumnIndex: vm.sortBy == "customer"
        ? 0
        : vm.sortBy == "customer"
        ? 1
        : null,
    sortAscending: vm.isAscending,
    rowsPerPage: vm.rowsPerPage(isSmallScreen),
    columns: <DataColumn>[
      // DataColumn(label: _tableHeader("Project ID")),
      DataColumn(
        label: TableHeader(label: "NAME"),
        onSort: (columnIndex, ascending) {
          vm.sort((u) => u.name, "customer");
        },
      ),
      if (!isSmallScreen)
        DataColumn(label: TableHeader(label: "CONTACT PERSON")),
      if (!isSmallScreen) DataColumn(label: TableHeader(label: "PHONE")),
      if (!isSmallScreen) DataColumn(label: TableHeader(label: "START DATE")),
      DataColumn(label: TableHeader(label: "END DATE")),
      DataColumn(label: TableHeader(label: "STATUS")),
      DataColumn(label: TableHeader(label: "ACTION")),
    ],
    dataSource: FilteredDataTableSource<ProjectModel>(
      source: ProjectsDataSource(
        vm: vm,
        isSmallScreen: isSmallScreen,
        onView: _onView,
        onEdit: (project) => _onEdit(vm, project),
      ),
      records: vm.projects,
      predicate: _matchesProject,
    ),
  );

  Future<void> _onView(ProjectModel project) async {
    await ProjectDetailPageRoute(projectId: project.id).push<void>(context);
  }

  Future<void> _onEdit(ProjectsViewModel vm, ProjectModel project) async {
    await _openProjectForm(
      vm,
      () => context.push<bool>(
        '/projects/add-project?projectId=${Uri.encodeQueryComponent(project.id)}',
      ),
    );
  }

  Future<void> _openProjectForm(
    ProjectsViewModel vm,
    Future<bool?> Function() openRoute,
  ) async {
    final saved = await openRoute();
    if (saved == true) {
      await Future.wait([vm.fetchProjects(), vm.fetchProjectAnalytics()]);
    }
  }
}

class ProjectsDataSource extends DataTableSource {
  final ProjectsViewModel vm;
  final Function(ProjectModel project)? onView;
  final Function(ProjectModel project)? onEdit;
  final bool isSmallScreen;

  ProjectsDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    this.isSmallScreen = false,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.projects.length) return null;

    final project = vm.projects[index];

    return DataRow.byIndex(
      index: index,
      //color: WidgetStateProperty.all(AppColors.gray1),
      cells: [
        // DataCell(Text(data['projectId'])),
        DataCell(TableValue(label: project.name)),
        if (!isSmallScreen)
          DataCell(TableValue(label: project.contactName ?? '')),
        if (!isSmallScreen)
          DataCell(TableValue(label: project.contactPhone ?? ' ')),
        if (!isSmallScreen)
          DataCell(TableValue(label: project.startDate?.toDdMMMyyyy() ?? '')),
        DataCell(
          TableValue(label: project.expectedEndDate?.toDdMMMyyyy() ?? ''),
        ),
        DataCell(
          TableStatusValue(
            label: project.status.label,
            color: AppColors.statusColor(project.status.label),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.open_in_new_outlined, size: 20),
                onPressed: onView == null ? null : () => onView!(project),
              ),
              IconButton(
                icon: Icon(Icons.edit, size: 20),
                onPressed: onEdit == null ? null : () => onEdit!(project),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void updateData(List<Map<String, dynamic>> newOrders) {
    // projects.clear();
    //projects.addAll(newOrders);
    notifyListeners(); // 🔥 refresh table
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.projects.length;

  @override
  int get selectedRowCount => 0;
}
