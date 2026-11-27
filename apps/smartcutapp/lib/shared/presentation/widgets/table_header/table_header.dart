import 'package:board_cut/core/theme/theme.dart';
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyle.labelSmall
          .responsive(context)
          .bold
          .copyWith(color: AppColors.textSecondary),
    );
  }
}
