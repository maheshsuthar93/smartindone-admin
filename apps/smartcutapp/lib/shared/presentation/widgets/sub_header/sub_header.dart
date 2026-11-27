import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.desc,
    this.showTitle = true,
  });

  final String title;

  final String subtitle;

  final String? desc;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Text(
            title,
            style: AppTextStyle.titleSmall.bold.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        Text(
          subtitle,
          style: AppTextStyle.bodySmall.regular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),

        if (desc != null)
          Text(
            desc!,
            style: AppTextStyle.bodyXSmall.regular.copyWith(
              color: AppColors.textMuted,
            ),
          ),
      ],
    );
  }
}
