import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/printer/printer.dart';
import 'package:board_cut/features/settings/presentation/viewmodels/settings_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends BaseStatefulScreen {
  const SettingsPage({super.key});

  @override
  BaseState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseState<SettingsPage> {
  final _printerIpController = TextEditingController();
  final _printerPortController = TextEditingController(text: '9100');
  final _labelWidthController = TextEditingController(text: '100');
  final _labelHeightController = TextEditingController(text: '50');
  final _viewModel = sl<SettingsViewModel>();
  bool _savingPrinterSettings = false;
  bool _checkingPrinter = false;
  String _printerStatus = 'Not configured';

  @override
  void initState() {
    super.initState();
    _loadPrinterSettings();
  }

  Future<void> _loadPrinterSettings() async {
    final settings = await _viewModel.loadPrinterSettings();
    if (!mounted) return;
    _printerIpController.text = settings.ipAddress;
    _printerPortController.text = settings.port.toString();
    _labelWidthController.text = settings.labelWidthMm.toString();
    _labelHeightController.text = settings.labelHeightMm.toString();
    _printerStatus = _viewModel.printerStatus;
    setState(() {});
  }

  @override
  void dispose() {
    _printerIpController.dispose();
    _printerPortController.dispose();
    _labelWidthController.dispose();
    _labelHeightController.dispose();
    super.dispose();
  }

  Future<void> _savePrinterSettings() async {
    final port = int.tryParse(_printerPortController.text.trim());
    final width = int.tryParse(_labelWidthController.text.trim());
    final height = int.tryParse(_labelHeightController.text.trim());
    if (port == null ||
        port < 1 ||
        port > 65535 ||
        width == null ||
        width < 20 ||
        width > 110 ||
        height == null ||
        height < 50 ||
        height > 300) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid port and label size.')),
      );
      return;
    }
    setState(() => _savingPrinterSettings = true);
    try {
      await _viewModel.savePrinterSettings(
        PrinterSettings(
          ipAddress: _printerIpController.text.trim(),
          port: port,
          labelWidthMm: width,
          labelHeightMm: height,
        ),
      );
      if (mounted) {
        setState(() {
          _printerStatus = _viewModel.printerStatus;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Printer settings saved.')),
        );
      }
    } finally {
      if (mounted) setState(() => _savingPrinterSettings = false);
    }
  }

  Future<void> _testPrinterConnection() async {
    final ip = _printerIpController.text.trim();
    final port = int.tryParse(_printerPortController.text.trim());
    if (ip.isEmpty || port == null || port < 1 || port > 65535) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid printer IP and port.')),
      );
      return;
    }
    setState(() => _checkingPrinter = true);
    try {
      await _viewModel.checkPrinterConnection(ipAddress: ip, port: port);
      if (mounted) {
        setState(() => _printerStatus = _viewModel.printerStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Printer is reachable on the network.')),
        );
      }
    } on UnsupportedError {
      if (mounted) {
        setState(() => _printerStatus = _viewModel.printerStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Direct printer checks require the native app.'),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        setState(() => _printerStatus = _viewModel.printerStatus);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Printer is not reachable. Check its IP and network.',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _checkingPrinter = false);
    }
  }

  Future<void> _forgetPrinter() async {
    await _viewModel.forgetPrinter();
    if (!mounted) return;
    _printerIpController.clear();
    _printerPortController.text = '9100';
    _labelWidthController.text = '100';
    _labelHeightController.text = '50';
    setState(() => _printerStatus = _viewModel.printerStatus);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saved printer settings removed.')),
    );
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeader(
                title: 'Printer Settings',
                subtitle:
                    'Configure the TSC label printer and piece label size.',
                showTitle: false,
              ),
              _printerSettingsCard(),
              _printerStatusRow(),
              Align(alignment: Alignment.centerRight, child: _buildActions()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _printerStatusRow() {
    final statusColor = switch (_printerStatus) {
      'Reachable' => AppColors.completedColor,
      'Not reachable' => AppColors.rejectedColor,
      _ => AppColors.textSecondary,
    };
    final status = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, size: 10, color: statusColor),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            'Printer status: $_printerStatus',
            style: AppTextStyle.labelMedium.semiBold.copyWith(
              color: statusColor,
            ),
          ),
        ),
      ],
    );
    final forgetButton = TextButton.icon(
      onPressed: _printerIpController.text.isEmpty || _checkingPrinter
          ? null
          : _forgetPrinter,
      icon: const Icon(Icons.link_off, size: 16),
      label: const Text('Forget printer'),
    );
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth < 440
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                status,
                Align(alignment: Alignment.centerRight, child: forgetButton),
              ],
            )
          : Row(
              children: [
                Expanded(child: status),
                forgetButton,
              ],
            ),
    );
  }

  Widget _printerSettingsCard() {
    final fields = [
      _buildPrinterIP(),
      _buildPrinterPort(),
      _buildLabelWidth(),
      _buildLabelHeight(),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final useSingleColumn = constraints.maxWidth < 560;
        return Card(
          color: AppColors.surfaceColor,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: useSingleColumn
                ? Column(spacing: 12, children: fields)
                : Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(child: fields[0]),
                          Expanded(child: fields[1]),
                        ],
                      ),
                      Row(
                        spacing: 12,
                        children: [
                          Expanded(child: fields[2]),
                          Expanded(child: fields[3]),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget _buildPrinterIP() {
    return _buildTextFormField(
      labelText: 'Printer IP address',
      hintText: 'e.g. 192.168.1.50',
      controller: _printerIpController,
      onChanged: (_) => _markConnectionUnverified(),
      prefixIcon: const Icon(
        Icons.print,
        color: AppColors.textFieldIcon,
        size: 20,
      ),
    );
  }

  Widget _buildPrinterPort() => _buildTextFormField(
    labelText: 'Printer port',
    hintText: '9100',
    controller: _printerPortController,
    onChanged: (_) => _markConnectionUnverified(),
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    prefixIcon: const Icon(Icons.settings_ethernet, size: 20),
  );

  Widget _buildLabelWidth() => _buildTextFormField(
    labelText: 'Label width (mm)',
    hintText: '100',
    controller: _labelWidthController,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  );

  Widget _buildLabelHeight() => _buildTextFormField(
    labelText: 'Label height (mm)',
    hintText: '50',
    controller: _labelHeightController,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  );

  void _markConnectionUnverified() {
    setState(() {
      _printerStatus = _printerIpController.text.trim().isEmpty
          ? 'Not configured'
          : 'Not checked';
    });
  }

  Widget _buildActions() {
    return Wrap(
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        SizedBox(
          height: 37,
          child: OutlinedButton.icon(
            onPressed: _checkingPrinter ? null : _testPrinterConnection,
            icon: _checkingPrinter
                ? const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.wifi_tethering, size: 16),
            label: Text(_checkingPrinter ? 'Checking...' : 'Check connection'),
            style: OutlinedButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 37,
          child: ElevatedButton.icon(
            onPressed: _savingPrinterSettings ? null : _savePrinterSettings,
            icon: const Icon(Icons.save, size: 15),
            label: Text(_savingPrinterSettings ? 'Saving...' : 'Save Settings'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
              textStyle: AppTextStyle.labelSmall.semiBold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextFormField({
    String? labelText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    String? hintText,
    Icon? prefixIcon,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) {
    return TextFormFieldWidget(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
