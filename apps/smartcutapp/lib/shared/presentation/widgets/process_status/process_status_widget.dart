import 'package:board_cut/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProcessStatusWidget extends StatelessWidget {
  const ProcessStatusWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.statusBackgroundColor(status),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: AppColors.statusColor(status),
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
