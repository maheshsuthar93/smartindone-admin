import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/presentation/widgets/autocomplete/auto_complete_widget.dart';
import 'package:flutter/material.dart';

import '../sub_header/sub_header.dart';
import '../textformfield/text_form_field_widget.dart';

class RecordListToolbar extends StatelessWidget {
  const RecordListToolbar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.action,
    required this.searchController,
    required this.searchHint,
    required this.onSearchChanged,
    required this.statusOptions,
    required this.selectedStatus,
    required this.onStatusChanged,
    required this.onClear,
  });

  final String title;
  final String subtitle;
  final String description;
  final Widget action;
  final TextEditingController searchController;
  final String searchHint;
  final ValueChanged<String> onSearchChanged;
  final List<String> statusOptions;
  final String selectedStatus;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SubHeader(
              title: title,
              subtitle: subtitle,
              desc: description,
            ),
          ),
          const SizedBox(width: 16),
          action,
        ],
      ),
      const SizedBox(height: 20),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 360,
            child: TextFormFieldWidget(
              controller: searchController,
              onChanged: onSearchChanged,
              hintText: searchHint,
              prefixIcon: const Icon(Icons.search, size: 18),
              hasLabel: false,
            ),
          ),
          if (statusOptions.isNotEmpty) ...[
            const SizedBox(width: 12),
            SizedBox(
              width: 190,
              child: AutoCompleteWidget<String>(
                key: ValueKey(selectedStatus),
                hintText: 'All Status',
                options: statusOptions,
                displayStringForOption: (status) => status,
                initialValue: selectedStatus,
                hasLabel: false,
                prefixIcon: const Icon(Icons.filter_list_outlined, size: 18),
                onSelected: onStatusChanged,
              ),
            ),
          ],
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: onClear,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              minimumSize: const Size(0, 40),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: const Icon(Icons.filter_alt_off_outlined, size: 16),
            label: Text(
              'Clear Filters',
              style: AppTextStyle.labelSmall.responsive(context).medium,
            ),
          ),
        ],
      ),
    ],
  );
}
