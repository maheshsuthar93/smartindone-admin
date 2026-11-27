import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.value,
    required this.max,
    required this.onChanged,
    this.min = 0,
  });

  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD9E1EC)),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Button(
            icon: Icons.remove,
            enabled: value > min,
            onTap: () => onChanged(value - 1),
          ),
          Container(
            width: 56,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: Color(0xffD9E1EC)),
              ),
            ),
            child: Text(
              value.toString(),
              style: AppTextStyle.labelSmall
                  .responsive(context)
                  .semiBold
                  .copyWith(color: AppColors.textPrimary),
            ),
          ),
          _Button(
            icon: Icons.add,
            enabled: value < max,
            onTap: () => onChanged(value + 1),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: SizedBox(
        width: 40,
        child: Icon(
          icon,
          size: 18,
          color: enabled ? AppColors.primaryColor : Colors.grey.shade400,
        ),
      ),
    );
  }
}
