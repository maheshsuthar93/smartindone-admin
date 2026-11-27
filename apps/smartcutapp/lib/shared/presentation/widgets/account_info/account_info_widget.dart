import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountInfoWidget extends StatefulWidget {
  const AccountInfoWidget({
    super.key,
    this.compact = false,
    this.fullWidth = false,
  });

  final bool compact;
  final bool fullWidth;

  @override
  State<AccountInfoWidget> createState() => _AccountInfoWidgetState();
}

class _AccountInfoWidgetState extends State<AccountInfoWidget> {
  late final Future<Map<String, String?>> _accountFuture = _loadAccount();

  Future<Map<String, String?>> _loadAccount() async {
    final storage = sl<FlutterSecureStorage>();
    return {
      'name': await storage.read(key: 'auth_user_name'),
      'email': await storage.read(key: 'auth_user_email'),
      'role': await storage.read(key: 'auth_user_role'),
    };
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<Map<String, String?>>(
    future: _accountFuture,
    builder: (context, snapshot) {
      final account = snapshot.data;
      final name = account?['name'];
      if (name == null || name.isEmpty) return const SizedBox.shrink();
      final email = account?['email'] ?? '';
      final role = account?['role'] ?? '';
      final popupWidth = (MediaQuery.sizeOf(context).width - 16)
          .clamp(180.0, 320.0)
          .toDouble();
      final detailsWidth = (popupWidth - 100).clamp(80.0, 210.0).toDouble();

      return PopupMenuButton<int>(
        tooltip: 'Signed in as $name',
        position: PopupMenuPosition.under,
        constraints: BoxConstraints(maxWidth: popupWidth),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        elevation: 8,
        itemBuilder: (context) => [
          PopupMenuItem<int>(
            enabled: false,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _avatar(name, radius: 20),
                const SizedBox(width: 12),
                SizedBox(
                  width: detailsWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.bodySmall.semiBold.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (email.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.labelSmall.regular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (role.isNotEmpty) ...[
            const PopupMenuDivider(height: 1),
            PopupMenuItem<int>(
              enabled: false,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
              child: SizedBox(
                width: popupWidth - 48,
                child: Row(
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Role',
                      style: AppTextStyle.labelSmall.regular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: .08),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          role,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.labelSmall.semiBold.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
        child: Container(
          width: widget.fullWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(
            horizontal: widget.fullWidth ? 20 : (widget.compact ? 6 : 10),
            vertical: widget.fullWidth ? 12 : (widget.compact ? 5 : 7),
          ),
          // decoration: BoxDecoration(
          //   color: AppColors.surfaceColor,
          //   borderRadius: widget.fullWidth ? null : BorderRadius.circular(12),
          //   border: widget.fullWidth
          //       ? const Border(bottom: BorderSide(color: AppColors.borderColor))
          //       : Border.all(color: AppColors.borderColor),
          // ),
          child: Row(
            mainAxisSize: widget.fullWidth
                ? MainAxisSize.max
                : MainAxisSize.min,
            children: [
              if (widget.fullWidth) ...[
                const Spacer(),
                _avatar(name, radius: 22, prominent: true),
                const SizedBox(width: 14),
                _accountName(name),
                const SizedBox(width: 14),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 24,
                  color: AppColors.textPrimary,
                ),
              ] else if (!widget.compact) ...[
                _avatar(name),
                const SizedBox(width: 9),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.labelSmall.bold.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (role.isNotEmpty)
                        Text(
                          role,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.labelSmall.regular.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
              ] else ...[
                _avatar(name, radius: 20, prominent: true),
                if (MediaQuery.sizeOf(context).width > 440) ...[
                  const SizedBox(width: 8),
                  _accountName(name),
                  const SizedBox(width: 6),
                ],
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 24,
                  color: AppColors.textPrimary,
                ),
              ],
            ],
          ),
        ),
      );
    },
  );

  Widget _accountName(String name) => ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: (MediaQuery.sizeOf(context).width * 0.3).clamp(100.0, 180.0),
    ),
    child: Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.bodyMedium.semiBold.copyWith(
        color: AppColors.textPrimary,
      ),
    ),
  );

  Widget _avatar(String name, {double radius = 16, bool prominent = false}) =>
      CircleAvatar(
        radius: radius,
        backgroundColor: prominent
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: .10),
        child: Text(
          _initials(name),
          style: AppTextStyle.labelSmall.bold.copyWith(
            color: prominent ? AppColors.white : AppColors.primaryColor,
            fontSize: prominent ? 14 : null,
          ),
        ),
      );

  String _initials(String name) {
    final words = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty);
    if (words.isEmpty) return '?';
    return words.take(2).map((word) => word[0].toUpperCase()).join();
  }
}
