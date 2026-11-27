import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/shipment_package_model.dart';
import '../viewmodels/shipment_detail_view_model.dart';

class ShipmentDetailPage extends BaseStatefulScreen {
  const ShipmentDetailPage({super.key, required this.shipmentId});

  final String shipmentId;

  @override
  BaseState<ShipmentDetailPage> createState() => _ShipmentDetailPageState();
}

class _ShipmentDetailPageState extends BaseState<ShipmentDetailPage> {
  bool _isCompactLayout = false;
  late ShipmentDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = sl<ShipmentDetailViewModel>();
    _viewModel.shipmentId = widget.shipmentId;
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel..fetchShipmentDetail(),

      child: Consumer<ShipmentDetailViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.error != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(viewModel.error!)));
              viewModel.clearError();
            });
          }
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          _isCompactLayout =
              screenType == ScreenType.mobile ||
              screenType == ScreenType.tablet;

          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              primary: true,
              child: switch (screenType) {
                ScreenType.mobile => _buildContent(viewModel),
                ScreenType.tablet => _buildContent(viewModel),
                ScreenType.desktop => _buildContent(viewModel),
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(ShipmentDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              if (_isCompactLayout) ...[
                _shipmentInfo(),
                _deliveryInfo(),
              ] else
                IntrinsicHeight(
                  child: Row(
                    spacing: 16,
                    children: [
                      Expanded(child: _shipmentInfo()),
                      Expanded(child: _deliveryInfo()),
                    ],
                  ),
                ),
              Divider(color: Colors.grey.withAlpha(100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Packages',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _buildCreatePackageAction(viewModel),
                ],
              ),
              if (viewModel.shipmentPackages.isEmpty)
                const EmptyStateWidget(
                  title: 'No packages yet',
                  description:
                      'Packages created for this shipment will appear here.',
                  icon: Icons.inventory_2_outlined,
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _isCompactLayout ? 2 : 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: _isCompactLayout ? 1.65 : 2.15,
                  ),
                  itemCount: viewModel.shipmentPackages.length,
                  itemBuilder: (context, index) {
                    final package = viewModel.shipmentPackages[index];
                    return Card(
                      color: AppColors.surfaceColor, // color of grid items
                      child: InkWell(
                        onTap: () {
                          CreatePackagePageRoute(widget.shipmentId, {
                            'shipmentId': widget.shipmentId,
                            'orderId': viewModel.shipment?.orderId ?? '',
                            'packageId': package.id,
                          }).push(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      package.pieceCode.isEmpty
                                          ? 'Package ${package.pieceNumber}'
                                          : package.pieceCode,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  _packageStatus(package.status ?? 'Unknown'),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _packageDimensions(package),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  _packageCount(
                                    Icons.inventory_2_outlined,
                                    'Pieces',
                                    package.itemsCount ?? 0,
                                  ),
                                  const SizedBox(width: 16),
                                  _packageCount(
                                    Icons.build_outlined,
                                    'Hardware',
                                    package.hardwareCount ?? 0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _packageStatus(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withAlpha(24),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Text(
        status.replaceAll('_', ' '),
        style: TextStyle(fontSize: 10, color: AppColors.primaryColor),
      ),
    );
  }

  Widget _packageCount(IconData icon, String label, int count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.primaryColor),
        const SizedBox(width: 4),
        Text('$count $label', style: const TextStyle(fontSize: 11)),
      ],
    );
  }

  String _packageDimensions(ShipmentPackageModel package) {
    final dimensions = [package.length, package.width, package.height];
    final hasDimensions = dimensions.every((value) => value != null);
    final size = hasDimensions
        ? '${dimensions.map((value) => value!.toStringAsFixed(0)).join(' × ')} mm'
        : 'Dimensions unavailable';
    final weight = package.weight == null ? null : '${package.weight} kg';
    return weight == null ? size : '$size  •  $weight';
  }

  Widget _shipmentInfo() {
    final shipment = _viewModel.shipment;
    return _infoCard(
      title: 'Shipment Information',
      details: [
        _detail('Shipment ID', shipment?.id),
        _detail('Shipment No', shipment?.shipmentNo),
        _detail('Order', shipment?.order.orderCode),
        _detail('Project Name', shipment?.order.project.name),
        _detail('No of Packages', '${_viewModel.shipmentPackages.length}'),
        _detail('Status', shipment?.status.label),
        _detail('Dispatch Date', _formatDate(shipment?.dispatchDate)),
        _detail('Delivery Date', _formatDate(shipment?.deliveryDate)),
      ],
    );
  }

  Widget _deliveryInfo() {
    final shipment = _viewModel.shipment;
    return _infoCard(
      title: 'Delivery Information',
      details: [
        _detail('Address', _deliveryAddressLabel, maxLines: 2),
        _detail('Driver Name', shipment?.driver?.name),
        _detail('Driver Phone', shipment?.driver?.phone),
        _detail('Vehicle Number', shipment?.driver?.vehicleNumber),
        _detail(
          'Delivery Instructions',
          shipment?.deliveryInstructions,
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _infoCard({required String title, required List<Widget> details}) =>
      Card(
        color: AppColors.surfaceColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.labelLarge
                    .responsive(context)
                    .bold
                    .copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 12),
              ...details,
            ],
          ),
        ),
      );

  Widget _detail(String label, String? value, {int maxLines = 2}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: ItemSectionWidget(
      label: label,
      value: value?.trim().isNotEmpty == true ? value! : '—',
      maxLines: maxLines,
    ),
  );

  String _formatDate(DateTime? date) => date == null ? '—' : date.toDdMMMyyyy();

  String get _deliveryAddressLabel => [
    _viewModel.shipment?.deliveryAddress,
    _viewModel.shipment?.deliveryAddress2,
    _viewModel.shipment?.deliveryCity,
    _viewModel.shipment?.deliveryState,
    _viewModel.shipment?.deliveryPostalCode,
    _viewModel.shipment?.deliveryCountry,
  ].whereType<String>().where((part) => part.trim().isNotEmpty).join(', ');

  Widget _buildCreatePackageAction(ShipmentDetailViewModel viewModel) {
    return FilterChip(
      label: Row(
        children: [
          Icon(Icons.add, size: 16, color: AppColors.white),
          SizedBox(width: 4),
          Text("Create Package"),
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      labelStyle: TextStyle(color: AppColors.white),
      onSelected: (_) {
        final orderId = viewModel.shipment?.orderId;
        if (orderId == null || orderId.isEmpty) return;
        CreatePackagePageRoute(widget.shipmentId, {
          'shipmentId': widget.shipmentId,
          'orderId': orderId,
        }).push(context);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final List<ListItem> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Let the ListView know how many items it needs to build.
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          title: item.buildTitle(context),
          subtitle: item.buildSubtitle(context),
        );
      },
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
