import 'package:board_cut/core/core.dart';
import 'package:board_cut/gen/assets.gen.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class WarehouseDetailPage extends BaseStatefulScreen {
  const WarehouseDetailPage({super.key});

  @override
  BaseState<WarehouseDetailPage> createState() => _WarehouseDetailPageState();
}

class _WarehouseDetailPageState extends BaseState<WarehouseDetailPage> {
  final Map<String, dynamic> orderDetail = {
    'orderId': "O12345",
    'customer': 'ABC',
    'project': 'ABC',
    'createdAt': '01-Jan-2025',
    'deliveryDate': '01-Feb-2025',
    'status': 'Completed',
    'action': 'View',
  };
  final List<Map<String, dynamic>> orderItems = [
    {
      'itemId': "O12345",
      'unit': 'Wardrobe',
      'quantity': '10',
      'dimension': '10X12',
      'status': 'Completed',
      'action': 'View',
    },
    {
      'itemId': "O12345",
      'unit': 'Living Room Shelf',
      'quantity': '5',
      'dimension': '10X12',
      'status': 'Completed',
      'action': 'View',
    },
    {
      'itemId': "O12345",
      'unit': 'Kitchen Cabinet',
      'quantity': '8',
      'dimension': '10X12',
      'status': 'In Progress',
      'action': 'View',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            switch (screenType) {
              ScreenType.mobile => _buildMobileLayout(),
              ScreenType.tablet => _tabletInfoCard(),
              ScreenType.desktop => _buildDesktopLayout(),
            },
          ],
        ),
      ),
    );
  }

  Widget _tabletInfoCard() {
    return Column(
      spacing: 10,
      children: [
        Card(
          color: AppColors.surfaceColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // round rect image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.borderRadius),
                      // Adjust the roundness here
                      child: Image.asset(
                        Assets.images.wh.path,
                        width: 200,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              _header("Ahmedabad main Warehouse"),
                              _status('Active'),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              _infoRow(Icons.person, "MR. Patel"),
                              _infoRow(Icons.phone_outlined, "+91 9876543210"),
                            ],
                          ),
                          _infoRow(Icons.email_outlined, "abc@gmail.com"),

                          // address info row
                          _infoRow(
                            Icons.location_city_outlined,
                            "123, Main Street, Ahmedabad, Gujarat, India",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        _summaryCard(),
      ],
    );
  }

  Widget _desktopInfoCard() {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          flex: 2,
          child: Card(
            color: AppColors.surfaceColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // round rect image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSize.borderRadius,
                        ),
                        // Adjust the roundness here
                        child: Image.asset(
                          Assets.images.wh.path,
                          width: 250,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              _header("Ahmedabad main Warehouse"),
                              _status('Active'),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              _infoRow(Icons.person, "MR. Patel"),
                              _infoRow(Icons.phone_outlined, "+91 9876543210"),
                              _infoRow(Icons.email_outlined, "abc@gmail.com"),
                            ],
                          ),
                          // address info row
                          _infoRow(
                            Icons.location_city_outlined,
                            "123, Main Street, Ahmedabad, Gujarat, India",
                          ),
                          const SizedBox(height: 10),
                          Row(
                            spacing: 10,
                            children: [
                              _sheetInfoItem(
                                label: 'Available Sheets',
                                value: "13",
                              ),
                              _sheetInfoItem(
                                label: 'Available Hardware',
                                value: "13",
                              ),
                              _sheetInfoItem(
                                label: 'Available Pieces',
                                value: "13",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(flex: 1, child: _summaryCard()),
      ],
    );
  }

  Widget _mobileInfoCard() {
    return Column(
      spacing: 10,
      children: [
        Card(
          color: AppColors.surfaceColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.borderRadius),
                      // Adjust the roundness here
                      child: Image.asset(
                        Assets.images.wh.path,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          _header("Ahmedabad main Warehouse"),
                          _status('Active'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        _infoRow(Icons.person, "MR. Patel"),
                        _infoRow(Icons.phone_outlined, "+91 9876543210"),
                      ],
                    ),
                    _infoRow(Icons.email_outlined, "abc@gmail.com"),

                    _infoRow(
                      Icons.location_city_outlined,
                      "123, Main Street, Ahmedabad, Gujarat, India",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        _summaryCard(),
      ],
    );
  }

  Widget _summaryCard() {
    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            _header("Summary"),
            const SizedBox(height: 10),
            Column(
              spacing: 10,
              children: [
                ItemSectionWidget(label: 'Available Sheets', value: "13"),
                ItemSectionWidget(label: 'Available Hardware', value: "50"),
                ItemSectionWidget(label: 'Available Pieces', value: "200"),
                ItemSectionWidget(label: 'Available Hardware', value: "50"),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sheetInfoItem({
    required String label,
    required String value,
    bool hasDivider = true,
  }) {
    return IntrinsicHeight(
      child: Row(
        spacing: 10,
        children: [
          if (hasDivider)
            VerticalDivider(
              color: AppColors.dividerColor,
              // Line color
              thickness: 1,
              // Thickness of the line
              width: 3,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyle.labelMedium.semiBold.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.labelMedium.semiBold.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _status(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.successColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: AppColors.successColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Text(
          value,
          style: AppTextStyle.labelMedium.regular.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _header(String label) {
    return Text(
      label,
      style: AppTextStyle.labelLarge.bold.copyWith(
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildMobileLayout() {
    return _mobileInfoCard();
  }

  Widget _buildDesktopLayout() {
    return _desktopInfoCard();
  }
}
