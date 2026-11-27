import 'package:board_cut/core/theme/app_size.dart';
import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.icon = Icons.info,
  });

  final String title;

  final String subtitle;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFD),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        border: Border.all(color: const Color(0xFFE4EAF2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFEAF2FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info_outline_rounded,
              color: Color(0xFF2563EB),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About these settings',
                  // style: AppTextStyle.mediumSemiBold.copyWith(
                  //   color: Color(0xFF1F2937),
                  //   fontSize: 17,
                  // ),
                ),

                const SizedBox(height: 8),

                Text(
                  'These values are used as the default configuration whenever a new cut optimization '
                  'is created. Existing projects will not be affected by future changes. '
                  'You can update these settings at any time.',
                  // style: AppTextStyle.mediumBlackRegular.copyWith(
                  //   color: Colors.grey.shade700,
                  //   fontSize: 14,
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
