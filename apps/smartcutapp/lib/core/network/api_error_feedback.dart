import 'package:board_cut/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final apiScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showApiErrorFeedback(String message) {
  _showApiFeedback(
    message,
    color: AppColors.errorColor,
    icon: Icons.error_outline,
    duration: const Duration(seconds: 6),
    dismissible: true,
  );
}

void showApiSuccessFeedback(String message) {
  _showApiFeedback(
    message,
    color: AppColors.successColor,
    icon: Icons.check_circle_outline,
    duration: const Duration(seconds: 3),
  );
}

void _showApiFeedback(
  String message, {
  required Color color,
  required IconData icon,
  required Duration duration,
  bool dismissible = false,
}) {
  final messenger = apiScaffoldMessengerKey.currentState;
  if (messenger == null || message.trim().isEmpty) return;

  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message.trim(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        action: dismissible
            ? SnackBarAction(
                label: 'DISMISS',
                textColor: Colors.white,
                onPressed: messenger.hideCurrentSnackBar,
              )
            : null,
      ),
    );
}
