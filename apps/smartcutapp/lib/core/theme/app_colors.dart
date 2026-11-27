import 'package:flutter/material.dart';

abstract class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  // static const primaryColor = Color(0xFF102A45);
  // static const secondaryColor = Color(0xFF087E8B);
  // static const orange = Color(0xFFFF5433);
  // static const lightGray = Color(0xFFdddddd);
  // static const darkGray = Color(0xFF808080);
  // static const gray = Color(0xFF9A9A9A);
  // static const red = Color(0xFFD32F2F);
  // static const transparent = Colors.transparent;
  // static const background = Colors.white;
  // static const tableHeader = Color(0xffF9F9FA);
  // static const grayLight = Color(0xffFAFAFB);
  //
  // static const gray1 = Color(0xffF6F8FA);
  //
  // static const black2 = Color(0xff0F1B2B);

  static const primaryNavy = Color(0xFF102A45);
  static const accentTeal = Color(0xFF087E8B);
  static const lightNeutral = Color(0xFFF5F7FA);

  static const primaryColor = primaryNavy;
  static const primaryColorWebHex = '#102A45';
  static const secondaryColor = accentTeal;
  static const textFieldIcon = Color(0xFF64748B);

  static const surface = Color(0xFFFAFAFD);

  // static const backgroundColor = Color(0xFF0F172A);   // Page
  // static const surfaceColor = Color(0xFF111827);      // Cards
  // static const surfaceLight = Color(0xFF1A2233);
  //
  static const transparent = Colors.transparent;

  //
  // static const borderColor = Color(0xFF243044);
  //
  //
  // static const textPrimary   = Color(0xFF1F2937);
  // static const textSecondary = Color(0xFF6B7280);
  // static const textMuted     = Color(0xFF9CA3AF);

  static const backgroundColor = lightNeutral; // Page
  static const surfaceColor = Colors.white; // Cards
  static const surfaceLight = lightNeutral; // Inner sections

  static const borderColor = Color(0xFFE2E8F0);
  static const dividerColor = Color(0xFFE5E7EB);

  static const textPrimary = Color(0xFF1F2937);
  static const textSecondary = Color(0xFF6B7280);
  static const textMuted = Color(0xFF9CA3AF);

  static const successColor = Color(0xFF16A34A);
  static const warningColor = Color(0xFFF59E0B);
  static const errorColor = Color(0xFFDC2626);
  static const infoColor = Color(0xFF2563EB);

  // Pending (Gray)
  static const pendingColor = Color(0xFF6B7280);
  static const pendingBgColor = Color(0x406B7280); // 25% alpha

  // In Progress (Blue)
  static const inProgressColor = Color(0xFF2563EB);
  static const inProgressBgColor = Color(0x402563EB); // 25% alpha

  // Completed (Green)
  static const completedColor = Color(0xFF16A34A);
  static const completedBgColor = Color(0x4016A34A); // 25% alpha

  // Rejected (Red)
  static const rejectedColor = Color(0xFFDC2626);
  static const rejectedBgColor = Color(0x40DC2626); // 25% alpha

  // Unused Area (Light Gray)
  static const unusedAreaColor = Color(0xFFF3F4F6);
  static const unusedAreaBorder = Color(0xFFD1D5DB);
  static const Color textFieldBorder = Color(0xFFD8E2EE);

  // static Color bgColor(String status) => switch (status) {
  //   'Completed' => AppColors.completedBgColor,
  //   'In Progress' => AppColors.inProgressBgColor,
  //   'Pending' => AppColors.pendingBgColor,
  //   _ => AppColors.rejectedBgColor,
  // };
  //

  static Color statusColor(String status) {
    final normalized = status
        .trim()
        .replaceAllMapped(
          RegExp(r'([a-z0-9])([A-Z])'),
          (match) => '${match.group(1)}_${match.group(2)}',
        )
        .toLowerCase()
        .replaceAll(RegExp(r'[\s-]+'), '_');

    return switch (normalized) {
      // Successful or finished states.
      'completed' ||
      'done' ||
      'delivered' ||
      'shipped' ||
      'packed' ||
      'cut_done' ||
      'offcut' ||
      'approved' ||
      'released' ||
      'available' ||
      'used' ||
      'ready' => AppColors.completedColor,

      // Active work or reserved resources.
      'in_progress' ||
      'in_production' ||
      'in_cutting' ||
      'cutting' ||
      'active' ||
      'admin' ||
      'reserved' ||
      'dispatched' ||
      'in_transit' ||
      'optimizing' ||
      'selected' ||
      'packing' ||
      'loaded' => AppColors.inProgressColor,

      // Waiting, draft, or review states.
      'pending' ||
      'draft' ||
      'planning' ||
      'generated' ||
      'inactive' ||
      'not_packed' ||
      'unknown' => AppColors.pendingColor,

      // Attention needed, but not a failure.
      'needs_optimization' ||
      'on_hold' ||
      'on_leave' ||
      'under_maintenance' => AppColors.warningColor,

      // Failed, rejected, cancelled, or unusable states.
      'failed' ||
      'rejected' ||
      'cancelled' ||
      'canceled' ||
      'suspended' ||
      'scrap' ||
      'scrapped' => AppColors.rejectedColor,

      _ => AppColors.rejectedColor,
    };
  }

  static Color statusBackgroundColor(String status) {
    final color = statusColor(status);
    if (color == completedColor) return completedBgColor;
    if (color == inProgressColor) return inProgressBgColor;
    if (color == pendingColor) return pendingBgColor;
    if (color == warningColor) return const Color(0x40F59E0B);
    return rejectedBgColor;
  }
}
