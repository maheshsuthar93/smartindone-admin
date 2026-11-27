import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.textSecondary,
              ),
              tooltip: 'Back to previous screen',
              onPressed: () => router.pop(),
            ),
            Text(title, style: AppTextStyle.labelLarge.bold),
          ],
        ),
        Divider(color: AppColors.dividerColor),
      ],
    );
  }
}
