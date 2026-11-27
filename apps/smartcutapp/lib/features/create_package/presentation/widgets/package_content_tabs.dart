import 'package:board_cut/core/theme/app_colors.dart';
import 'package:board_cut/core/theme/app_size.dart';
import 'package:flutter/material.dart';

enum PackageTab { pieces, hardware }

class PackageContentTabs extends StatelessWidget {
  const PackageContentTabs({
    super.key,
    required this.selectedTab,
    required this.piecesCount,
    required this.hardwareCount,
    required this.onTabChanged,
  });

  final PackageTab selectedTab;
  final int piecesCount;
  final int hardwareCount;
  final ValueChanged<PackageTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 500,
      decoration: BoxDecoration(
        color: const Color(0xffF4F6FA),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        border: Border.all(color: const Color(0xffD8E0EC)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _PackageContentTab(
              title: "Pieces",
              count: piecesCount,
              isSelected: selectedTab == PackageTab.pieces,
              onTap: () => onTabChanged(PackageTab.pieces),
            ),
          ),
          Expanded(
            child: _PackageContentTab(
              title: "Hardware",
              count: hardwareCount,
              isSelected: selectedTab == PackageTab.hardware,
              onTap: () => onTabChanged(PackageTab.hardware),
            ),
          ),
        ],
      ),
    );
  }
}

class _PackageContentTab extends StatelessWidget {
  const _PackageContentTab({
    required this.title,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: isSelected ? Colors.white : const Color(0xff5B6472),
            ),
            child: Text("$title ($count)"),
          ),
        ),
      ),
    );
  }
}
