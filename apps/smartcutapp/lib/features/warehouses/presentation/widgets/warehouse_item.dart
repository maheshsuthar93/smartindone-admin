import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_size.dart';

class WarehouseItem extends StatelessWidget {
  const WarehouseItem({
    super.key,
    required this.name,
    required this.contactPerson,
    required this.phone,
    required this.email,
    required this.address,
    this.status = WarehouseStatus.active,
    this.onTap,
    this.onEdit,
    this.onMore,
  });

  final String name;
  final String contactPerson;
  final String phone;
  final String email;
  final String address;

  final WarehouseStatus status;

  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onMore;

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
                        Text(name, //style: AppTextStyle.mediumBlackBold

                        ),

                        const SizedBox(height: 6),

                        _StatusChip(status),

                        const SizedBox(height: 14),

                        _InfoRow(Icons.person_outline, contactPerson),

                        const SizedBox(height: 10),

                        _InfoRow(Icons.phone_outlined, phone),

                        const SizedBox(height: 10),

                        _InfoRow(Icons.email_outlined, email),

                        const SizedBox(height: 10),

                        _InfoRow(Icons.location_on_outlined, address),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Divider(color: Colors.grey.shade200),

              const SizedBox(height: 6),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.visibility_outlined),
                      label: const Text("View"),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: FilledButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text("Edit"),
                    ),
                  ),

                  const SizedBox(width: 8),

                  IconButton(
                    onPressed: onMore,
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.primaryColor),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            // style: AppTextStyle.smallBlackRegular.copyWith(
            //   color: Colors.grey.shade700,
            //   height: 1.4,
            // ),
          ),
        ),
      ],
    );
  }
}

enum WarehouseStatus { active, inactive }

class _StatusChip extends StatelessWidget {
  const _StatusChip(this.status);

  final WarehouseStatus status;

  @override
  Widget build(BuildContext context) {
    final isActive = status == WarehouseStatus.active;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffDCFCE7) : const Color(0xffFEE2E2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        isActive ? "Active" : "Inactive",
        style: TextStyle(
          color: isActive ? const Color(0xff15803D) : const Color(0xffDC2626),
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
