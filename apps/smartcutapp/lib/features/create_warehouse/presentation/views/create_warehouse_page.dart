import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/factories/data/models/factory_model.dart';
import 'package:board_cut/features/factories/domain/usecases/get_factories.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';
import 'package:board_cut/features/warehouses/domain/usecases/save_warehouse.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateWarehousePage extends BaseStatefulScreen {
  const CreateWarehousePage({super.key, this.warehouse});

  final WarehouseModel? warehouse;

  @override
  BaseState<CreateWarehousePage> createState() => _CreateWarehousePageState();
}

class _CreateWarehousePageState extends BaseState<CreateWarehousePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  final _getFactories = sl<GetFactories>();
  final _saveWarehouse = sl<SaveWarehouse>();
  List<FactoryModel> _factories = [];
  FactoryModel? _selectedFactory;
  WarehouseStatus _status = WarehouseStatus.active;
  bool _isLoadingFactories = true;
  bool _isSaving = false;
  String? _factoryError;
  String? _saveError;

  bool get _isEditing => widget.warehouse != null;

  @override
  void initState() {
    super.initState();
    final warehouse = widget.warehouse;
    if (warehouse != null) {
      _nameController.text = warehouse.name;
      _contactController.text = warehouse.contactName ?? '';
      _emailController.text = warehouse.contactEmail ?? '';
      _phoneController.text = warehouse.contactPhone ?? '';
      _locationController.text = warehouse.location ?? '';
      _status = warehouse.status;
    }
    _loadFactories();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _loadFactories() async {
    final result = await _getFactories();
    if (!mounted) return;
    result.match((failure) => _factoryError = failure.message, (factories) {
      _factories = factories;
      final factoryId = widget.warehouse?.factoryId;
      for (final factory in factories) {
        if (factory.id == factoryId) {
          _selectedFactory = factory;
          break;
        }
      }
      if (factoryId != null && _selectedFactory == null) {
        _factoryError = 'The warehouse factory is not available.';
      }
    });
    setState(() => _isLoadingFactories = false);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final factoryId = _selectedFactory?.id ?? widget.warehouse?.factoryId;
    if (factoryId == null) {
      setState(() => _factoryError = 'Select a factory.');
      return;
    }

    setState(() {
      _isSaving = true;
      _saveError = null;
    });

    final data = <String, dynamic>{
      'factoryId': factoryId,
      'name': _nameController.text.trim(),
      'location': _locationController.text.trim(),
      'contactName': _contactController.text.trim(),
      'contactPhone': _phoneController.text.trim(),
      'contactEmail': _emailController.text.trim(),
    };
    data.removeWhere(
      (key, value) =>
          key != 'factoryId' && key != 'name' && (value as String).isEmpty,
    );
    if (_isEditing) {
      data['status'] = switch (_status) {
        WarehouseStatus.active => 'ACTIVE',
        WarehouseStatus.inActive => 'INACTIVE',
        WarehouseStatus.underMaintenance => 'UNDER_MAINTENANCE',
      };
    } else {
      data['companyId'] = _selectedFactory!.companyId;
    }

    try {
      final result = _isEditing
          ? await _saveWarehouse.update(
              warehouseId: widget.warehouse!.id,
              data: data,
            )
          : await _saveWarehouse.create(data: data);

      if (!mounted) return;
      result.match((failure) => setState(() => _saveError = failure.message), (
        response,
      ) {
        if (response.success) {
          Navigator.of(context).pop(true);
        } else {
          setState(() => _saveError = response.message);
        }
      });
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          width: isSmallScreen ? double.maxFinite : AppSize.dialogWidth,
          height: ResponsiveHelper.determineDialogHeight(screenType),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: AppColors.surface,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DialogHeaderWidget(
                  title: _isEditing
                      ? 'Update Warehouse'
                      : 'Create New Warehouse',
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      if (isSmallScreen) ...[
                        _factoryField,
                        const SizedBox(height: 14),
                        _nameField,
                        const SizedBox(height: 14),
                        _contactField,
                        const SizedBox(height: 14),
                        _emailField,
                        const SizedBox(height: 14),
                        _phoneField,
                        const SizedBox(height: 14),
                        _locationField,
                        if (_isEditing) ...[
                          const SizedBox(height: 14),
                          _statusField,
                        ],
                      ] else ...[
                        Row(
                          children: [
                            Expanded(child: _factoryField),
                            const SizedBox(width: 14),
                            Expanded(child: _nameField),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(child: _contactField),
                            const SizedBox(width: 14),
                            Expanded(child: _emailField),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _phoneField),
                            const SizedBox(width: 14),
                            Expanded(child: _locationField),
                          ],
                        ),
                        if (_isEditing) ...[
                          const SizedBox(height: 14),
                          _statusField,
                        ],
                      ],
                      if (_saveError != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          _saveError!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 140,
                      child: ButtonWidget.secondary(
                        label: 'Cancel',
                        onPressed: _isSaving
                            ? null
                            : () => Navigator.of(context).pop(false),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 180,
                      child: ButtonWidget.primary(
                        label: _isSaving
                            ? 'Saving...'
                            : _isEditing
                            ? 'Save Changes'
                            : 'Create Warehouse',
                        onPressed: _isSaving ? null : _save,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _factoryField {
    if (_isLoadingFactories) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (_factoryError != null && _factories.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_factoryError!, style: const TextStyle(color: Colors.red)),
          TextButton(
            onPressed: () {
              setState(() {
                _isLoadingFactories = true;
                _factoryError = null;
              });
              _loadFactories();
            },
            child: const Text('Retry'),
          ),
        ],
      );
    }
    if (_factories.isEmpty) {
      return const Text(
        'No factories are available. Create a factory before adding a warehouse.',
        style: TextStyle(color: Colors.red),
      );
    }
    return AutoCompleteWidget<FactoryModel>(
      labelText: 'Factory',
      hintText: 'Select a factory',
      options: _factories,
      initialValue: _selectedFactory == null
          ? null
          : '${_selectedFactory!.name} (${_selectedFactory!.code})',
      displayStringForOption: (factory) => '${factory.name} (${factory.code})',
      onSelected: (factory) {
        setState(() {
          _selectedFactory = factory;
          _factoryError = null;
        });
      },
      onChanged: (value) {
        if (_selectedFactory != null &&
            value != '${_selectedFactory!.name} (${_selectedFactory!.code})') {
          setState(() => _selectedFactory = null);
        }
      },
      isRequired: true,
      validator: (_) =>
          _selectedFactory == null ? 'Select a factory from the list.' : null,
    );
  }

  Widget get _nameField => TextFormFieldWidget(
    labelText: 'Name',
    hintText: 'Enter warehouse name',
    controller: _nameController,
    isRequired: true,
    maxLength: 100,
    validator: (value) {
      final name = value?.trim() ?? '';
      if (name.length < 2) return 'Enter at least 2 characters.';
      if (name.length > 100) return 'Name cannot exceed 100 characters.';
      return null;
    },
  );

  Widget get _contactField => TextFormFieldWidget(
    labelText: 'Contact Person',
    hintText: 'Enter contact person name',
    controller: _contactController,
    maxLength: 100,
  );

  Widget get _emailField => TextFormFieldWidget(
    labelText: 'Email',
    hintText: 'Enter contact email',
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    maxLength: 100,
    validator: (value) {
      final email = value?.trim() ?? '';
      if (email.isNotEmpty &&
          !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
        return 'Enter a valid email address.';
      }
      return null;
    },
  );

  Widget get _phoneField => TextFormFieldWidget(
    labelText: 'Phone',
    hintText: 'Enter contact phone',
    controller: _phoneController,
    keyboardType: TextInputType.phone,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(10),
    ],
    maxLength: 10,
    validator: (value) {
      final phone = value?.trim() ?? '';
      if (phone.isNotEmpty && phone.length != 10) {
        return 'Phone number must be 10 digits.';
      }
      return null;
    },
  );

  Widget get _locationField => TextFormFieldWidget(
    labelText: 'Address',
    hintText: 'Enter warehouse address',
    controller: _locationController,
    maxLines: 2,
    maxLength: 255,
  );

  Widget get _statusField => AutoCompleteWidget<WarehouseStatus>(
    labelText: 'Status',
    hintText: 'Select status',
    options: WarehouseStatus.values,
    initialValue: _statusLabel(_status),
    displayStringForOption: _statusLabel,
    onSelected: (status) => setState(() => _status = status),
    isRequired: true,
    validator: (value) => _statusLabel(_status) == value
        ? null
        : 'Select a status from the list.',
  );

  String _statusLabel(WarehouseStatus status) => switch (status) {
    WarehouseStatus.active => 'Active',
    WarehouseStatus.inActive => 'Inactive',
    WarehouseStatus.underMaintenance => 'Under Maintenance',
  };
}
