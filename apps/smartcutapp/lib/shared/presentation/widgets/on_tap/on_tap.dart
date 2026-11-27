import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class AppOnTap extends StatefulWidget {
  const AppOnTap({super.key, required this.onTap, required this.child});

  final GestureTapCallback onTap;
  final Widget child;

  @override
  State<AppOnTap> createState() => _OnTapState();
}

class _OnTapState extends State<AppOnTap> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        hitTestBehavior: HitTestBehavior.opaque,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          onTap: widget.onTap,
          child: widget.child,
        ),
      ),
    );
  }
}
