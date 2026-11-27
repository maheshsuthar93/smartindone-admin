import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';

class OrderProgressTracker extends StatelessWidget {
  final OrderStatus currentStatus;

  const OrderProgressTracker({super.key, required this.currentStatus});

  @override
  Widget build(BuildContext context) {
    final steps = [
      StatusStep("Draft", OrderStatus.draft),
      StatusStep("Approved", OrderStatus.approved),
      StatusStep("In Production", OrderStatus.inProduction),
      StatusStep("Completed", OrderStatus.completed),
      StatusStep("Shipped", OrderStatus.shipped),
      StatusStep("Delivered", OrderStatus.delivered),
    ];

    final currentIndex = steps.indexWhere((e) => e.status == currentStatus);

    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Progress",
              // style: AppTextStyle.mediumBlackBold.copyWith(
              //   color: AppColors.textPrimary,
              // ),
            ),
            const SizedBox(height: 30),
            if (currentStatus == OrderStatus.cancelled)
              Text(
                'Cancelled',
                style: AppTextStyle.labelMedium.semiBold.copyWith(
                  color: AppColors.rejectedColor,
                ),
              )
            else
              LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: constraints.maxWidth < 600
                        ? 720
                        : constraints.maxWidth,
                    child: Row(
                      children: List.generate(steps.length * 2 - 1, (index) {
                        if (index.isEven) {
                          final stepIndex = index ~/ 2;
                          return Expanded(
                            child: _buildStep(
                              context,
                              step: steps[stepIndex],
                              index: stepIndex,
                              currentIndex: currentIndex,
                            ),
                          );
                        } else {
                          final lineIndex = (index - 1) ~/ 2;
                          return Expanded(
                            child: _buildLine(
                              isActive: lineIndex < currentIndex,
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required StatusStep step,
    required int index,
    required int currentIndex,
  }) {
    final isCompleted = index < currentIndex;
    final isCurrent = index == currentIndex;

    Color circleColor;
    Widget child;

    if (isCompleted) {
      circleColor = Colors.green;
      child = const Icon(Icons.check, color: Colors.white, size: 20);
    } else if (isCurrent) {
      circleColor = AppColors.primaryColor;
      child = Text(
        "${index + 1}",
        // style: AppTextStyle.mediumBlackBold.copyWith(
        //   fontSize: 14,
        //   color: AppColors.white,
        // ),
      );
    } else {
      circleColor = AppColors.secondaryColor;
      child = Text(
        "${index + 1}",
        // style: AppTextStyle.mediumBlackRegular.copyWith(
        //   fontSize: 12,
        //   color: AppColors.white,
        // ),
      );
    }

    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: isCompleted
                  ? Colors.green
                  : isCurrent
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              width: 2,
            ),
          ),
          alignment: Alignment.center,
          child: child,
        ),
        const SizedBox(height: 12),
        Text(
          step.label,
          style: TextStyle(
            color: isCompleted
                ? Colors.green
                : isCurrent
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
            fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildLine({required bool isActive}) {
    return Container(
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: isActive ? Colors.green : Colors.black,
    );
  }
}

class StatusStep {
  final String label;
  final OrderStatus status;

  StatusStep(this.label, this.status);
}
