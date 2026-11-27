import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class PackageTabs extends StatefulWidget {
  const PackageTabs({
    super.key,
    required this.childLeft,
    required this.childRight,
  });

  final Widget childLeft;
  final Widget childRight;

  @override
  State<PackageTabs> createState() => _PackageTabsState();
}

class _PackageTabsState extends State<PackageTabs> {
  int selectedIndex = 0;

  final tabs = ["Pieces", "Hardware"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(tabs.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                ),
                label: Text(
                  tabs[index],
                  style: AppTextStyle.titleSmall
                      .responsive(context)
                      .medium
                      .copyWith(
                        color: selectedIndex == index
                            ? Colors.white
                            : AppColors.primaryColor,
                      ),
                ),
                onSelected: (selected) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                selected: selectedIndex == index,
                checkmarkColor: Colors.white,
                selectedColor: selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.grey.shade200,
              ), // child: FilterChip(
            );
          }),
        ),

        const SizedBox(height: 16),

        // 🔹 Tab Content
        Expanded(
          child: selectedIndex == 0 ? widget.childLeft : widget.childRight,
        ),
      ],
    );
  }
}
