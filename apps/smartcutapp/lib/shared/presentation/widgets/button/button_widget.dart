import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, danger }

enum IconPosition { left, right }

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.right,
    this.spacing = 8,
    this.iconColor = Colors.white,
    this.borderColor,
  }) : type = ButtonType.primary;

  const ButtonWidget.primary({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.right,
    this.spacing = 8,
    this.iconColor = Colors.white,
    this.borderColor,
  }) : type = ButtonType.primary;

  const ButtonWidget.secondary({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.right,
    this.spacing = 8,
    this.iconColor = Colors.white,
    this.borderColor = AppColors.primaryColor,
  }) : type = ButtonType.secondary;

  const ButtonWidget.danger({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.right,
    this.spacing = 8,
    this.iconColor = Colors.white,
    this.borderColor = Colors.red,
  }) : type = ButtonType.danger;

  final VoidCallback? onPressed;
  final String label;
  final ButtonType type;
  final IconData? icon;
  final IconPosition iconPosition;
  final double spacing;
  final Color iconColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return _buildPrimaryButton();
      case ButtonType.secondary:
        return _buildSecondaryButton();
      case ButtonType.danger:
        return _buildDangerButton();
    }
  }

  Widget _buildPrimaryButton() {
    return SizedBox(
      height: 37,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
          ),
          child: Row(
            spacing: spacing,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null && iconPosition == IconPosition.left)
                Icon(icon, size: 16, color: iconColor),
              Text(label, style: _textStyle),

              if (icon != null && iconPosition == IconPosition.right)
                Icon(icon, size: 16, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }

  // Make secondary with outline and primary color text

  Widget _buildSecondaryButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: 1,
          ),
          foregroundColor: borderColor ?? AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
        ),
        child: Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && iconPosition == IconPosition.left)
              Icon(icon, size: 16, color: iconColor),
            Text(label, style: _textStyle),

            if (icon != null && iconPosition == IconPosition.right)
              Icon(icon, size: 16, color: iconColor),
          ],
        ),
      ),
    );
  }

  Widget _buildDangerButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.rejectedColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
        ),
        child: Text(label, style: _textStyle),
      ),
    );
  }

  TextStyle get _textStyle => switch (type) {
    ButtonType.primary => AppTextStyle.labelLarge.semiBold.copyWith(
      color: Colors.white,
    ),
    ButtonType.secondary => AppTextStyle.labelLarge.semiBold.copyWith(
      color: AppColors.primaryColor,
    ),
    ButtonType.danger => AppTextStyle.labelLarge.semiBold.copyWith(
      color: Colors.white,
    ),
  };
}
