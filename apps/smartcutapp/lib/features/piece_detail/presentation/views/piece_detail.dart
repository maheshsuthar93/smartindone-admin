import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/selected_piece_model.dart';
import '../../../part_detail/data/model/part_detail_model.dart';
import '../../../part_detail/data/model/part_detail_piece_model.dart';
import '../../../part_detail/presentation/widgets/print_piece_label.dart';
import '../view_models/piece_detail_view_model.dart';

class PieceDetail extends StatefulWidget {
  const PieceDetail({
    super.key,
    required this.pieceId,
    this.part,
    this.piece,
    this.orderId,
  });

  final String pieceId;
  final PartDetailModel? part;
  final PartDetailPieceModel? piece;
  final String? orderId;

  @override
  State<PieceDetail> createState() => _PieceDetailState();
}

class _PieceDetailState extends State<PieceDetail> {
  late final PieceDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = sl<PieceDetailViewModel>();
    _viewModel.pieceId = widget.pieceId;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PieceDetailViewModel>(
      create: (_) => _viewModel..fetchPieceById(widget.pieceId),
      child: Consumer<PieceDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const SizedBox(
              height: 320,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (vm.error != null && vm.selectedPiece == null) {
            return _buildErrorState(context, vm);
          }

          final piece = vm.selectedPiece;

          if (piece == null) {
            return const SizedBox(
              height: 200,
              child: Center(child: Text('Piece details not found.')),
            );
          }

          return _buildContent(context, vm);
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, PieceDetailViewModel vm) {
    return SizedBox(
      height: 280,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 40,
                color: AppColors.rejectedColor,
              ),
              const SizedBox(height: 12),
              Text(
                vm.error ?? 'Unable to load piece details.',
                textAlign: TextAlign.center,
                style: AppTextStyle.labelMedium.responsive(context).regular,
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => vm.fetchPieceById(widget.pieceId),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, PieceDetailViewModel vm) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: SizedBox(
        height: screenHeight * 0.80,
        child: Material(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSize.borderRadius),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              _buildHeader(context, vm),
              Divider(height: 1, color: AppColors.dividerColor),
              Expanded(child: _buildTabView(context, vm)),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Header
  // ---------------------------------------------------------------------------

  Widget _buildHeader(BuildContext context, PieceDetailViewModel vm) {
    final piece = vm.selectedPiece!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                ),
                child: Icon(
                  Icons.view_in_ar_outlined,
                  size: 24,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      piece.pieceCode ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.labelLarge.responsive(context).bold,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${piece.width} × ${piece.height} mm',
                      style: AppTextStyle.labelSmall
                          .responsive(context)
                          .regular
                          .copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Close',
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Tabs
  // ---------------------------------------------------------------------------

  Widget _buildTabView(BuildContext context, PieceDetailViewModel vm) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.primaryColor,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.textSecondary,
            labelStyle: AppTextStyle.labelMedium.responsive(context).semiBold,
            tabs: const [
              Tab(height: 42, text: 'Details'),
              Tab(height: 42, text: 'Operations'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildDetailsTab(context, vm),
                _buildOperationsTab(context, vm),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Details tab
  // ---------------------------------------------------------------------------

  Widget _buildDetailsTab(BuildContext context, PieceDetailViewModel vm) {
    final piece = vm.selectedPiece!;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionCard(
          context,
          title: 'Piece Information',
          icon: Icons.straighten_outlined,
          children: [
            _buildInfoRow(
              context,
              label: 'Thickness',
              value: '${piece.thickness} mm',
            ),
            _buildInfoRow(context, label: 'Width', value: '${piece.width} mm'),
            _buildInfoRow(
              context,
              label: 'Height',
              value: '${piece.height} mm',
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildSectionCard(
          context,
          title: 'Material Rules',
          icon: Icons.layers_outlined,
          children: [
            _buildInfoRow(
              context,
              label: 'Grain Direction',
              value: piece.part.grain
                  ? piece.part.grainDirection.label
                  : 'Not required',
            ),
            _buildInfoRow(
              context,
              label: 'Rotation Allowed',
              value: piece.part.rotatable ? 'Yes' : 'No',
              valueColor: piece.part.rotatable
                  ? AppColors.completedColor
                  : AppColors.textSecondary,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildSectionCard(
          context,
          title: 'Edge Banding',
          icon: Icons.border_outer,
          children: [
            _buildInfoRow(
              context,
              label: 'Top Edge',
              value: '${piece.edgeBandTop ?? 0} mm',
            ),
            _buildInfoRow(
              context,
              label: 'Bottom Edge',
              value: '${piece.edgeBandBottom ?? 0} mm',
            ),
            _buildInfoRow(
              context,
              label: 'Left Edge',
              value: '${piece.edgeBandLeft ?? 0} mm',
            ),
            _buildInfoRow(
              context,
              label: 'Right Edge',
              value: '${piece.edgeBandRight ?? 0} mm',
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildProcessSummary(context, piece.processes),
      ],
    );
  }

  Widget _buildProcessSummary(
    BuildContext context,
    List<PieceProcess> processes,
  ) {
    final total = processes.length;
    final completedCount = processes
        .where((process) => process.status == ProcessStatus.completed)
        .length;
    final progress = total == 0 ? 0.0 : completedCount / total;

    return _buildSectionCard(
      context,
      title: 'Production Progress',
      icon: Icons.trending_up,
      trailing: Text(
        '$completedCount / $total',
        style: AppTextStyle.labelMedium
            .responsive(context)
            .semiBold
            .copyWith(color: AppColors.primaryColor),
      ),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 7,
            backgroundColor: AppColors.dividerColor,
            color: AppColors.completedColor,
          ),
        ),
        const SizedBox(height: 12),
        if (processes.isEmpty)
          Text(
            'No operations have been assigned to this piece.',
            style: AppTextStyle.labelSmall
                .responsive(context)
                .regular
                .copyWith(color: AppColors.textSecondary),
          )
        else
          ...processes.map<Widget>(
            (process) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      process.processType.name,
                      style: AppTextStyle.labelSmall
                          .responsive(context)
                          .regular,
                    ),
                  ),
                  _buildStatusBadge(
                    context,
                    process.status.label,
                    _getStatusColor(process.status),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Operations tab
  // ---------------------------------------------------------------------------

  Widget _buildOperationsTab(BuildContext context, PieceDetailViewModel vm) {
    final piece = vm.selectedPiece!;
    final processes = piece.processes;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Process Operations',
                    style: AppTextStyle.labelLarge.responsive(context).bold,
                  ),
                ),
                Text(
                  '${processes.length} processes',
                  style: AppTextStyle.labelSmall
                      .responsive(context)
                      .regular
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (processes.isEmpty)
              _buildEmptyState(
                context,
                icon: Icons.precision_manufacturing_outlined,
                message: 'No operations found for this piece.',
              )
            else
              ...processes.map(
                (process) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildOperationCard(
                    context: context,
                    label: process.processType.name,
                    startedAt:
                        process.startedAt?.toLocal().toDateTime() ?? 'N/A',
                    completedAt:
                        process.completedAt?.toLocal().toDateTime() ?? 'N/A',
                    processStatus: process.status,
                    processTypeId: process.processType.id,
                    onChanged: (status) {
                      vm.updatePieceProcessStatusById(
                        status: status.value,
                        processTypeId: process.processType.id,
                      );
                    },
                  ),
                ),
              ),
            const SizedBox(height: 4),
            _buildEdgeBandingCard(context, vm),
            const SizedBox(height: 10),
            _buildQuickActions(context),
          ],
        ),
        if (vm.isStatusUpdating)
          Positioned.fill(
            child: ColoredBox(
              color: Colors.white.withValues(alpha: 0.65),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildOperationCard({
    required BuildContext context,
    required String label,
    required String startedAt,
    required String completedAt,
    required ProcessStatus processStatus,
    required String processTypeId,
    required ValueChanged<ProcessStatus> onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        border: Border.all(color: AppColors.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyle.labelMedium.responsive(context).semiBold,
                ),
              ),
              _buildStatusBadge(
                context,
                processStatus.label,
                _getStatusColor(processStatus),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildTimestamp(
            context,
            icon: Icons.play_circle_outline,
            label: 'Started',
            value: startedAt,
          ),
          const SizedBox(height: 5),
          _buildTimestamp(
            context,
            icon: Icons.check_circle_outline,
            label: 'Completed',
            value: completedAt,
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 10),
          Text(
            'Update status',
            style: AppTextStyle.labelSmall
                .responsive(context)
                .semiBold
                .copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          ProcessStatusSelector(
            processStatus: processStatus,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildTimestamp(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 7),
        SizedBox(
          width: 65,
          child: Text(
            label,
            style: AppTextStyle.labelSmall
                .responsive(context)
                .regular
                .copyWith(color: AppColors.textSecondary),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyle.labelSmall.responsive(context).regular,
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Edge banding
  // ---------------------------------------------------------------------------

  Widget _buildEdgeBandingCard(BuildContext context, PieceDetailViewModel vm) {
    final piece = vm.selectedPiece!;

    return _buildSectionCard(
      context,
      title: 'Edge Banding Details',
      icon: Icons.border_outer,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth < 380 ? 2 : 4;

            final items = [
              ('Top', '${piece.edgeBandTop ?? 0} mm'),
              ('Bottom', '${piece.edgeBandBottom ?? 0} mm'),
              ('Left', '${piece.edgeBandLeft ?? 0} mm'),
              ('Right', '${piece.edgeBandRight ?? 0} mm'),
            ];

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
                mainAxisExtent: 48,
              ),
              itemBuilder: (context, index) {
                final item = items[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$1,
                      style: AppTextStyle.labelSmall
                          .responsive(context)
                          .regular
                          .copyWith(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.$2,
                      style: AppTextStyle.labelMedium
                          .responsive(context)
                          .semiBold,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Quick actions
  // ---------------------------------------------------------------------------

  Widget _buildQuickActions(BuildContext context) {
    return _buildSectionCard(
      context,
      title: 'Quick Actions',
      icon: Icons.bolt_outlined,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            OutlinedButton.icon(
              onPressed: () {
                // Connect existing bulk-completion logic here.
              },
              icon: const Icon(Icons.check_circle_outline, size: 18),
              label: const Text('Mark All Completed'),
            ),
            OutlinedButton.icon(
              onPressed:
                  widget.part == null ||
                      widget.piece == null ||
                      widget.orderId == null
                  ? null
                  : () => showDialog<void>(
                      context: context,
                      builder: (_) => PrintPieceLabel(
                        piece: widget.piece!,
                        part: widget.part!,
                        orderId: widget.orderId!,
                      ),
                    ),
              icon: const Icon(Icons.print_outlined, size: 18),
              label: const Text('Print Label'),
            ),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Reusable UI components
  // ---------------------------------------------------------------------------

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> children,
    Widget? trailing,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        border: Border.all(color: AppColors.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 19, color: AppColors.primaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.labelMedium.responsive(context).semiBold,
                ),
              ),
              ?trailing,
            ],
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyle.labelSmall
                  .responsive(context)
                  .regular
                  .copyWith(color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: AppTextStyle.labelSmall
                  .responsive(context)
                  .semiBold
                  .copyWith(color: valueColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTextStyle.labelSmall
            .responsive(context)
            .semiBold
            .copyWith(color: color),
      ),
    );
  }

  Widget _buildEmptyState(
    BuildContext context, {
    required IconData icon,
    required String message,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Icon(icon, size: 36, color: AppColors.textSecondary),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyle.labelSmall
                .responsive(context)
                .regular
                .copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(ProcessStatus status) {
    return AppColors.statusColor(status.name);
  }
}

// -----------------------------------------------------------------------------
// Process status selector
// -----------------------------------------------------------------------------

class ProcessStatusSelector extends StatelessWidget {
  const ProcessStatusSelector({
    super.key,
    required this.processStatus,
    required this.onChanged,
  });

  final ProcessStatus processStatus;
  final ValueChanged<ProcessStatus> onChanged;

  Color _getColor(ProcessStatus status) {
    return AppColors.statusColor(status.name);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ProcessStatus.values.map((status) {
        final isSelected = status == processStatus;
        final color = _getColor(status);

        return ChoiceChip(
          label: Text(status.label),
          selected: isSelected,
          showCheckmark: isSelected,
          checkmarkColor: Colors.white,
          selectedColor: color,
          backgroundColor: AppColors.white,
          side: BorderSide(color: isSelected ? color : AppColors.dividerColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          labelStyle: AppTextStyle.labelSmall
              .responsive(context)
              .regular
              .copyWith(
                color: isSelected ? Colors.white : AppColors.primaryColor,
              ),
          onSelected: (_) {
            if (!isSelected) onChanged(status);
          },
        );
      }).toList(),
    );
  }
}
