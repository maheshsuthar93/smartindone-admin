import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/printer/printer.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../data/model/part_detail_model.dart';
import '../../data/model/part_detail_piece_model.dart';

class PrintPieceLabel extends BaseStatefulScreen {
  const PrintPieceLabel({
    super.key,
    required this.piece,
    required this.part,
    required this.orderId,
  });

  final PartDetailPieceModel piece;
  final PartDetailModel part;
  final String orderId;

  @override
  BaseState<PrintPieceLabel> createState() => _PrintPieceLabelState();
}

class _PrintPieceLabelState extends BaseState<PrintPieceLabel> {
  final _printerService = sl<PrinterService>();
  bool _printing = false;

  Future<void> _print() async {
    setState(() => _printing = true);
    try {
      final edges = [
        _dimension(widget.part.edgeBandLeft),
        _dimension(widget.part.edgeBandTop),
        _dimension(widget.part.edgeBandRight),
        _dimension(widget.part.edgeBandBottom),
      ].join('/');
      final orderReference = widget.orderId.length > 12
          ? widget.orderId.substring(0, 8).toUpperCase()
          : widget.orderId.toUpperCase();
      await _printerService.printPieceLabel(
        PieceLabelData(
          pieceCode: widget.piece.pieceCode,
          partName: widget.part.name,
          orderReference: orderReference,
          size:
              '${_dimension(widget.piece.width)} x '
              '${_dimension(widget.piece.height)} x '
              '${_dimension(widget.piece.thickness)} mm',
          material: widget.part.material.name,
          grain: widget.part.grain
              ? (widget.part.grainDirection?.label ?? 'Required')
              : 'No direction',
          edgeBands: edges,
          serialNumber: widget.piece.serialNo,
        ),
      );
      if (mounted) _message('Piece label sent to the printer.');
    } on UnsupportedError {
      if (mounted) {
        _message('Direct TCP printing requires the native app, not a browser.');
      }
    } on StateError {
      if (mounted) {
        _message('Set the printer IP and label size in Settings first.');
      }
    } catch (_) {
      if (mounted) {
        _message('Could not print. Check printer IP, network, and port 9100.');
      }
    } finally {
      if (mounted) setState(() => _printing = false);
    }
  }

  void _message(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final orderReference = widget.orderId.length > 12
        ? widget.orderId.substring(0, 8).toUpperCase()
        : widget.orderId.toUpperCase();

    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.all(screenType == ScreenType.mobile ? 12 : 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: MediaQuery.sizeOf(context).height * .9,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Piece label preview',
                        style: AppTextStyle.titleXSmall
                            .responsive(context)
                            .semiBold
                            .copyWith(color: AppColors.textPrimary),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Close',
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _label(orderReference),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Close'),
                    ),
                    FilledButton.icon(
                      onPressed: _printing ? null : _print,
                      icon: _printing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.print, size: 18),
                      label: Text(_printing ? 'Sending...' : 'Print label'),
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

  Widget _label(String orderReference) {
    final edgeBands = [
      'L ${_dimension(widget.part.edgeBandLeft)}',
      'T ${_dimension(widget.part.edgeBandTop)}',
      'R ${_dimension(widget.part.edgeBandRight)}',
      'B ${_dimension(widget.part.edgeBandBottom)}',
    ].join('   ');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.dividerColor, width: 1.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.piece.pieceCode,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.titleXSmall
                          .responsive(context)
                          .bold
                          .copyWith(color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      widget.part.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodySmall.semiBold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'ORDER $orderReference',
                  style: AppTextStyle.labelSmall.semiBold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: AppColors.dividerColor),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _labelValue(
                  'SIZE (W x H x T)',
                  '${_dimension(widget.piece.width)} x '
                      '${_dimension(widget.piece.height)} x '
                      '${_dimension(widget.piece.thickness)} mm',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _labelValue(
                  'MATERIAL',
                  '${widget.part.material.name} '
                      '(${_dimension(widget.piece.thickness)} mm)',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _labelValue(
                  'GRAIN',
                  widget.part.grain
                      ? (widget.part.grainDirection?.label ?? 'Required')
                      : 'No direction',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: _labelValue('EDGE BANDING (L T R B)', edgeBands)),
            ],
          ),
          if (widget.piece.serialNo?.isNotEmpty == true) ...[
            const SizedBox(height: 10),
            _labelValue('SERIAL NUMBER', widget.piece.serialNo!),
          ],
        ],
      ),
    );
  }

  Widget _labelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.labelSmall.semiBold.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: AppTextStyle.labelSmall.semiBold.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  String _dimension(num? value) => value == null || value == 0
      ? '-'
      : value == value.round()
      ? value.round().toString()
      : value.toStringAsFixed(1);
}
