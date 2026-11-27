import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class DialogHeaderWidget extends StatelessWidget {
  const DialogHeaderWidget({super.key, required this.title, this.onClose});

  final String title;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.titleSmall.bold),
        IconButton(
          icon: Icon(Icons.close, size: 20),
          onPressed: onClose ?? () => router.pop(),
          tooltip: 'Close dialog',
        ),
      ],
    );
  }
}
