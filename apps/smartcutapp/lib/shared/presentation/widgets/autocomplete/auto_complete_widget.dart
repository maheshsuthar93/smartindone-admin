import 'package:board_cut/core/theme/app_size.dart';
import 'package:board_cut/shared/presentation/widgets/textformfield/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class AutoCompleteWidget<T extends Object> extends StatelessWidget {
  const AutoCompleteWidget({
    super.key,
    this.labelText,
    this.hintText,
    required this.options,
    required this.displayStringForOption,
    required this.onSelected,
    this.filterFn,
    this.initialValue,
    this.prefixIcon,
    this.hasLabel = true,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.autovalidateMode,
  });

  final String? labelText;
  final String? hintText;
  final List<T> options;
  final String Function(T) displayStringForOption;
  final void Function(T) onSelected;
  final bool Function(T option, String query)? filterFn;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool hasLabel;
  final bool isRequired;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      displayStringForOption: displayStringForOption,
      initialValue: TextEditingValue(text: initialValue ?? ''),
      optionsBuilder: (TextEditingValue textEditingValue) {
        final query = textEditingValue.text.trim().toLowerCase();

        if (query.isEmpty) {
          // return Iterable<T>.empty();

          return options;
        }

        return options.where((option) {
          if (filterFn != null) {
            return filterFn!(option, query);
          }

          // Default filtering (based on display string)
          return displayStringForOption(option).toLowerCase().contains(query);
        });
      },
      optionsViewBuilder: (context, onSelected, options) => Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);
                final isHighlighted =
                    AutocompleteHighlightedOption.of(context) == index;
                return InkWell(
                  onTap: () => onSelected(option),
                  child: Container(
                    color: isHighlighted
                        ? Theme.of(context).colorScheme.surfaceContainerHighest
                        : null,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(displayStringForOption(option)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) => _fieldViewBuilder(
            context,
            textEditingController,
            focusNode,
            onFieldSubmitted,
            validator: validator,
            onChanged: onChanged,
            hasLabel: hasLabel,
            autovalidateMode: autovalidateMode,
          ),
      onSelected: onSelected,
    );
  }

  Widget _fieldViewBuilder(
    BuildContext context,
    TextEditingController textEditingController,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted, {
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
    bool hasLabel = true,
    AutovalidateMode? autovalidateMode,
  }) {
    return TextFormFieldWidget(
      focusNode: focusNode,
      controller: textEditingController,
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon,
      hasLabel: hasLabel,
      isRequired: isRequired,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      //onFieldSubmitted: onFieldSubmitted,
    );
  }
}
