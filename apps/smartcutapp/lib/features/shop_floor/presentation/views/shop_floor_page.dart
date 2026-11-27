import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/shop_floor/presentation/view_models/shop_floor_view_model.dart';
import 'package:board_cut/features/piece_detail/data/model/selected_piece_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class ShopFloorPage extends BaseStatefulScreen {
  const ShopFloorPage({super.key});

  @override
  BaseState<ShopFloorPage> createState() => _ShopFloorPageState();
}

class _ShopFloorPageState extends BaseState<ShopFloorPage> {
  late final ShopFloorViewModel _viewModel;
  final _codeController = TextEditingController();
  final _codeFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _viewModel = sl<ShopFloorViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && MediaQuery.sizeOf(context).width >= 600) {
        _codeFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _codeFocusNode.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _openCameraScanner() async {
    var handled = false;
    final code = await showDialog<String>(
      context: context,
      builder: (dialogContext) => Dialog(
        child: SizedBox(
          width: 520,
          height: 440,
          child: Stack(
            fit: StackFit.expand,
            children: [
              MobileScanner(
                onDetect: (capture) {
                  if (handled) return;
                  for (final barcode in capture.barcodes) {
                    final value = barcode.rawValue?.trim();
                    if (value != null && value.isNotEmpty) {
                      handled = true;
                      Navigator.of(dialogContext).pop(value);
                      break;
                    }
                  }
                },
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton.filledTonal(
                  tooltip: 'Close scanner',
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              const Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Point the camera at the barcode on a piece label.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (!mounted || code == null) return;
    _codeController.text = code;
    await _viewModel.findPiece(code);
    if (mounted && MediaQuery.sizeOf(context).width >= 600) {
      _codeFocusNode.requestFocus();
    }
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmall = screenType != ScreenType.desktop;
    return ChangeNotifierProvider<ShopFloorViewModel>.value(
      value: _viewModel,
      child: Consumer<ShopFloorViewModel>(
        builder: (context, vm, _) => SingleChildScrollView(
          padding: EdgeInsets.all(isSmall ? 12 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Shop Floor',
                style: AppTextStyle.titleSmall
                    .responsive(context)
                    .semiBold
                    .copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 4),
              Text(
                'Scan a piece label to view its production details and update its operations.',
                style: AppTextStyle.bodySmall
                    .responsive(context)
                    .regular
                    .copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              _scanCard(context, vm),
              if (vm.error != null) ...[
                const SizedBox(height: 12),
                _messageCard(context, vm.error!, isError: true),
              ],
              if (vm.isLookingUp) ...[
                const SizedBox(height: 24),
                const Center(child: CircularProgressIndicator()),
              ] else if (vm.piece != null) ...[
                const SizedBox(height: 16),
                _pieceCard(context, vm, isSmall: isSmall),
              ] else if (vm.error == null) ...[
                const SizedBox(height: 20),
                const EmptyStateWidget(
                  title: 'Ready to scan',
                  description: 'Use the camera or a handheld barcode scanner. You can also type the piece code.',
                  icon: Icons.qr_code_scanner,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _scanCard(BuildContext context, ShopFloorViewModel vm) => Card(
    color: AppColors.surfaceColor,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final controls = Row(
            children: [
              Expanded(child: _pieceCodeField(vm)),
              const SizedBox(width: 8),
              IconButton.filledTonal(
                tooltip: 'Scan with camera',
                onPressed: vm.isLookingUp ? null : _openCameraScanner,
                icon: const Icon(Icons.photo_camera_outlined),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: vm.isLookingUp
                    ? null
                    : () => vm.findPiece(_codeController.text),
                child: const Text('Find'),
              ),
            ],
          );

          if (constraints.maxWidth < 620) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _pieceCodeField(vm),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: vm.isLookingUp ? null : _openCameraScanner,
                        icon: const Icon(Icons.photo_camera_outlined),
                        label: const Text('Scan label'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: vm.isLookingUp
                          ? null
                          : () => vm.findPiece(_codeController.text),
                      child: const Text('Find'),
                    ),
                  ],
                ),
              ],
            );
          }

          return controls;
        },
      ),
    ),
  );

  Widget _pieceCard(
    BuildContext context,
    ShopFloorViewModel vm, {
    required bool isSmall,
  }) {
    final piece = vm.piece!;
    final completedCount = piece.processes
        .where((process) => process.status == ProcessStatus.completed)
        .length;
    final progress = piece.processes.isEmpty
        ? 0.0
        : completedCount / piece.processes.length;

    return Card(
      color: AppColors.surfaceColor,
      child: Padding(
        padding: EdgeInsets.all(isSmall ? 14 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  ),
                  child: Icon(
                    Icons.view_in_ar_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        piece.pieceCode ?? 'Piece',
                        style: AppTextStyle.titleXSmall
                            .responsive(context)
                            .semiBold
                            .copyWith(color: AppColors.textPrimary),
                      ),
                      Text(
                        piece.partName ?? 'Part details',
                        style: AppTextStyle.labelSmall
                            .responsive(context)
                            .regular
                            .copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Clear piece',
                  onPressed: () {
                    _codeController.clear();
                    vm.clearPiece();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _detailChip(
                  context,
                  Icons.receipt_long_outlined,
                  'Order ${piece.orderCode ?? '—'}',
                ),
                _detailChip(
                  context,
                  Icons.layers_outlined,
                  piece.materialName ?? 'Material unavailable',
                ),
                _detailChip(
                  context,
                  Icons.straighten_outlined,
                  '${piece.width} × ${piece.height} × ${piece.thickness} mm',
                ),
                _detailChip(
                  context,
                  Icons.grain,
                  piece.part.grain
                      ? 'Grain ${piece.part.grainDirection.label}'
                      : 'No grain constraint',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Operations',
                    style: AppTextStyle.labelLarge
                        .responsive(context)
                        .semiBold
                        .copyWith(color: AppColors.textPrimary),
                  ),
                ),
                Text(
                  '$completedCount / ${piece.processes.length} complete',
                  style: AppTextStyle.labelSmall
                      .responsive(context)
                      .regular
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: AppColors.dividerColor,
                color: AppColors.completedColor,
              ),
            ),
            const SizedBox(height: 12),
            if (piece.processes.isEmpty)
              _messageCard(
                context,
                'No operations are assigned to this piece.',
                isError: false,
              )
            else
              ...List.generate(
                piece.processes.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _operationCard(
                    context,
                    vm,
                    piece.processes[index],
                    canStart:
                        index == 0 ||
                        piece.processes
                            .take(index)
                            .every(
                              (item) => item.status == ProcessStatus.completed,
                            ),
                  ),
                ),
              ),
            const SizedBox(height: 4),
            Text(
              'Edge band L/T/R/B: ${piece.edgeBandLeft ?? 0} / ${piece.edgeBandTop ?? 0} / ${piece.edgeBandRight ?? 0} / ${piece.edgeBandBottom ?? 0} mm',
              style: AppTextStyle.labelSmall
                  .responsive(context)
                  .regular
                  .copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pieceCodeField(ShopFloorViewModel vm) => TextFormFieldWidget(
    controller: _codeController,
    focusNode: _codeFocusNode,
    hasLabel: false,
    hintText: 'Scan barcode or enter piece code',
    prefixIcon: const Icon(Icons.qr_code_2),
    onFieldSubmitted: vm.isLookingUp ? null : vm.findPiece,
  );

  Widget _operationCard(
    BuildContext context,
    ShopFloorViewModel vm,
    PieceProcess process, {
    required bool canStart,
  }) {
    final isUpdating = vm.updatingProcessId == process.processType.id;
    final isBlocked = !canStart && process.status != ProcessStatus.completed;
    final nextStatus = switch (process.status) {
      ProcessStatus.pending => ProcessStatus.inProgress,
      ProcessStatus.failed => ProcessStatus.inProgress,
      ProcessStatus.inProgress => ProcessStatus.completed,
      ProcessStatus.completed => null,
    };
    final actionLabel = switch (process.status) {
      ProcessStatus.pending => 'Start',
      ProcessStatus.failed => 'Retry',
      ProcessStatus.inProgress => 'Complete',
      ProcessStatus.completed => 'Completed',
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.dividerColor),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  process.processType.name,
                  style: AppTextStyle.labelMedium.responsive(context).semiBold,
                ),
              ),
              _statusChip(context, process.status),
            ],
          ),
          if (isBlocked) ...[
            const SizedBox(height: 6),
            Text(
              'Complete the earlier operation first.',
              style: AppTextStyle.labelSmall
                  .responsive(context)
                  .regular
                  .copyWith(color: AppColors.textSecondary),
            ),
          ],
          if (nextStatus != null) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: isUpdating || isBlocked
                      ? null
                      : () => vm.updateProcess(
                          processTypeId: process.processType.id,
                          status: nextStatus,
                        ),
                  icon: isUpdating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Icon(
                          process.status == ProcessStatus.inProgress
                              ? Icons.check_circle_outline
                              : Icons.play_arrow,
                        ),
                  label: Text(actionLabel),
                ),
                if (process.status == ProcessStatus.inProgress)
                  OutlinedButton.icon(
                    onPressed: isUpdating
                        ? null
                        : () => vm.updateProcess(
                            processTypeId: process.processType.id,
                            status: ProcessStatus.failed,
                          ),
                    icon: const Icon(Icons.report_problem_outlined),
                    label: const Text('Report issue'),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _detailChip(BuildContext context, IconData icon, String label) => Chip(
    avatar: Icon(icon, size: 16, color: AppColors.primaryColor),
    label: Text(label),
    backgroundColor: AppColors.primaryColor.withValues(alpha: .06),
    side: BorderSide.none,
    labelStyle: AppTextStyle.labelSmall
        .responsive(context)
        .regular
        .copyWith(color: AppColors.textPrimary),
  );

  Widget _statusChip(BuildContext context, ProcessStatus status) {
    final color = AppColors.statusColor(status.label);
    return Chip(
      label: Text(status.label),
      backgroundColor: color.withValues(alpha: .12),
      side: BorderSide.none,
      labelStyle: AppTextStyle.labelSmall
          .responsive(context)
          .semiBold
          .copyWith(color: color),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _messageCard(
    BuildContext context,
    String message, {
    required bool isError,
  }) => Card(
    color: AppColors.surfaceColor,
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Text(
        message,
        style: AppTextStyle.bodySmall
            .responsive(context)
            .regular
            .copyWith(
              color: isError
                  ? AppColors.rejectedColor
                  : AppColors.textSecondary,
            ),
      ),
    ),
  );
}
