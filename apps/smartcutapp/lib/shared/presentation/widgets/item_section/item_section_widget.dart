import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

enum ItemOrientation { horizontal, vertical }

class ItemSectionWidget extends StatelessWidget {
  const ItemSectionWidget({
    super.key,
    required this.label,
    required this.value,
    this.orientation = ItemOrientation.horizontal,
    this.maxLines = 1,
    this.labelStyle,
    this.valueStyle,
    this.icon,
  });

  final String label;
  final String value;
  final int maxLines;

  final ItemOrientation orientation;
  final TextStyle? labelStyle;

  final TextStyle? valueStyle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (orientation == ItemOrientation.horizontal) {
      return Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: _tableHeader(context, label)),
          Expanded(flex: 2, child: _tableValue(context, value)),
        ],
      );
    }
    return Row(
      spacing: 10,
      children: [
        if (icon != null)
          Icon(
            icon ?? Icons.access_time_sharp,
            size: 16,
            color: AppColors.textSecondary,
          ),
        Column(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_tableHeader(context, label), _tableValue(context, value)],
        ),
      ],
    );
  }

  Widget _tableValue(BuildContext context, String value) {
    return Text(
      value,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style:
          valueStyle ??
          AppTextStyle.labelSmall
              .responsive(context)
              .regular
              .copyWith(color: AppColors.textPrimary),
    );
  }

  Widget _tableHeader(BuildContext context, String label) {
    return Text(
      label,
      style:
          labelStyle ??
          AppTextStyle.labelSmall
              .responsive(context)
              .semiBold
              .copyWith(color: AppColors.textSecondary),
    );
  }
}
