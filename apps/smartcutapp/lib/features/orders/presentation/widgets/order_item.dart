import 'package:flutter/material.dart';
import 'package:board_cut/core/core.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFD),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: const Color(0xFFE4EAF2)),
                    ),

                    child: const Icon(
                      Icons.warehouse_outlined,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('name',

                            //style: AppTextStyle.mediumBlackBold
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Divider(color: Colors.grey.shade200),

              const SizedBox(height: 6),

              // Row(
              //   children: [
              //     Expanded(
              //       child: OutlinedButton.icon(
              //         onPressed: onTap,
              //         icon: const Icon(Icons.visibility_outlined),
              //         label: const Text("View"),
              //       ),
              //     ),
              //
              //     const SizedBox(width: 12),
              //
              //     Expanded(
              //       child: FilledButton.icon(
              //         onPressed: onEdit,
              //         icon: const Icon(Icons.edit_outlined),
              //         label: const Text("Edit"),
              //       ),
              //     ),
              //
              //     const SizedBox(width: 8),
              //
              //     IconButton(
              //       onPressed: onMore,
              //       icon: const Icon(Icons.more_vert),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
