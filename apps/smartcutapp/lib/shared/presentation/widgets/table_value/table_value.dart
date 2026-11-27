import 'package:board_cut/core/theme/theme.dart';
import 'package:flutter/material.dart';

class TableValue extends StatelessWidget {
  const TableValue({super.key, required this.label, this.maxLines = 1});

  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.labelSmall
          .responsive(context)
          .regular
          .copyWith(color: AppColors.textPrimary),
    );
  }
}
