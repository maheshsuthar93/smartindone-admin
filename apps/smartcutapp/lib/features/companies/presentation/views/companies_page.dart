import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/core/network/interceptors/auth_interceptor.dart';
import 'package:board_cut/features/companies/presentation/viewmodels/companies_view_model.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:board_cut/shared/shared.dart' hide CompanyModel;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompaniesPage extends BaseStatefulScreen {
  const CompaniesPage({super.key});

  @override
  BaseState<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends BaseState<CompaniesPage> {
  final _viewModel = sl<CompaniesViewModel>();
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _statusFilter = 'All Status';
  String? _activeCompanyId;

  @override
  void initState() {
    super.initState();
    _activeCompanyId = sl<AuthInterceptor>().activeCompanyId.value;
    _viewModel.fetchCompanies();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType _) =>
      ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer<CompaniesViewModel>(
          builder: (context, vm, _) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(child: _buildDesktopLayout(vm)),
                ),
              ],
            );
          },
        ),
      );

  Widget _buildDesktopLayout(CompaniesViewModel vm) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RecordListToolbar(
          title: 'Companies',
          subtitle: 'Manage companies across your Cut Optimizer workspace.',
          description: _activeCompanyDescription(vm.companies),
          action: ButtonWidget.primary(
            label: 'Add Company',
            icon: Icons.add,
            iconPosition: IconPosition.left,
            onPressed: _addCompany,
          ),
          searchController: _searchController,
          searchHint: 'Search by company, owner or email...',
          onSearchChanged: (value) =>
              setState(() => _searchQuery = value.trim()),
          statusOptions: const ['All Status', 'Active', 'Inactive'],
          selectedStatus: _statusFilter,
          onStatusChanged: (status) => setState(() => _statusFilter = status),
          onClear: _clearFilters,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: DataTableWidget(
            rowsPerPage: 8,
            showCheckboxColumn: false,
            showEmptyRows: false,
            sortAscending: true,
            columns: [
              const DataColumn(label: TableHeader(label: 'COMPANY')),
              const DataColumn(label: TableHeader(label: 'OWNER')),
              const DataColumn(label: TableHeader(label: 'OWNER CONTACT')),
              const DataColumn(label: TableHeader(label: 'CREATED')),
              const DataColumn(label: TableHeader(label: 'STATUS')),
              const DataColumn(label: TableHeader(label: 'ACTION')),
            ],
            dataSource: CompanyDataSource(
              companies: _filteredCompanies(vm.companies),
              onView: _showDetails,
              onEdit: _editCompany,
              onSelect: _selectCompany,
              selectedCompanyId: _activeCompanyId,
              context: context,
            ),
          ),
        ),
      ],
    ),
  );

  List<CompanyModel> _filteredCompanies(List<CompanyModel> companies) {
    final query = _searchQuery.toLowerCase();
    return companies.where((company) {
      final matchesSearch =
          query.isEmpty ||
          [
            company.name,
            company.serviceType,
            company.ownerName,
            company.ownerEmail,
            company.ownerPhone,
          ].any((value) => value?.toLowerCase().contains(query) == true);
      final matchesStatus =
          _statusFilter == 'All Status' ||
          (_statusFilter == 'Active' && company.isActive) ||
          (_statusFilter == 'Inactive' && !company.isActive);
      return matchesSearch && matchesStatus;
    }).toList();
  }

  String _activeCompanyDescription(List<CompanyModel> companies) {
    for (final company in companies) {
      if (company.id == _activeCompanyId) {
        return 'Active company: ${company.name}. Select another company to switch data.';
      }
    }
    return 'Choose “Use company” to open that company’s data.';
  }

  Future<void> _selectCompany(CompanyModel company) async {
    if (!company.isActive) return;
    await sl<AuthInterceptor>().setActiveCompanyId(company.id);
    if (!mounted) return;
    setState(() => _activeCompanyId = company.id);
    router.go('/');
  }

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _statusFilter = 'All Status';
    });
  }

  Future<void> _addCompany() async {
    final saved = await const CompanyFormPageRoute(null).push<bool>(context);
    if (saved == true) await _viewModel.fetchCompanies();
  }

  Future<void> _editCompany(CompanyModel company) async {
    final saved = await CompanyFormPageRoute(company).push<bool>(context);
    if (saved == true) await _viewModel.fetchCompanies();
  }

  void _showDetails(CompanyModel company) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final size = MediaQuery.sizeOf(dialogContext);
        return Dialog(
          backgroundColor: AppColors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: AppSize.dialogWidth,
              maxHeight: size.height * .85,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DialogHeaderWidget(title: company.name),
                  const SizedBox(height: 16),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(
                                AppSize.borderRadius,
                              ),
                            ),
                            child: Wrap(
                              spacing: 24,
                              runSpacing: 8,
                              children: [
                                ItemSectionWidget(
                                  label: 'Company ID',
                                  value: company.id,
                                ),
                                ItemSectionWidget(
                                  label: 'Created',
                                  value: company.createdAt.toDdMMMyyyy(),
                                ),
                                if (company.updatedAt != null)
                                  ItemSectionWidget(
                                    label: 'Last updated',
                                    value: company.updatedAt!.toDdMMMyyyy(),
                                  ),
                                ItemSectionWidget(
                                  label: 'Status',
                                  value: company.isActive
                                      ? 'Active'
                                      : 'Inactive',
                                ),
                                ItemSectionWidget(
                                  label: 'Company service/type',
                                  value:
                                      company.serviceType?.trim().isNotEmpty ==
                                          true
                                      ? company.serviceType!
                                      : '—',
                                ),
                                ItemSectionWidget(
                                  label: 'Owner name',
                                  value:
                                      company.ownerName?.trim().isNotEmpty ==
                                          true
                                      ? company.ownerName!
                                      : '—',
                                ),
                                ItemSectionWidget(
                                  label: 'Owner email',
                                  value:
                                      company.ownerEmail?.trim().isNotEmpty ==
                                          true
                                      ? company.ownerEmail!
                                      : '—',
                                ),
                                ItemSectionWidget(
                                  label: 'Owner phone',
                                  value:
                                      company.ownerPhone?.trim().isNotEmpty ==
                                          true
                                      ? company.ownerPhone!
                                      : '—',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 200,
                      child: ButtonWidget.secondary(
                        label: 'Close',
                        onPressed: () => Navigator.of(dialogContext).pop(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CompanyDataSource extends DataTableSource {
  CompanyDataSource({
    required this.companies,
    required this.onView,
    required this.onEdit,
    required this.onSelect,
    required this.selectedCompanyId,
    required this.context,
  });

  final List<CompanyModel> companies;
  final ValueChanged<CompanyModel> onView;
  final ValueChanged<CompanyModel> onEdit;
  final ValueChanged<CompanyModel> onSelect;
  final String? selectedCompanyId;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    if (index >= companies.length) return null;
    final company = companies[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          _stackedValue(
            company.name,
            company.serviceType,
            260,
            showAvatar: true,
          ),
        ),
        DataCell(_stackedValue(company.ownerName, company.ownerEmail, 220)),
        DataCell(_lineValue(_valueOrDash(company.ownerPhone), 180)),
        DataCell(TableValue(label: company.createdAt.toDdMMMyyyy())),
        DataCell(
          TableStatusValue(
            label: company.isActive ? 'Active' : 'Inactive',
            color: AppColors.statusColor(
              company.isActive ? 'Active' : 'Inactive',
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                tooltip: !company.isActive
                    ? 'Inactive companies cannot be selected'
                    : selectedCompanyId == company.id
                    ? 'Active company'
                    : 'Use company',
                icon: Icon(
                  selectedCompanyId == company.id
                      ? Icons.check_circle
                      : Icons.play_circle_outline,
                  color: selectedCompanyId == company.id
                      ? AppColors.successColor
                      : AppColors.textSecondary,
                ),
                onPressed: company.isActive ? () => onSelect(company) : null,
              ),
              IconButton(
                tooltip: 'View company',
                icon: Icon(
                  Icons.open_in_new_outlined,
                  color: AppColors.textSecondary,
                ),
                onPressed: () => onView(company),
              ),
              IconButton(
                tooltip: 'Edit company',
                icon: Icon(Icons.edit, color: AppColors.textSecondary),
                onPressed: () => onEdit(company),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _valueOrDash(String? value) {
    final trimmed = value?.trim();
    return trimmed?.isNotEmpty == true ? trimmed! : '—';
  }

  Widget _stackedValue(
    String? title,
    String? subtitle,
    double width, {
    bool showAvatar = false,
  }) {
    final titleText = _valueOrDash(title);
    final subtitleText = subtitle?.trim() ?? '';
    final initial = titleText == '—' ? '?' : titleText[0].toUpperCase();
    final tooltipText = [
      titleText,
      if (subtitleText.isNotEmpty) subtitleText,
    ].join('\n');
    return Tooltip(
      message: tooltipText,
      child: SizedBox(
        width: width,
        child: Row(
          children: [
            if (showAvatar) ...[
              CircleAvatar(
                radius: 17,
                backgroundColor: AppColors.primaryColor.withValues(alpha: .10),
                child: Text(
                  initial,
                  style: AppTextStyle.labelSmall.bold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.labelSmall
                        .responsive(context)
                        .semiBold
                        .copyWith(color: AppColors.textPrimary),
                  ),
                  if (subtitleText.isNotEmpty)
                    Text(
                      subtitleText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.labelSmall
                          .responsive(context)
                          .regular
                          .copyWith(color: AppColors.textSecondary),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lineValue(String value, double width) => Tooltip(
    message: value,
    child: SizedBox(
      width: width,
      child: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.labelSmall
            .responsive(context)
            .regular
            .copyWith(color: AppColors.textPrimary),
      ),
    ),
  );

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => companies.length;

  @override
  int get selectedRowCount => 0;
}
