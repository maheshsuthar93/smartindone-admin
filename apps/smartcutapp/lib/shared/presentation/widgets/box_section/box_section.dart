import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class BoxSection extends StatelessWidget {
  const BoxSection({
    super.key,
    required this.label,
    required this.value,
    this.label2 = '',
  });

  final String label;
  final String label2;
  final String value;

  @override
  Widget build(BuildContext context) {
    return _boxSection(label: label, label2: label2, value: value);
  }

  Widget _boxSection({
    required String label,
    required String value,
    required String label2,
  }) {
    return Card(
      color: AppColors.surfaceColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.borderRadius),
                    color: AppColors.secondaryColor.withValues(alpha: 220),
                  ),
                  child: Icon(
                    Icons.sticky_note_2_outlined,
                    size: 20,
                    color: AppColors.secondaryColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      label,
                      style: AppTextStyle.bodySmall.regular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      value,
                      style: AppTextStyle.bodyMedium.bold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
