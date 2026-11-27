import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class InventoryDetailPage extends BaseStatefulScreen {
  const InventoryDetailPage({super.key});

  @override
  BaseState<InventoryDetailPage> createState() => _InventoryDetailPageState();
}

class _InventoryDetailPageState extends BaseState<InventoryDetailPage> {
  final Map<String, dynamic> _inventoryDetail = {
    "offcutId": "OFF001",
    "source": {
      "orderId": "ORD1001",
      "projectId": "PROJ001",
      "cutListId": "CUT001",
      "sheetId": "SHEET-01",
    },
    "material": "Plywood",
    "grade": "BWR",
    "thickness": 18,
    "length": 600,
    "width": 420,
    "dimensionUnit": "mm",
    "areaSqMm": 252000,
    "status": "AVAILABLE",
    "quality": "GOOD",
    "location": {
      "warehouse": "Main Factory",
      "zone": "A",
      "rack": "R2",
      "bin": "B05",
    },
    "reusable": true,
    "timesReused": 0,
    "createdAt": "2026-01-17T14:30:00",
    "remarks": "Clean cut, suitable for shelves",
  };

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                color: AppColors.surfaceColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    spacing: 6,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _header("Sheet Information"),
                                      const SizedBox(height: 10),
                                      ItemSectionWidget(
                                        label: "Material",
                                        value: _inventoryDetail['material']!,
                                      ),
                                      ItemSectionWidget(
                                        label: "Type",
                                        value: "RAW_SHEET".toString(),
                                      ),
                                      ItemSectionWidget(
                                        label: "Status",
                                        value: _inventoryDetail['status']!
                                            .toString(),
                                      ),

                                      ItemSectionWidget(
                                        label: "Remarks",
                                        value: _inventoryDetail['remarks']!,
                                      ),
                                      //
                                      // ItemSectionWidget(
                                      //   label: "Length",
                                      //   value: _inventoryDetail['length']!,
                                      // ),
                                      // ItemSectionWidget(
                                      //   label: "Width",
                                      //   value: _inventoryDetail['width']!,
                                      // ),
                                      //
                                      // ItemSectionWidget(
                                      //   label: "Description",
                                      //   value: _inventoryDetail['description']!,
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: AppColors.surfaceColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    spacing: 6,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _header("Dimensions Information"),
                                      const SizedBox(height: 10),
                                      ItemSectionWidget(
                                        label: "Quality",
                                        value: "10".toString(),
                                      ),
                                      ItemSectionWidget(
                                        label: "Thickness",
                                        value: _inventoryDetail['thickness']!
                                            .toString(),
                                      ),

                                      ItemSectionWidget(
                                        label: "Width",
                                        value: _inventoryDetail['width']!
                                            .toString(),
                                      ),
                                      ItemSectionWidget(
                                        label: "Length",
                                        value: _inventoryDetail['length']!
                                            .toString(),
                                      ),
                                      // ItemSectionWidget(
                                      //   label: "Bottom Edge",
                                      //   value: _inventoryDetail['bottomEdge']!,
                                      // ),
                                      //
                                      // ItemSectionWidget(
                                      //   label: "Left Edge",
                                      //   value: _inventoryDetail['leftEdge']!,
                                      // ),
                                      // ItemSectionWidget(
                                      //   label: "Right Edge",
                                      //   value: _inventoryDetail['rightEdge']!,
                                      // ),
                                      // ItemSectionWidget(
                                      //   label: "Right Edge",
                                      //   value: _inventoryDetail['rightEdge']!,
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }

  Widget _header(String label) {
    return Text(
      label,

      style: AppTextStyle.titleMedium
          .responsive(context)
          .bold
          .copyWith(color: AppColors.white),
    );
  }
}
