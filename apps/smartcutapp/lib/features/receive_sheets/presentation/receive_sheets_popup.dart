import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/physical_sheets/physical_sheets_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

Future<void> showReceiveSheetsPopup(
  BuildContext context,
  PhysicalSheetsViewModel viewModel,
) async {
  if (viewModel.materials.isEmpty || viewModel.warehouses.isEmpty) {
    await viewModel.load();
  }
  if (!context.mounted) return;
  final width = TextEditingController();
  final height = TextEditingController();
  final quantity = TextEditingController(text: '1');
  String? materialId = viewModel.materials.firstOrNull?.id;
  String? warehouseId = viewModel.warehouses.firstOrNull?.id;
  final form = GlobalKey<FormState>();
  final screenType = ResponsiveHelper.getScreenType(context);
  final isSmall = screenType != ScreenType.desktop;
  final saved = await PhysicalSheetFormPageRoute(
    (ctx) => StatefulBuilder(
      builder: (ctx, refresh) => Scaffold(
        backgroundColor: AppColors.transparent,
        body: Center(
          child: Container(
            width: isSmall ? double.maxFinite : AppSize.dialogWidth,
            height: _dialogHeight(ctx, screenType),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            child: Column(
              children: [
                DialogHeaderWidget(
                  title: 'Receive Full Sheets',
                  onClose: () => Navigator.of(ctx).pop(false),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Form(
                    key: form,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AutoCompleteWidget(
                                  labelText: 'Material',
                                  hintText: 'Select material',
                                  options: viewModel.materials,
                                  displayStringForOption: (material) =>
                                      material.name,
                                  initialValue: viewModel.materials
                                      .where(
                                        (material) => material.id == materialId,
                                      )
                                      .firstOrNull
                                      ?.name,
                                  onSelected: (material) =>
                                      refresh(() => materialId = material.id),
                                  onChanged: (_) =>
                                      refresh(() => materialId = null),
                                  isRequired: true,
                                  validator: (_) => materialId == null
                                      ? 'Select a material'
                                      : null,
                                  prefixIcon: const Icon(
                                    Icons.category_outlined,
                                    color: AppColors.textFieldIcon,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                AutoCompleteWidget(
                                  labelText: 'Warehouse',
                                  hintText: 'Select warehouse',
                                  options: viewModel.warehouses,
                                  displayStringForOption: (warehouse) =>
                                      warehouse.name,
                                  initialValue: viewModel.warehouses
                                      .where(
                                        (warehouse) =>
                                            warehouse.id == warehouseId,
                                      )
                                      .firstOrNull
                                      ?.name,
                                  onSelected: (warehouse) =>
                                      refresh(() => warehouseId = warehouse.id),
                                  onChanged: (_) =>
                                      refresh(() => warehouseId = null),
                                  isRequired: true,
                                  validator: (_) => warehouseId == null
                                      ? 'Select a warehouse'
                                      : null,
                                  prefixIcon: const Icon(
                                    Icons.warehouse_outlined,
                                    color: AppColors.textFieldIcon,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                if (isSmall) ...[
                                  _number(width, 'Width (mm)'),
                                  const SizedBox(height: 12),
                                  _number(height, 'Height (mm)'),
                                  const SizedBox(height: 12),
                                  _number(quantity, 'Quantity'),
                                ] else
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: _number(width, 'Width (mm)'),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: _number(height, 'Height (mm)'),
                                      ),
                                    ],
                                  ),
                                if (!isSmall) ...[
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    child: _number(quantity, 'Quantity'),
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
                              onPressed: () => Navigator.pop(ctx, false),
                            ),
                            const SizedBox(width: 10),
                            ButtonWidget.primary(
                              label: 'Receive sheets',
                              onPressed: () {
                                if (form.currentState!.validate() &&
                                    materialId != null &&
                                    warehouseId != null) {
                                  Navigator.pop(ctx, true);
                                }
                              },
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
        ),
      ),
    ),
  ).push<bool>(context);
  if (saved == true && materialId != null && warehouseId != null) {
    final error = await viewModel.createFull({
      'materialId': materialId,
      'warehouseId': warehouseId,
      'width': double.parse(width.text),
      'height': double.parse(height.text),
      'quantity': int.parse(quantity.text),
    });
    if (context.mounted && error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    }
  }
  width.dispose();
  height.dispose();
  quantity.dispose();
}

Widget _number(TextEditingController controller, String label) =>
    TextFormFieldWidget(
      controller: controller,
      labelText: label,
      hintText: '0',
      keyboardType: TextInputType.number,
      isRequired: true,
      validator: (value) {
        final number = num.tryParse(value ?? '');
        return number == null || number <= 0
            ? 'Enter a value greater than zero.'
            : null;
      },
    );

double _dialogHeight(BuildContext context, ScreenType screenType) {
  final size = MediaQuery.sizeOf(context);
  final available =
      (size.height - MediaQuery.viewInsetsOf(context).vertical - 32).clamp(
        320.0,
        size.height,
      );
  return math.min(
    ResponsiveHelper.determineDialogHeight(screenType),
    available,
  );
}
