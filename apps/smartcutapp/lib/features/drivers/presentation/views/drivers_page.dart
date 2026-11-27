import 'dart:async';
import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/drivers/presentation/viewmodels/drivers_view_model.dart';
import 'package:board_cut/features/drivers/data/models/driver_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriversPage extends BaseStatefulScreen {
  const DriversPage({super.key});

  @override
  BaseState<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends BaseState<DriversPage> {
  late final DriversViewModel vm = sl<DriversViewModel>()..load();
  final search = TextEditingController();
  Timer? _searchTimer;

  @override
  void dispose() {
    _searchTimer?.cancel();
    search.dispose();
    vm.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) vm.load(page: 1, search: value.trim());
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final desiredLimit = screenType == ScreenType.desktop ? 8 : 5;
    if (vm.limit != desiredLimit) {
      vm.limit = desiredLimit;
      vm.load(page: 1);
    }
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<DriversViewModel>(
        builder: (context, model, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RecordListToolbar(
                    title: 'Drivers',
                    subtitle:
                        'Manage company drivers and their assigned vehicles.',
                    description: 'Driver records are scoped to your company.',
                    searchController: search,
                    searchHint: 'Search drivers...',
                    onSearchChanged: _onSearchChanged,
                    statusOptions: const [],
                    selectedStatus: '',
                    onStatusChanged: (_) {},
                    onClear: () {
                      search.clear();
                      _searchTimer?.cancel();
                      model.load(page: 1, search: '');
                    },
                    action: ButtonWidget.primary(
                      label: 'Add driver',
                      icon: Icons.add,
                      iconPosition: IconPosition.left,
                      onPressed: () => _edit(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (model.error != null)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(model.error!),
                      ),
                    ),
                  if (model.isLoading && model.drivers.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(48),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (model.drivers.isEmpty)
                    EmptyStateWidget(
                      title: model.search.isEmpty
                          ? 'No drivers added yet'
                          : 'No drivers match your search',
                      description: model.search.isEmpty
                          ? 'Add a driver to manage your deliveries.'
                          : 'Try a different search term or clear your search.',
                      icon: model.search.isEmpty
                          ? Icons.local_shipping_outlined
                          : Icons.search_off_outlined,
                    )
                  else
                    DataTableWidget(
                      rowsPerPage: model.limit,
                      sortAscending: true,
                      columns: const [
                        DataColumn(label: TableHeader(label: 'DRIVER')),
                        DataColumn(label: TableHeader(label: 'PHONE')),
                        DataColumn(label: TableHeader(label: 'VEHICLE')),
                        DataColumn(label: TableHeader(label: 'LICENSE')),
                        DataColumn(label: TableHeader(label: 'STATUS')),
                        DataColumn(label: TableHeader(label: 'ACTION')),
                      ],
                      dataSource: _DriverTableSource(
                        rows: model.drivers,
                        total: model.total,
                        page: model.page,
                        limit: model.limit,
                        buildRow: (d) => DataRow(
                          cells: [
                            DataCell(TableValue(label: d.name)),
                            DataCell(TableValue(label: d.phone)),
                            DataCell(
                              TableValue(
                                label: '${d.vehicleType} • ${d.vehicleNumber}',
                              ),
                            ),
                            DataCell(TableValue(label: d.licenseNo)),
                            DataCell(TableStatusValue(label: d.status)),
                            DataCell(
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    tooltip: 'Edit',
                                    icon: const Icon(Icons.edit_outlined),
                                    onPressed: () => _edit(d),
                                  ),
                                  IconButton(
                                    tooltip: 'Delete',
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () async {
                                      final error = await vm.remove(d.id);
                                      if (error != null && context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                              SnackBar(content: Text(error)),
                                            );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPageChanged: (start) {
                        final next = start ~/ model.limit + 1;
                        if (next != model.page && next <= model.totalPages) {
                          model.load(page: next);
                        }
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _edit([DriverModel? driver]) async {
    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => _DriverFormDialog(
        driver: driver,
        onSave: (data) => vm.save(data, id: driver?.id),
      ),
    );
    if (saved == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(driver == null ? 'Driver created.' : 'Driver updated.'),
        ),
      );
    }
  }
}

class _DriverFormDialog extends StatefulWidget {
  const _DriverFormDialog({required this.onSave, this.driver});

  final DriverModel? driver;
  final Future<String?> Function(Map<String, dynamic> data) onSave;

  @override
  State<_DriverFormDialog> createState() => _DriverFormDialogState();
}

class _DriverFormDialogState extends State<_DriverFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.driver?.name);
  late final _phone = TextEditingController(text: widget.driver?.phone);
  late final _email = TextEditingController(text: widget.driver?.email);
  late final _license = TextEditingController(text: widget.driver?.licenseNo);
  late final _vehicle = TextEditingController(
    text: widget.driver?.vehicleNumber,
  );
  late String _vehicleType = widget.driver?.vehicleType ?? 'TRUCK';
  late String _status = widget.driver?.status ?? 'ACTIVE';
  bool _isSaving = false;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    _license.dispose();
    _vehicle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveHelper.getScreenType(context);
    final isSmall = screenType != ScreenType.desktop;
    final size = MediaQuery.sizeOf(context);
    final availableHeight =
        (size.height - MediaQuery.viewInsetsOf(context).vertical - 32).clamp(
          320.0,
          size.height,
        );
    final height = math.min(
      ResponsiveHelper.determineDialogHeight(screenType),
      availableHeight,
    );
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.all(isSmall ? 12 : 40),
      child: Container(
        width: isSmall ? double.maxFinite : AppSize.dialogWidth,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DialogHeaderWidget(
              title: widget.driver == null ? 'Add Driver' : 'Update Driver',
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _twoFields(isSmall, _nameField(), _phoneField()),
                            const SizedBox(height: 16),
                            _twoFields(isSmall, _emailField(), _licenseField()),
                            const SizedBox(height: 16),
                            _twoFields(
                              isSmall,
                              _vehicleField(),
                              _vehicleTypeField(),
                            ),
                            const SizedBox(height: 16),
                            _statusField(),
                            if (_error != null) ...[
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _error!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonWidget.secondary(
                          label: 'Cancel',
                          onPressed: _isSaving
                              ? null
                              : () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 10),
                        ButtonWidget.primary(
                          label: _isSaving
                              ? 'Saving...'
                              : (widget.driver == null
                                    ? 'Create Driver'
                                    : 'Save changes'),
                          onPressed: _isSaving ? null : _submit,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _twoFields(bool isSmall, Widget first, Widget second) => isSmall
      ? Column(children: [first, const SizedBox(height: 14), second])
      : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: first),
            const SizedBox(width: 16),
            Expanded(child: second),
          ],
        );

  Widget _nameField() => TextFormFieldWidget(
    controller: _name,
    labelText: 'Name',
    hintText: 'Enter driver name',
    isRequired: true,
    maxLength: 100,
    validator: (value) =>
        (value?.trim().length ?? 0) < 2 ? 'Enter at least 2 characters.' : null,
  );

  Widget _phoneField() => TextFormFieldWidget(
    controller: _phone,
    labelText: 'Phone',
    hintText: 'Enter phone number',
    keyboardType: TextInputType.phone,
    isRequired: true,
    validator: (value) {
      final phone = value?.trim() ?? '';
      if (phone.isEmpty) return 'Enter a valid phone number.';
      if (phone.length != 10 || !RegExp(r'^\d{10}$').hasMatch(phone)) {
        return 'Enter a valid 10-digit phone number.';
      }
      return null;
    },
  );

  Widget _emailField() => TextFormFieldWidget(
    controller: _email,
    labelText: 'Email',
    hintText: 'Optional',
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      final email = value?.trim() ?? '';
      return email.isEmpty || email.contains('@')
          ? null
          : 'Enter a valid email.';
    },
  );

  Widget _licenseField() => TextFormFieldWidget(
    controller: _license,
    labelText: 'License number',
    hintText: 'Enter license number',
    isRequired: true,
    validator: (value) =>
        (value?.trim().length ?? 0) < 2 ? 'Enter a license number.' : null,
  );

  Widget _vehicleField() => TextFormFieldWidget(
    controller: _vehicle,
    labelText: 'Vehicle number',
    hintText: 'Enter vehicle number',
    isRequired: true,
    validator: (value) =>
        (value?.trim().length ?? 0) < 2 ? 'Enter a vehicle number.' : null,
  );

  Widget _vehicleTypeField() => _enumField(
    label: 'Vehicle type',
    value: _vehicleType,
    options: const [
      ('BIKE', 'Bike'),
      ('SCOOTER', 'Scooter'),
      ('CAR', 'Car'),
      ('PICKUP', 'Pickup'),
      ('TRUCK', 'Truck'),
      ('TEMPO', 'Tempo'),
    ],
    onChanged: (value) => setState(() => _vehicleType = value),
  );

  Widget _statusField() => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: AutoCompleteWidget<String>(
      labelText: 'Status',
      hintText: 'Select status',
      options: const ['ACTIVE', 'INACTIVE', 'ON_LEAVE'],
      displayStringForOption: _statusLabel,
      initialValue: _statusLabel(_status),
      isRequired: true,
      validator: (value) =>
          const [
            'ACTIVE',
            'INACTIVE',
            'ON_LEAVE',
          ].contains(value == null ? null : _statusValue(value))
          ? null
          : 'Select a valid status',
      onSelected: (value) => setState(() => _status = value),
    ),
  );

  String _statusLabel(String status) => switch (status) {
    'ACTIVE' => 'Active',
    'INACTIVE' => 'Inactive',
    'ON_LEAVE' => 'On leave',
    _ => status,
  };

  String _statusValue(String label) => switch (label.toLowerCase()) {
    'active' => 'ACTIVE',
    'inactive' => 'INACTIVE',
    'on leave' => 'ON_LEAVE',
    _ => label,
  };

  Widget _enumField({
    required String label,
    required String value,
    required List<(String, String)> options,
    required ValueChanged<String> onChanged,
  }) => AutoCompleteWidget<(String, String)>(
    labelText: label,
    hintText: 'Select ${label.toLowerCase()}',
    options: options,
    displayStringForOption: (option) => option.$2,
    initialValue: _labelFor(options, value),
    isRequired: true,
    validator: (text) =>
        options.any(
          (option) => option.$2.toLowerCase() == text?.trim().toLowerCase(),
        )
        ? null
        : 'Select a valid ${label.toLowerCase()}.',
    onChanged: (text) {
      final match = options
          .where(
            (option) => option.$2.toLowerCase() == text.trim().toLowerCase(),
          )
          .firstOrNull;
      onChanged(match?.$1 ?? '');
    },
    onSelected: (option) => onChanged(option.$1),
  );

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSaving = true;
      _error = null;
    });
    final error = await widget.onSave({
      'name': _name.text.trim(),
      'phone': _phone.text.trim(),
      if (_email.text.trim().isNotEmpty) 'email': _email.text.trim(),
      'licenseNo': _license.text.trim(),
      'vehicleNumber': _vehicle.text.trim(),
      'vehicleType': _vehicleType,
      'status': _status,
    });
    if (!mounted) return;
    if (error == null) {
      Navigator.pop(context, true);
    } else {
      setState(() {
        _isSaving = false;
        _error = error;
      });
    }
  }
}

String _labelFor(List<(String, String)> options, String value) => options
    .firstWhere((option) => option.$1 == value, orElse: () => (value, value))
    .$2;

class _DriverTableSource extends DataTableSource {
  _DriverTableSource({
    required this.rows,
    required this.total,
    required this.page,
    required this.limit,
    required this.buildRow,
  });

  final List<DriverModel> rows;
  final int total, page, limit;
  final DataRow Function(DriverModel) buildRow;

  @override
  DataRow? getRow(int index) {
    final local = index - (page - 1) * limit;
    return local >= 0 && local < rows.length
        ? DataRow.byIndex(index: index, cells: buildRow(rows[local]).cells)
        : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => total;

  @override
  int get selectedRowCount => 0;
}
