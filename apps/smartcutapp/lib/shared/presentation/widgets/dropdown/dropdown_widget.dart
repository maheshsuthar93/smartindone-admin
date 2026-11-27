import 'package:board_cut/core/core.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatelessWidget {
  const DropdownWidget({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
    required this.customButton,
    this.width = 130,
    this.itemHeight = 48,
    this.offset = const Offset(0, 8),
  });

  final List<T> items;
  final String Function(T item) labelBuilder;
  final ValueChanged<T?> onChanged;
  final Widget customButton;

  final double width;
  final double itemHeight;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        customButton: customButton,
        items: items
            .map(
              (item) => DropdownItem<T>(
                value: item,
                height: itemHeight,
                child: Text(
                  labelBuilder(item),
                  style: AppTextStyle.labelSmall
                      .responsive(context)
                      .regular
                      .copyWith(color: AppColors.textPrimary),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        dropdownStyleData: DropdownStyleData(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: Colors.white,
          ),
          offset: offset,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
