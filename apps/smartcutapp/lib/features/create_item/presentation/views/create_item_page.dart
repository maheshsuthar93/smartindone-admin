import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_item/presentation/viewmodels/create_item_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateItemPage extends BaseStatefulScreen {
  const CreateItemPage({super.key, this.orderId, this.itemId, this.onSaved});

  final String? orderId;
  final String? itemId;
  final Future<void> Function()? onSaved;

  @override
  BaseState<CreateItemPage> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends BaseState<CreateItemPage> {
  final _viewModel = sl<CreateItemViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _quantity = TextEditingController();
  final _width = TextEditingController();
  final _height = TextEditingController();
  final _depth = TextEditingController();
  String _allocationStrategy = 'AUTO';
  bool _formInitialized = false;

  bool get _isEditing => widget.itemId != null;

  @override
  void initState() {
    super.initState();
    final itemId = widget.itemId;
    if (itemId != null) _loadItem(itemId);
  }

  Future<void> _loadItem(String itemId) async {
    await _viewModel.fetchItem(itemId);
    final item = _viewModel.item;
    if (!mounted || item == null) return;
    _name.text = item.name;
    _quantity.text = item.quantity.toString();
    _width.text = item.overallWidth?.toString() ?? '';
    _height.text = item.overallHeight?.toString() ?? '';
    _depth.text = item.overallDepth?.toString() ?? '';
    _allocationStrategy = item.allocationStrategy;
    setState(() => _formInitialized = true);
  }

  @override
  void dispose() {
    _name.dispose();
    _quantity.dispose();
    _width.dispose();
    _height.dispose();
    _depth.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<CreateItemViewModel>(
        builder: (context, vm, _) {
          if (vm.saved) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _finishSave();
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
                child: vm.isLoading && _isEditing && !_formInitialized
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DialogHeaderWidget(
                              title: _isEditing ? 'Update Item' : 'New Item',
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        _fieldRow([
                                          _textField(_name, 'Item Name'),
                                          _numberField(
                                            _quantity,
                                            'Quantity',
                                            integer: true,
                                          ),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        _fieldRow([
                                          _allocationField(),
                                          _numberField(_width, 'Overall Width'),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        _fieldRow([
                                          _numberField(
                                            _height,
                                            'Overall Height',
                                          ),
                                          _numberField(_depth, 'Overall Depth'),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: isSmallScreen
                                    ? MainAxisSize.max
                                    : MainAxisSize.min,
                                spacing: 10,
                                children: [
                                  if (isSmallScreen)
                                    Expanded(
                                      child: ButtonWidget.secondary(
                                        label: 'Cancel',
                                        onPressed: router.pop,
                                      ),
                                    )
                                  else
                                    SizedBox(
                                      width: 160,
                                      child: ButtonWidget.secondary(
                                        label: 'Cancel',
                                        onPressed: router.pop,
                                      ),
                                    ),
                                  if (isSmallScreen)
                                    Expanded(
                                      child: ButtonWidget(
                                        label: vm.isLoading
                                            ? 'Saving...'
                                            : _isEditing
                                            ? 'Update Item'
                                            : 'Create Item',
                                        onPressed: vm.isLoading
                                            ? null
                                            : _submit,
                                      ),
                                    )
                                  else
                                    SizedBox(
                                      width: 180,
                                      child: ButtonWidget(
                                        label: vm.isLoading
                                            ? 'Saving...'
                                            : _isEditing
                                            ? 'Update Item'
                                            : 'Create Item',
                                        onPressed: vm.isLoading
                                            ? null
                                            : _submit,
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
          );
        },
      ),
    );
  }

  Future<void> _finishSave() async {
    if (!mounted) return;
    await widget.onSaved?.call();
    if (mounted) router.pop(true);
  }

  Widget _fieldRow(List<Widget> fields, bool isSmallScreen) {
    // if (isSmallScreen) {
    //   return Column(
    //     children: [
    //       for (var i = 0; i < fields.length; i++) ...[
    //         if (i > 0) const SizedBox(height: 16),
    //         fields[i],
    //       ],
    //     ],
    //   );
    // }
    return Row(
      children: [
        for (var i = 0; i < fields.length; i++) ...[
          if (i > 0) const SizedBox(width: 12),
          Expanded(child: fields[i]),
        ],
      ],
    );
  }

  Widget _textField(TextEditingController controller, String label) =>
      TextFormFieldWidget(
        controller: controller,
        labelText: label,
        hintText: 'Enter $label',
        prefixIcon: const Icon(
          Icons.label_outline,
          color: AppColors.textFieldIcon,
          size: 20,
        ),
        isRequired: true,
        validator: (value) =>
            value == null || value.trim().isEmpty ? '$label is required' : null,
      );

  Widget _numberField(
    TextEditingController controller,
    String label, {
    bool integer = false,
  }) => TextFormFieldWidget(
    controller: controller,
    labelText: label,
    hintText: 'Enter $label',
    keyboardType: TextInputType.numberWithOptions(decimal: !integer),
    prefixIcon: const Icon(
      Icons.straighten,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
    isRequired: label == 'Quantity',
    validator: (value) {
      if (label == 'Quantity') {
        final parsed = int.tryParse(value ?? '');
        if (parsed == null || parsed < 1) return '$label must be at least 1';
      }
      if (value != null && value.isNotEmpty) {
        final parsed = double.tryParse(value);
        if (parsed == null) return 'Enter a valid number';
        if (!integer && parsed <= 0) return '$label must be greater than 0';
      }
      return null;
    },
  );

  Widget _allocationField() => AutoCompleteWidget<String>(
    labelText: 'Allocation Strategy',
    hintText: 'Select allocation strategy',
    options: Constants.allocationStrategy,
    displayStringForOption: (value) => value,
    initialValue: _allocationStrategy,
    isRequired: true,
    prefixIcon: const Icon(
      Icons.tune,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
    filterFn: (value, query) => value.toLowerCase().contains(query),
    validator: (value) => Constants.allocationStrategy.contains(value)
        ? null
        : 'Select a valid allocation strategy',
    onChanged: (value) => setState(() => _allocationStrategy = value),
    onSelected: (value) => setState(() => _allocationStrategy = value),
  );

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final orderId = _viewModel.item?.orderId ?? widget.orderId;
    if (orderId == null) return;
    final width = double.tryParse(_width.text);
    final height = double.tryParse(_height.text);
    final depth = double.tryParse(_depth.text);
    await _viewModel.saveItem(
      itemId: widget.itemId,
      data: {
        'orderId': orderId,
        'name': _name.text.trim(),
        'quantity': int.parse(_quantity.text),
        'allocationStrategy': _allocationStrategy,
        'overallWidth': width,
        'overallHeight': height,
        'overallDepth': depth,
      },
    );
  }
}
