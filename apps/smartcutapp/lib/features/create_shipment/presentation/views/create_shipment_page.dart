import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_shipment/data/models/create_shipment_order_model.dart';
import 'package:board_cut/features/create_shipment/data/models/create_shipment_project_model.dart';
import 'package:board_cut/features/create_shipment/data/models/shipment_driver_model.dart';
import 'package:board_cut/features/create_shipment/presentation/viewmodels/create_shipment_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateShipmentPage extends BaseStatefulScreen {
  const CreateShipmentPage({super.key, this.shipmentId});

  final String? shipmentId;

  @override
  BaseState<CreateShipmentPage> createState() => _CreateShipmentPageState();
}

class _CreateShipmentPageState extends BaseState<CreateShipmentPage> {
  static const _companyId = '8e2ce201-3a25-4dc6-a5a6-5b63c92620a8';

  final _shipmentViewModel = sl<CreateShipmentViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _driverPhoneController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _deliveryInstructionsController = TextEditingController();

  CreateShipmentProjectModel? _selectedProject;
  CreateShipmentOrderModel? _selectedOrder;
  ShipmentDriverModel? _selectedDriver;
  ShipmentStatus? _selectedStatus = ShipmentStatus.pending;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final loadRequests = <Future<void>>[
      _shipmentViewModel.fetchProjects(companyId: _companyId),
    ];
    final shipmentId = widget.shipmentId;
    if (shipmentId != null) {
      loadRequests.add(
        _shipmentViewModel.fetchShipment(shipmentId: shipmentId),
      );
    }
    await Future.wait(loadRequests);

    final shipment = _shipmentViewModel.shipment;
    if (shipment == null || !mounted) return;

    final projectId = shipment.order.project.id;
    await Future.wait([
      _shipmentViewModel.fetchOrders(projectId: projectId),
      _shipmentViewModel.fetchDrivers(companyId: _companyId),
    ]);
    if (!mounted) return;

    final matchingProject = _shipmentViewModel.projects.where(
      (project) => project.id == projectId,
    );
    final matchingOrder = _shipmentViewModel.orders.where(
      (order) => order.id == shipment.orderId,
    );
    final driverId = shipment.driverId;
    final matchingDriver = _shipmentViewModel.drivers.where(
      (driver) => driver.id == driverId,
    );

    setState(() {
      _selectedProject = matchingProject.isEmpty
          ? CreateShipmentProjectModel(
              id: projectId,
              name: shipment.order.project.name,
            )
          : matchingProject.first;
      _selectedOrder = matchingOrder.isEmpty
          ? CreateShipmentOrderModel(
              id: shipment.orderId,
              orderCode:
                  shipment.order.orderCode ??
                  'Order #${shipment.order.orderNumber ?? ''}',
            )
          : matchingOrder.first;
      _selectedDriver = matchingDriver.isEmpty
          ? (shipment.driverId == null || shipment.driver == null
                ? null
                : ShipmentDriverModel(
                    id: shipment.driverId!,
                    name: shipment.driver!.name,
                    phone: shipment.driver!.phone,
                    vehicleNumber: shipment.driver!.vehicleNumber,
                    licenseNo: '',
                    vehicleType: '',
                  ))
          : matchingDriver.first;
      _selectedStatus = shipment.status;
      _address1Controller.text = shipment.deliveryAddress ?? '';
      _address2Controller.text = shipment.deliveryAddress2 ?? '';
      _cityController.text = shipment.deliveryCity ?? '';
      _stateController.text = shipment.deliveryState ?? '';
      _pincodeController.text = shipment.deliveryPostalCode ?? '';
      _deliveryInstructionsController.text =
          shipment.deliveryInstructions ?? '';
      _driverPhoneController.text = shipment.driver?.phone ?? '';
      _vehicleNumberController.text = shipment.driver?.vehicleNumber ?? '';
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider.value(
      value: _shipmentViewModel,
      child: Consumer<CreateShipmentViewModel>(
        builder: (context, vm, child) {
          if (vm.error != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(vm.error!)));
              vm.clearError();
            });
          }
          if (vm.isLoading || vm.isShipmentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final isSmallScreen =
              screenType == ScreenType.mobile ||
              screenType == ScreenType.tablet;

          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: Center(
              child: Container(
                width: !isSmallScreen ? AppSize.dialogWidth : double.maxFinite,
                height: ResponsiveHelper.determineDialogHeight(screenType),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  color: AppColors.surface,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      DialogHeaderWidget(
                        title: widget.shipmentId == null
                            ? 'New Shipment'
                            : 'Update Shipment',
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: switch (screenType) {
                          ScreenType.mobile => _buildDesktopLayout(),
                          ScreenType.tablet => _buildDesktopLayout(),
                          ScreenType.desktop => _buildDesktopLayout(),
                        },
                      ),
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

  Widget get _driverNameField => _buildAutoCompleteField<ShipmentDriverModel>(
    labelText: 'Driver',
    hintText: _shipmentViewModel.isDriversLoading
        ? 'Loading drivers...'
        : 'Search driver',
    options: _shipmentViewModel.drivers,
    initialValue:
        _selectedDriver?.name ??
        (_shipmentViewModel.shipment?.driver?.name ?? ''),
    fieldKey: ValueKey(_selectedDriver?.id ?? 'driver-unselected'),
    displayStringForOption: (driver) => driver.name,
    isRequired: true,
    prefixIcon: const Icon(Icons.person, color: AppColors.textFieldIcon),
    onSelected: _onDriverSelected,
    onChanged: (_) {
      setState(() {
        _selectedDriver = null;
        _driverPhoneController.clear();
        _vehicleNumberController.clear();
      });
    },
    validator: (_) => _selectedDriver == null ? 'Select a driver' : null,
    filterFn: (driver, query) =>
        driver.name.toLowerCase().contains(query) ||
        driver.phone.toLowerCase().contains(query) ||
        driver.vehicleNumber.toLowerCase().contains(query),
  );

  Widget get _vehicleNoField => _buildTextFormField(
    labelText: 'Vehicle Number',
    hintText: 'Enter the vehicle number',
    isRequired: true,
    controller: _vehicleNumberController,
    readOnly: true,
    validator: (value) => _requiredField(value, 'Vehicle number'),
    keyboardType: TextInputType.text,
    prefixIcon: const Icon(
      Icons.directions_car,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _driverPhoneField => _buildTextFormField(
    labelText: 'Driver Phone',
    hintText: 'Filled from selected driver',
    isRequired: true,
    controller: _driverPhoneController,
    readOnly: true,
    validator: (value) => _requiredField(value, 'Driver phone'),
    keyboardType: TextInputType.phone,
    prefixIcon: const Icon(
      Icons.phone,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _statusField {
    return _buildAutoCompleteField(
      labelText: 'Status',
      initialValue: _selectedStatus?.label,
      fieldKey: ValueKey(_selectedStatus),

      options: _availableShipmentStatuses,
      displayStringForOption: (status) => status.label,
      isRequired: true,
      prefixIcon: const Icon(
        Icons.person,
        color: AppColors.textFieldIcon,
        size: 20,
      ),
      onSelected: (value) {
        setState(() => _selectedStatus = value);
      },
      validator: (_) => _selectedStatus == null ? 'Select a status' : null,
      onChanged: (_) => setState(() => _selectedStatus = null),
      filterFn: (value, query) {
        return value.label.toLowerCase().contains(query);
      },
    );
  }

  List<ShipmentStatus> get _availableShipmentStatuses {
    if (widget.shipmentId == null) return const [ShipmentStatus.pending];
    final current =
        _shipmentViewModel.shipment?.status ??
        _selectedStatus ??
        ShipmentStatus.pending;
    return switch (current) {
      ShipmentStatus.pending => const [
        ShipmentStatus.pending,
        ShipmentStatus.dispatched,
        ShipmentStatus.cancelled,
      ],
      ShipmentStatus.dispatched => const [
        ShipmentStatus.dispatched,
        ShipmentStatus.inTransit,
      ],
      ShipmentStatus.inTransit => const [
        ShipmentStatus.inTransit,
        ShipmentStatus.delivered,
      ],
      ShipmentStatus.delivered => const [ShipmentStatus.delivered],
      ShipmentStatus.cancelled => const [ShipmentStatus.cancelled],
      ShipmentStatus.unknown => const [ShipmentStatus.pending],
    };
  }

  List<CreateShipmentOrderModel> get _orderOptions {
    final selectedOrder = _selectedOrder;
    final orders = _shipmentViewModel.orders;
    if (selectedOrder == null ||
        orders.any((order) => order.id == selectedOrder.id)) {
      return orders;
    }
    return [selectedOrder, ...orders];
  }

  Widget get _orderField => _buildAutoCompleteField(
    labelText: 'Order',
    hintText: _shipmentViewModel.isOrdersLoading
        ? 'Loading orders...'
        : 'Search order',
    options: _orderOptions,
    initialValue: _selectedOrder?.orderCode,
    fieldKey: ValueKey(_selectedOrder?.id ?? 'order-unselected'),
    displayStringForOption: (order) => order.orderCode,
    isRequired: true,
    prefixIcon: const Icon(
      Icons.person,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
    onSelected: (value) => setState(() => _selectedOrder = value),
    validator: (_) => _selectedOrder == null ? 'Select an order' : null,
    onChanged: (_) => setState(() => _selectedOrder = null),
    filterFn: (order, query) {
      return order.orderCode.toLowerCase().contains(query);
    },
  );

  Widget get _projectField =>
      _buildAutoCompleteField<CreateShipmentProjectModel>(
        labelText: 'Project',
        hintText: _shipmentViewModel.isProjectsLoading
            ? 'Loading projects...'
            : 'Search project',
        options: _shipmentViewModel.projects,
        initialValue: _selectedProject?.name,
        fieldKey: ValueKey(_selectedProject?.id ?? 'project-unselected'),
        displayStringForOption: (project) => project.name,
        isRequired: true,
        prefixIcon: const Icon(
          Icons.person,
          color: AppColors.textFieldIcon,
          size: 20,
        ),
        onSelected: _onProjectSelected,
        validator: (_) => _selectedProject == null ? 'Select a project' : null,
        onChanged: (_) => setState(() {
          _selectedProject = null;
          _selectedOrder = null;
          _selectedDriver = null;
          _driverPhoneController.clear();
          _vehicleNumberController.clear();
        }),
        filterFn: (project, query) {
          return project.name.toLowerCase().contains(query);
        },
      );

  Widget _buildDesktopLayout() {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              Column(
                spacing: 20,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(child: _projectField),
                      Expanded(child: _orderField),
                    ],
                  ),
                  if (_shipmentViewModel.error != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _shipmentViewModel.error!,
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColors.errorColor,
                        ),
                      ),
                    ),

                  if (widget.shipmentId != null) ...[
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: _address1Field),
                        Expanded(child: _address2Field),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: _cityField),
                        Expanded(child: _stateField),
                      ],
                    ),
                  ],
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(child: _driverNameField),
                      Expanded(child: _driverPhoneField),
                    ],
                  ),

                  Row(
                    spacing: 10,
                    children: [
                      Expanded(child: _vehicleNoField),
                      if (widget.shipmentId != null)
                        Expanded(child: _statusField),
                    ],
                  ),
                  if (widget.shipmentId != null)
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: _pincodeField),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  Row(
                    spacing: 10,
                    children: [
                      // Expanded(child: _addressField),
                      Expanded(child: _deliveryInstructionsField),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      child: ButtonWidget.secondary(
                        label: 'Cancel',
                        onPressed: () {
                          router.pop();
                        },
                      ),
                    ),
                    SizedBox(width: 200, child: _buildCreateButton),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _address1Field => _buildTextFormField(
    labelText: 'Address 1',
    hintText: 'Enter the first line of the address',
    isRequired: false,
    controller: _address1Controller,
  );

  Widget get _address2Field => _buildTextFormField(
    labelText: 'Address 2',
    hintText: 'Enter the second line of the address',
    isRequired: false,
    controller: _address2Controller,
  );

  Widget get _cityField => _buildTextFormField(
    labelText: 'City',
    hintText: 'Enter the city of the shipment',
    isRequired: false,
    controller: _cityController,
  );

  Widget get _stateField => _buildTextFormField(
    labelText: 'State',
    hintText: 'Enter the state of the shipment',
    isRequired: false,
    controller: _stateController,
  );

  Widget get _pincodeField => _buildTextFormField(
    labelText: 'Pincode',
    hintText: 'Enter the pincode of the shipment',
    isRequired: false,
    keyboardType: TextInputType.number,
    controller: _pincodeController,
    validator: (value) {
      final pincode = value?.trim() ?? '';
      if (pincode.isNotEmpty &&
          (pincode.length != 6 || !_containsOnlyDigits(pincode))) {
        return 'Enter a valid 6-digit pincode';
      }
      return null;
    },
  );

  Widget get _deliveryInstructionsField => _buildTextFormField(
    labelText: 'Delivery Instructions',
    hintText: 'Enter instructions for delivering this shipment',
    isRequired: false,
    maxLines: 3,
    controller: _deliveryInstructionsController,
  );

  Widget get _buildCreateButton => ButtonWidget(
    label: widget.shipmentId == null ? 'Create Shipment' : 'Update Shipment',
    onPressed: _isSubmitting ? null : _submit,
  );

  Widget _buildAutoCompleteField<T extends Object>({
    String? labelText,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    bool readOnly = false,
    GestureTapCallback? onTap,
    required List<T> options,
    TextEditingController? controller,
    required String Function(T) displayStringForOption,
    required void Function(T) onSelected,
    bool Function(T option, String query)? filterFn,
    String? initialValue,
    Key? fieldKey,
    bool isRequired = false,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
  }) {
    return AutoCompleteWidget(
      key: fieldKey,
      labelText: labelText,
      hintText: hintText,
      options: options,
      displayStringForOption: displayStringForOption,
      onSelected: onSelected,
      filterFn: filterFn,
      initialValue: initialValue,
      isRequired: isRequired,
      prefixIcon: prefixIcon,
      validator: validator,
      onChanged: onChanged,
    );
  }

  Widget _buildTextFormField({
    String? labelText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    String? hintText,
    Widget? prefixIcon,
    bool isRequired = false,
    TextEditingController? controller,
    int? maxLength,
    bool readOnly = false,
    String? Function(String?)? validator,
  }) {
    return TextFormFieldWidget(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      isRequired: isRequired,
      controller: controller,
      maxLength: maxLength,
      readOnly: readOnly,
      validator: validator,
    );
  }

  String? _requiredField(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
    }
    return null;
  }

  bool _containsOnlyDigits(String value) =>
      value.codeUnits.every((unit) => unit >= 48 && unit <= 57);

  Future<void> _onProjectSelected(CreateShipmentProjectModel project) async {
    setState(() {
      _selectedProject = project;
      _selectedOrder = null;
      _selectedDriver = null;
      _driverPhoneController.clear();
      _vehicleNumberController.clear();
    });

    await Future.wait([
      _shipmentViewModel.fetchOrders(projectId: project.id),
      _shipmentViewModel.fetchDrivers(companyId: _companyId),
    ]);
  }

  void _onDriverSelected(ShipmentDriverModel driver) {
    setState(() {
      _selectedDriver = driver;
      _driverPhoneController.text = driver.phone;
      _vehicleNumberController.text = driver.vehicleNumber;
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final status = _selectedStatus ?? ShipmentStatus.pending;
    final order = _selectedOrder;
    final driver = _selectedDriver;
    if (order == null || driver == null) return;

    String? valueOrNull(TextEditingController controller) {
      final value = controller.text.trim();
      return value.isEmpty ? null : value;
    }

    final data = <String, dynamic>{
      'orderId': order.id,
      'driverId': driver.id,
      'status': _statusApiValue(status),
      'deliveryInstructions': valueOrNull(_deliveryInstructionsController),
    };
    if (widget.shipmentId != null) {
      data.addAll({
        'deliveryAddress': valueOrNull(_address1Controller),
        'deliveryAddress2': valueOrNull(_address2Controller),
        'deliveryCity': valueOrNull(_cityController),
        'deliveryState': valueOrNull(_stateController),
        'deliveryPostalCode': valueOrNull(_pincodeController),
        'deliveryCountry':
            _shipmentViewModel.shipment?.deliveryCountry ?? 'India',
      });
    }

    setState(() => _isSubmitting = true);
    try {
      final shipmentId = widget.shipmentId;
      final succeeded = await _shipmentViewModel.saveShipment(
        shipmentId: shipmentId,
        data: data,
      );
      if (!mounted) return;

      if (succeeded) {
        router.pop(true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _shipmentViewModel.error ??
                  (shipmentId == null
                      ? 'Could not create shipment'
                      : 'Could not update shipment'),
            ),
          ),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.shipmentId == null
                ? 'Could not create shipment'
                : 'Could not update shipment',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  String _statusApiValue(ShipmentStatus status) => switch (status) {
    ShipmentStatus.pending => 'PENDING',
    ShipmentStatus.dispatched => 'DISPATCHED',
    ShipmentStatus.inTransit => 'IN_TRANSIT',
    ShipmentStatus.delivered => 'DELIVERED',
    ShipmentStatus.cancelled => 'CANCELLED',
    ShipmentStatus.unknown => 'UNKNOWN',
  };

  @override
  void dispose() {
    _driverPhoneController.dispose();
    _vehicleNumberController.dispose();
    _address1Controller.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
    _deliveryInstructionsController.dispose();
    _shipmentViewModel.dispose();
    super.dispose();
  }
}
