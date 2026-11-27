import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class UploadItemsPage extends BaseStatefulScreen {
  const UploadItemsPage({super.key});

  @override
  BaseState<UploadItemsPage> createState() => _UploadItemsPageState();
}

class _UploadItemsPageState extends BaseState<UploadItemsPage> {
  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: 500,
          width: !isSmallScreen ? AppSize.dialogWidth : double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DialogHeaderWidget(title: "Upload Items from Excel"),
                const SizedBox(height: 20),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [10, 5],
                                strokeWidth: 1,
                                radius: Radius.circular(AppSize.borderRadius),
                                color: AppColors.primaryColor,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                width: 400,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor.withValues(
                                    alpha: .1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppSize.borderRadius,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: ButtonWidget.primary(
                                        label: 'Choose File',
                                        icon: Icons.upload,
                                        iconPosition: IconPosition.left,
                                        onPressed: () {
                                          router.pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
