import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.hasIcon = false,
  });

  final String label;
  final String value;
  final IconData icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        if (hasIcon)
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(icon, size: 16, color: AppColors.textSecondary),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyle.labelMedium.semiBold.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.labelMedium.bold.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
