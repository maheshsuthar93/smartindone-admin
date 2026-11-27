import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

import '../account_info/account_info_widget.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    this.title,
    this.hasMenu = false,
    this.onLeadingTap,
    this.leading,
    this.actions,
    this.titleLabel,
  });

  final Widget? title;
  final String? titleLabel;
  final bool hasMenu;
  final VoidCallback? onLeadingTap;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: _appBarTitle,
      elevation: 0,
      centerTitle: true,
      leading: _leading(context),
      actions: [...?actions, const AccountInfoWidget(compact: true)],
    );
  }

  bool _canPop() {
    try {
      return router.canPop();
    } catch (e) {
      // If router is not available, assume we cannot pop
      return false;
    }
  }

  Widget? _leading(BuildContext context) {
    if (leading != null) {
      return leading!;
    } else if (_canPop()) {
      return IconButton(
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: AppColors.primaryColor,
        ),
        tooltip: 'Back to previous screen',
        onPressed: () => router.pop(),
      );
    } else if (!_canPop() &&
        context.screnType == ScreenType.mobile &&
        hasMenu) {
      return Builder(
        builder: (scaffoldContext) {
          return IconButton(
            icon: const Icon(Icons.menu_rounded),
            tooltip: 'Back to previous screen',
            style: IconButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              backgroundColor: AppColors.primaryColor.withValues(alpha: .08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
            ),
            onPressed: () {
              debugPrint("Opening drawer");
              Scaffold.of(scaffoldContext).openDrawer();
            },
          );
        },
      );
    }

    return null;
  }

  Widget get _appBarTitle =>
      title ??
      Text(
        titleLabel ?? '',
        style: AppTextStyle.labelLarge.semiBold.copyWith(
          color: AppColors.primaryColor,
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
