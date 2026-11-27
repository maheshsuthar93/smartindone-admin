import 'package:board_cut/core/theme/theme.dart';
import 'package:flutter/material.dart';

class TableStatusValue extends StatelessWidget {
  const TableStatusValue({
    super.key,
    required this.label,
    this.color = AppColors.successColor,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 150,
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.labelSmall
            .responsive(context)
            .medium
            .copyWith(color: color),
      ),
    );
  }
}
