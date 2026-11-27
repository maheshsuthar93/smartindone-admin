import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_project/presentation/viewmodels/create_project_view_model.dart';
import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/projects/data/models/project_detail_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateProjectPage extends BaseStatefulScreen {
  const CreateProjectPage({
    super.key,
    this.projectId,
    this.customerId,
    this.readOnly = false,
  });

  final String? projectId;
  final String? customerId;
  final bool readOnly;

  @override
  BaseState<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends BaseState<CreateProjectPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _contactEmailController = TextEditingController();
  final _deliveryAddressController = TextEditingController();
  final _deliveryAddress2Controller = TextEditingController();
  final _deliveryCityController = TextEditingController();
  final _deliveryStateController = TextEditingController();
  final _deliveryPostalCodeController = TextEditingController();
  final _deliveryCountryController = TextEditingController(text: 'India');
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _customerNameController = TextEditingController();
  final _viewModel = sl<CreateProjectViewModel>();

  DateTime? _startDate;
  DateTime? _endDate;
  ProjectStatus _status = ProjectStatus.planning;

  @override
  void initState() {
    super.initState();
    debugPrint('Customer id is ${widget.customerId}');
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _viewModel.load(
      projectId: widget.projectId,
      customerId: widget.customerId,
    );
    if (!mounted) return;
    final project = _viewModel.project;
    if (project != null) _populateForm(project);
    _customerNameController.text = _viewModel.selectedCustomer?.name ?? '';
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    _contactEmailController.dispose();
    _deliveryAddressController.dispose();
    _deliveryAddress2Controller.dispose();
    _deliveryCityController.dispose();
    _deliveryStateController.dispose();
    _deliveryPostalCodeController.dispose();
    _deliveryCountryController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _customerNameController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    final title = widget.readOnly
        ? 'Project Details'
        : widget.projectId == null
        ? 'New Project'
        : 'Update Project';

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<CreateProjectViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.error != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted || viewModel.error == null) return;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(viewModel.error!)));
              viewModel.clearError();
            });
          }

          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: Center(
              child: Container(
                width: isSmallScreen ? double.maxFinite : AppSize.dialogWidth,
                height: ResponsiveHelper.determineDialogHeight(screenType),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  color: AppColors.surface,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      DialogHeaderWidget(title: title),
                      const SizedBox(height: 12),
                      if (viewModel.isLoading)
                        const Expanded(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      else if (_shouldShowLoadError(viewModel))
                        Expanded(child: _loadErrorContent(viewModel))
                      else
                        Expanded(child: _buildForm(viewModel)),
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

  bool _shouldShowLoadError(CreateProjectViewModel viewModel) {
    if (viewModel.loadError == null) return false;
    if (widget.projectId != null && viewModel.project == null) return true;
    return widget.projectId == null &&
        widget.customerId == null &&
        viewModel.customers.isEmpty;
  }

  Widget _loadErrorContent(CreateProjectViewModel viewModel) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        EmptyWidget(text: viewModel.loadError ?? 'Could not load project data'),
        const SizedBox(height: 12),
        ButtonWidget.secondary(label: 'Retry', onPressed: _loadInitialData),
      ],
    ),
  );

  Widget _buildForm(CreateProjectViewModel viewModel) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _row(
                      _customerField(viewModel),
                      _textField(
                        controller: _nameController,
                        label: 'Project Name',
                        hint: 'Enter project name',
                        required: true,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                            ? 'Project name is required'
                            : null,
                      ),
                    ),
                    _row(
                      _textField(
                        controller: _contactEmailController,
                        label: 'Contact Email',
                        hint: 'Enter email address',
                        keyboardType: TextInputType.emailAddress,
                        validator: _emailValidator,
                      ),
                      _statusField(),
                    ),
                    _row(
                      _textField(
                        controller: _contactNameController,
                        label: 'Contact Person',
                        hint: 'Enter contact person name',
                      ),
                      _textField(
                        controller: _contactPhoneController,
                        label: 'Contact Phone',
                        hint: 'Enter phone number',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    _row(
                      _dateField(
                        controller: _startDateController,
                        label: 'Start Date',
                        date: _startDate,
                        onSelected: (date) => setState(() => _startDate = date),
                        validator: (_) =>
                            widget.projectId == null &&
                                _startDate != null &&
                                DateUtils.dateOnly(
                                  _startDate!,
                                ).isBefore(DateUtils.dateOnly(DateTime.now()))
                            ? 'Start date cannot be in the past'
                            : null,
                      ),
                      _dateField(
                        controller: _endDateController,
                        label: 'Expected End Date',
                        date: _endDate,
                        onSelected: (date) => setState(() => _endDate = date),
                        isExpectedEndDate: true,
                        validator: (_) {
                          if (widget.projectId == null &&
                              _endDate != null &&
                              DateUtils.dateOnly(
                                _endDate!,
                              ).isBefore(DateUtils.dateOnly(DateTime.now()))) {
                            return 'Expected end date cannot be in the past';
                          }
                          if (_startDate != null &&
                              _endDate != null &&
                              DateUtils.dateOnly(_endDate!)
                                  .isBefore(DateUtils.dateOnly(_startDate!))) {
                            return 'Expected end date must be on or after start date';
                          }
                          return null;
                        },
                      ),
                    ),
                    _row(
                      _textField(
                        controller: _deliveryAddressController,
                        label: 'Delivery Address',
                        hint: 'Address line 1',
                      ),
                      _textField(
                        controller: _deliveryAddress2Controller,
                        label: 'Address Line 2',
                        hint: 'Address line 2',
                      ),
                    ),
                    _row(
                      _textField(
                        controller: _deliveryCityController,
                        label: 'City',
                        hint: 'City',
                      ),
                      _textField(
                        controller: _deliveryStateController,
                        label: 'State',
                        hint: 'State',
                      ),
                    ),
                    _row(
                      _textField(
                        controller: _deliveryPostalCodeController,
                        label: 'Postal Code',
                        hint: 'Postal code',
                        keyboardType: TextInputType.number,
                      ),
                      _textField(
                        controller: _deliveryCountryController,
                        label: 'Country',
                        hint: 'Country',
                      ),
                    ),
                    if (widget.readOnly && viewModel.project != null) ...[
                      _row(
                        _displayValue(
                          'Created At',
                          _formatDateTime(viewModel.project!.createdAt),
                        ),
                        _displayValue(
                          'Updated At',
                          _formatDateTime(viewModel.project!.updatedAt),
                        ),
                      ),
                      _row(
                        _displayValue(
                          'Actual End Date',
                          _formatDate(viewModel.project!.actualEndDate),
                        ),
                        _displayValue(
                          'Order Count',
                          '${viewModel.project!.ordersCount}',
                        ),
                      ),
                    ],
                    _fullRow(
                      _textField(
                        controller: _descriptionController,
                        label: 'Description',
                        hint: 'Enter project description',
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 160,
                            child: ButtonWidget.secondary(
                              label: widget.readOnly ? 'Close' : 'Cancel',
                              onPressed: router.pop,
                            ),
                          ),
                          if (!widget.readOnly)
                            SizedBox(
                              width: 180,
                              child: ButtonWidget(
                                label: widget.projectId == null
                                    ? 'Create Project'
                                    : 'Update Project',
                                onPressed: viewModel.isSaving ? null : _save,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(Widget first, Widget second) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Expanded(child: first),
        Expanded(child: second),
      ],
    ),
  );

  Widget _fullRow(Widget child) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Row(children: [Expanded(child: child)]),
  );

  Widget _customerField(CreateProjectViewModel viewModel) {
    if (widget.readOnly) {
      return _textField(
        controller: _customerNameController,
        label: 'Customer',
        readOnly: true,
      );
    }
    return AutoCompleteWidget<CustomerModel>(
      key: ValueKey(viewModel.selectedCustomer?.id),
      labelText: 'Customer',
      hintText: 'Search customer...',
      options: viewModel.customers,
      initialValue: viewModel.selectedCustomer?.name,
      displayStringForOption: (customer) => customer.name,
      filterFn: (customer, query) =>
          customer.name.toLowerCase().contains(query),
      isRequired: true,
      validator: (value) {
        if (widget.customerId != null &&
            viewModel.selectedCustomer == null &&
            (value == null || value.trim().isEmpty)) {
          return null;
        }
        final selectedCustomer = viewModel.selectedCustomer;
        if (selectedCustomer == null ||
            value?.trim() != selectedCustomer.name) {
          return 'Select a customer from the list';
        }
        return null;
      },
      prefixIcon: const Icon(Icons.person_outline),
      onSelected: viewModel.selectCustomer,
      onChanged: (_) => viewModel.clearCustomerSelection(),
    );
  }

  Widget _statusField() {
    final statuses = ProjectStatus.values
        .where((status) => status != ProjectStatus.unknown)
        .toList();
    if (widget.readOnly) {
      return InputDecorator(
        decoration: const InputDecoration(labelText: 'Status'),
        child: Text(_status.label),
      );
    }

    return AutoCompleteWidget<ProjectStatus>(
      key: ValueKey(_status),
      labelText: 'Status',
      hintText: 'Search status',
      options: statuses,
      initialValue: _status.label,
      displayStringForOption: (status) => status.label,
      filterFn: (status, query) => status.label.toLowerCase().contains(query),
      isRequired: true,
      prefixIcon: const Icon(
        Icons.flag_outlined,
        color: AppColors.textFieldIcon,
        size: 20,
      ),
      validator: (value) => statuses.any((status) => status.label == value)
          ? null
          : 'Select a status from the list',
      onSelected: (status) => setState(() => _status = status),
    );
  }

  Widget _dateField({
    required TextEditingController controller,
    required String label,
    required DateTime? date,
    required ValueChanged<DateTime?> onSelected,
    bool isExpectedEndDate = false,
    String? Function(String?)? validator,
  }) => _textField(
    controller: controller,
    label: label,
    hint: 'Select date',
    readOnly: true,
    validator: validator,
    onTap: widget.readOnly
        ? null
        : () async {
            final today = DateUtils.dateOnly(DateTime.now());
            final firstDate = widget.projectId == null
                ? (isExpectedEndDate && _startDate != null
                      ? DateUtils.dateOnly(_startDate!).isAfter(today)
                            ? DateUtils.dateOnly(_startDate!)
                            : today
                      : today)
                : DateTime(2000);
            final initial = date == null || date.isBefore(firstDate)
                ? firstDate
                : date;
            final picked = await showDatePicker(
              context: context,
              initialDate: initial,
              firstDate: firstDate,
              lastDate: DateTime(today.year + 20),
            );
            if (picked == null) return;
            controller.text = picked.toDdMMMyyyy();
            onSelected(picked);
          },
  );

  Widget _textField({
    required String label,
    TextEditingController? controller,
    String? hint,
    bool required = false,
    bool readOnly = false,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    GestureTapCallback? onTap,
    String? Function(String?)? validator,
  }) => TextFormFieldWidget(
    controller: controller,
    labelText: label,
    hintText: hint,
    isRequired: required,
    readOnly: readOnly || widget.readOnly,
    maxLines: maxLines,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    onTap: onTap,
    validator: validator,
  );

  void _populateForm(ProjectDetailModel project) {
    _nameController.text = project.name;
    _descriptionController.text = project.description ?? '';
    _contactNameController.text = project.contactName ?? '';
    _contactPhoneController.text = project.contactPhone ?? '';
    _contactEmailController.text = project.contactEmail ?? '';
    _deliveryAddressController.text = project.deliveryAddress ?? '';
    _deliveryAddress2Controller.text = project.deliveryAddress2 ?? '';
    _deliveryCityController.text = project.deliveryCity ?? '';
    _deliveryStateController.text = project.deliveryState ?? '';
    _deliveryPostalCodeController.text = project.deliveryPostalCode ?? '';
    _deliveryCountryController.text = project.deliveryCountry ?? '';
    _startDate = project.startDate;
    _endDate = project.expectedEndDate;
    _startDateController.text = project.startDate?.toDdMMMyyyy() ?? '';
    _endDateController.text = project.expectedEndDate?.toDdMMMyyyy() ?? '';
    _status = project.status;
  }

  String? _emailValidator(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return null;
    return RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)
        ? null
        : 'Enter a valid email address';
  }

  Widget _displayValue(String label, String value) => InputDecorator(
    decoration: InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
    ),
    child: Text(value),
  );

  String _formatDate(DateTime? value) => value?.toDdMMMyyyy() ?? '—';

  String _formatDateTime(DateTime? value) => value == null
      ? '—'
      : '${value.toDdMMMyyyy()} ${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';

  Future<void> _save() async {
    if (_viewModel.isSaving) return;
    if (!_formKey.currentState!.validate()) return;
    final selectedCustomerId =
        _viewModel.selectedCustomer?.id ?? widget.customerId;
    if (selectedCustomerId == null || selectedCustomerId.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Select a customer')));
      return;
    }

    final saved = await _viewModel.save(
      customerId: selectedCustomerId,
      projectId: widget.projectId,
      data: {
        'customerId': selectedCustomerId,
        'name': _nameController.text.trim(),
        'description': _nullable(_descriptionController.text),
        'status': _status.value,
        'startDate': _startDate?.toIso8601String(),
        'expectedEndDate': _endDate?.toIso8601String(),
        'contactName': _nullable(_contactNameController.text),
        'contactPhone': _nullable(_contactPhoneController.text),
        'contactEmail': _nullable(_contactEmailController.text),
        'deliveryAddress': _nullable(_deliveryAddressController.text),
        'deliveryAddress2': _nullable(_deliveryAddress2Controller.text),
        'deliveryCity': _nullable(_deliveryCityController.text),
        'deliveryState': _nullable(_deliveryStateController.text),
        'deliveryPostalCode': _nullable(_deliveryPostalCodeController.text),
        'deliveryCountry': _nullable(_deliveryCountryController.text),
      },
    );
    if (saved && mounted) router.pop(true);
  }

  String? _nullable(String value) => value.trim().isEmpty ? null : value.trim();
}
