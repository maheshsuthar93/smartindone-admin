import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/customers/domain/usecases/get_customers.dart';
import 'package:board_cut/features/factories/data/models/factory_model.dart';
import 'package:board_cut/features/factories/domain/usecases/get_factories.dart';
import 'package:board_cut/features/create_order/presentation/viewmodels/create_order_view_model.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:board_cut/features/orders/domain/usecases/get_order_for_update.dart';
import 'package:board_cut/features/projects/data/models/project_model.dart';
import 'package:board_cut/features/projects/domain/usecases/get_projects.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CreateOrderPage extends BaseStatefulScreen {
  const CreateOrderPage({super.key, this.order});

  final OrderModel? order;

  bool get isEditing => order != null;

  @override
  BaseState<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends BaseState<CreateOrderPage> {
  final _viewModel = sl<CreateOrderViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _deliveryDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  List<CustomerModel> _customers = [];
  List<ProjectModel> _projects = [];
  List<FactoryModel> _factories = [];
  CustomerModel? _selectedCustomer;
  ProjectModel? _selectedProject;
  FactoryModel? _selectedFactory;
  OrderStatus _selectedStatus = OrderStatus.draft;
  String? _initialCustomerName;
  String? _initialProjectName;
  String? _initialFactoryName;
  String? _factoryId;
  bool _isLoading = true;
  int _projectLoadToken = 0;

  @override
  void initState() {
    super.initState();
    final order = widget.order;
    if (order != null) {
      _selectedStatus = order.status;
      _selectedDate = order.deliveryDate;
      _deliveryDateController.text = order.deliveryDate.toDdMMMyyyy();
      _initialCustomerName = order.customer.name;
      _initialProjectName = order.project.name;
    }
    _loadFormData();
  }

  Future<void> _loadFormData() async {
    final order = widget.order;
    final customerResult = await sl<GetCustomers>()(page: 1, limit: 100);
    final projectResult = await sl<GetProjects>()(
      page: 1,
      limit: 100,
      customerId: order?.customer.id,
    );
    final factoryResult = await sl<GetFactories>()();

    customerResult.match((failure) => _showError(failure.message), (result) {
      _customers = result.items;
      if (order != null) {
        _selectedCustomer = _findById(
          _customers,
          order.customer.id,
          (x) => x.id,
        );
      }
    });
    projectResult.match((failure) => _showError(failure.message), (result) {
      _projects = result.items;
      if (order != null) {
        _selectedProject = _findById(_projects, order.projectId, (x) => x.id);
      }
    });
    factoryResult.match((failure) => _showError(failure.message), (result) {
      _factories = result;
    });

    if (order != null) {
      final detailResult = await sl<GetOrderForUpdate>()(order.id);
      detailResult.match((failure) => _showError(failure.message), (detail) {
        _factoryId = detail['factoryId'] as String?;
        _selectedDate = detail['deliveryDate'] == null
            ? null
            : DateTime.tryParse(detail['deliveryDate'] as String);
        _deliveryDateController.text = _selectedDate?.toDdMMMyyyy() ?? '';
        _descriptionController.text = detail['description'] as String? ?? '';
        _selectedCustomer =
            _findById(
              _customers,
              detail['customerId'] as String? ?? order.customer.id,
              (x) => x.id,
            ) ??
            _selectedCustomer;
        if (detail.containsKey('projectId')) {
          _selectedProject = _findById(
            _projects,
            detail['projectId'] as String?,
            (x) => x.id,
          );
          _initialProjectName = _selectedProject?.name;
        } else {
          _selectedProject =
              _findById(_projects, order.projectId, (x) => x.id) ??
              _selectedProject;
        }
        _selectedFactory = _findById(_factories, _factoryId, (x) => x.id);
        final factory = detail['factory'];
        _initialFactoryName =
            _selectedFactory?.name ??
            (factory is Map ? factory['name'] as String? : null);
      });
    }

    if (mounted) setState(() => _isLoading = false);
  }

  T? _findById<T>(List<T> values, String? id, String? Function(T) getId) {
    if (id == null) return null;
    for (final value in values) {
      if (getId(value) == id) return value;
    }
    return null;
  }

  Future<void> _selectDate() async {
    final today = DateUtils.dateOnly(DateTime.now());
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? today,
      firstDate: today,
      lastDate: DateTime(today.year + 10),
    );
    if (pickedDate == null || !mounted) return;
    setState(() {
      _selectedDate = pickedDate;
      _deliveryDateController.text = pickedDate.toDdMMMyyyy();
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen = screenType != ScreenType.desktop;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<CreateOrderViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          backgroundColor: AppColors.transparent,
          body: Center(
            child: Container(
              width: isSmallScreen ? double.maxFinite : AppSize.dialogWidth,
              height: ResponsiveHelper.determineDialogHeight(screenType),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
                color: AppColors.surface,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DialogHeaderWidget(
                      title: widget.isEditing ? 'Update Order' : 'New Order',
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _buildForm(isSaving: viewModel.isSaving),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm({required bool isSaving}) => Scrollbar(
    child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            Row(
              spacing: 10,
              children: [
                Expanded(child: _customerField),
                Expanded(child: _projectField),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              spacing: 10,
              children: [
                Expanded(child: _factoryField),
                Expanded(child: _statusField),
              ],
            ),
            const SizedBox(height: 20),
            _deliveryDateField,
            const SizedBox(height: 20),
            _descriptionField,
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 160,
                    child: ButtonWidget.secondary(
                      label: 'Cancel',
                      onPressed: router.pop,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: _buildSaveButton(isSaving: isSaving),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget get _customerField => _choiceField<CustomerModel>(
    label: 'Customer',
    hint: 'Search customer',
    options: _customers,
    labelFor: (x) => x.name,
    initial: _selectedCustomer?.name ?? _initialCustomerName,
    onSelected: _selectCustomer,
    validator: _requiredValidator('Customer'),
    onChanged: (value) {
      if (_selectedCustomer != null && _selectedCustomer?.name != value) {
        setState(() {
          _selectedCustomer = null;
          _selectedProject = null;
          _initialProjectName = null;
          _projects = [];
          _projectLoadToken++;
        });
      }
    },
  );

  Widget get _projectField => _choiceField<ProjectModel>(
    key: ValueKey('project-${_selectedCustomer?.id ?? 'none'}'),
    label: 'Project',
    hint: _selectedCustomer == null
        ? 'Select a customer first'
        : 'Search project',
    options: _projects,
    labelFor: (x) => x.name,
    initial: _selectedProject?.name ?? _initialProjectName,
    onSelected: (x) => _selectedProject = x,
    validator: _requiredValidator('Project'),
    onChanged: (value) {
      if (_selectedProject?.name != value) _selectedProject = null;
    },
  );

  Future<void> _selectCustomer(CustomerModel customer) async {
    final loadToken = ++_projectLoadToken;
    setState(() {
      _selectedCustomer = customer;
      _selectedProject = null;
      _initialProjectName = null;
      _projects = [];
    });

    final result = await sl<GetProjects>()(
      page: 1,
      limit: 100,
      customerId: customer.id,
    );
    if (!mounted || loadToken != _projectLoadToken) return;

    result.match(
      (failure) => _showError(failure.message),
      (projects) => setState(() => _projects = projects.items),
    );
  }

  Widget get _factoryField => _choiceField<FactoryModel>(
    label: 'Factory',
    hint: 'Search factory',
    options: _factories,
    labelFor: (x) => x.name,
    initial: _selectedFactory?.name ?? _initialFactoryName,
    onSelected: (x) {
      _selectedFactory = x;
      _factoryId = x.id;
    },
    validator: _requiredValidator('Factory'),
    onChanged: (value) {
      if (_selectedFactory?.name != value) {
        _selectedFactory = null;
        _factoryId = null;
      }
    },
  );

  Widget get _statusField => _choiceField<OrderStatus>(
    label: 'Status',
    hint: 'Select status',
    options: _availableStatusOptions,
    labelFor: _statusLabel,
    initial: _statusLabel(_selectedStatus),
    onSelected: (x) => _selectedStatus = x,
    validator: _requiredValidator('Status'),
  );

  List<OrderStatus> get _availableStatusOptions {
    final current = widget.order?.status;
    if (current == null) return const [OrderStatus.draft];
    return switch (current) {
      OrderStatus.draft => const [
        OrderStatus.draft,
        OrderStatus.approved,
        OrderStatus.cancelled,
      ],
      OrderStatus.approved => const [
        OrderStatus.approved,
        OrderStatus.cancelled,
      ],
      OrderStatus.inProduction ||
      OrderStatus.completed ||
      OrderStatus.shipped ||
      OrderStatus.delivered ||
      OrderStatus.cancelled => [current],
    };
  }

  Widget get _deliveryDateField => TextFormFieldWidget(
    labelText: 'Delivery Date',
    hintText: 'Select delivery date',
    controller: _deliveryDateController,
    readOnly: true,
    onTap: _selectDate,
    prefixIcon: const Icon(
      Icons.calendar_today_outlined,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _descriptionField => TextFormFieldWidget(
    labelText: 'Description',
    hintText: 'Enter order description',
    controller: _descriptionController,
    maxLines: 3,
  );

  Widget _choiceField<T extends Object>({
    Key? key,
    required String label,
    required String hint,
    required List<T> options,
    required String Function(T) labelFor,
    required void Function(T) onSelected,
    String? initial,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
  }) => AutoCompleteWidget<T>(
    key: key,
    labelText: label,
    hintText: hint,
    options: options,
    displayStringForOption: labelFor,
    onSelected: onSelected,
    initialValue: initial,
    isRequired: validator != null,
    validator: validator,
    onChanged: onChanged,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    prefixIcon: const Icon(
      Icons.search,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget _buildSaveButton({required bool isSaving}) => ButtonWidget(
    label: isSaving
        ? 'Saving…'
        : widget.isEditing
        ? 'Update Order'
        : 'Create Order',
    onPressed: isSaving ? null : _submit,
  );

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final customerId = _selectedCustomer?.id ?? widget.order?.customer.id;
    final projectId = _selectedProject?.id ?? widget.order?.projectId;
    final companyId = _selectedCustomer?.companyId ?? widget.order?.companyId;
    final factoryId = _selectedFactory?.id ?? _factoryId;
    if (customerId == null || projectId == null || factoryId == null) {
      _showError('Select a customer, project, and factory.');
      return;
    }
    if (!widget.isEditing && companyId == null) {
      _showError('The selected customer has no company assigned.');
      return;
    }
    final payload = <String, dynamic>{
      if (_selectedDate != null)
        'deliveryDate': DateTime.utc(
          _selectedDate!.year,
          _selectedDate!.month,
          _selectedDate!.day,
        ).toIso8601String(),
      'status': _statusApiValue(_selectedStatus),
      'customerId': customerId,
      'projectId': projectId,
      'factoryId': factoryId,
      'description': _descriptionController.text.trim(),
      if (!widget.isEditing) 'companyId': companyId,
    };
    final saved = await _viewModel.save(
      orderId: widget.order?.id,
      data: payload,
    );
    if (!mounted) return;
    if (!saved) {
      _showError(_viewModel.error ?? 'Unable to save order.');
      return;
    }
    Fluttertoast.showToast(
      msg:
          _viewModel.message ??
          (widget.isEditing
              ? 'Order updated successfully'
              : 'Order created successfully'),
      gravity: ToastGravity.BOTTOM,
      webPosition: 'center',
      backgroundColor: AppColors.primaryColor,
      webBgColor: AppColors.primaryColorWebHex,
    );
    router.pop(true);
  }

  String _statusLabel(OrderStatus status) => switch (status) {
    OrderStatus.draft => 'Draft',
    OrderStatus.approved => 'Approved',
    OrderStatus.inProduction => 'In Production',
    OrderStatus.completed => 'Completed',
    OrderStatus.shipped => 'Shipped',
    OrderStatus.delivered => 'Delivered',
    OrderStatus.cancelled => 'Cancelled',
  };

  String _statusApiValue(OrderStatus status) => switch (status) {
    OrderStatus.draft => 'DRAFT',
    OrderStatus.approved => 'APPROVED',
    OrderStatus.inProduction => 'IN_PRODUCTION',
    OrderStatus.completed => 'COMPLETED',
    OrderStatus.shipped => 'SHIPPED',
    OrderStatus.delivered => 'DELIVERED',
    OrderStatus.cancelled => 'CANCELLED',
  };

  String? Function(String?) _requiredValidator(String label) =>
      (value) =>
          value == null || value.trim().isEmpty ? '$label is required' : null;

  void _showError(String message) {
    if (!mounted) return;
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      webPosition: 'center',
      backgroundColor: AppColors.primaryColor,
      webBgColor: AppColors.primaryColorWebHex,
    );
  }

  @override
  void dispose() {
    _deliveryDateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
