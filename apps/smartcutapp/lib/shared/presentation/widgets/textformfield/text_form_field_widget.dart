import 'package:board_cut/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.maxLength,
    this.onChanged,
    this.prefixIcon,
    this.hasLabel = true,
    this.isRequired = false,
    this.validator,
    this.obscureText = false,
    this.autovalidateMode,
  });

  final String? labelText;
  final String? hintText;
  final int maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final bool hasLabel;
  final bool isRequired;
  final String? Function(String?)? validator;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final fieldText = '${widget.labelText ?? ''} ${widget.hintText ?? ''}'
        .toLowerCase();
    final autoMaxLength = widget.maxLength ?? _autoMaxLength(fieldText);
    final autoInputFormatters = _autoInputFormatters(
      fieldText,
      widget.inputFormatters,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // add required asterisk to label if text filed is required
        if (widget.hasLabel)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.labelText ?? '',
                style: AppTextStyle.labelSmall.responsive(context).bold,
              ),
              if (widget.isRequired)
                Text(
                  ' *',
                  style: AppTextStyle.labelSmall
                      .responsive(context)
                      .bold
                      .copyWith(color: Colors.red),
                ),
            ],
          ),
        if (widget.hasLabel) const SizedBox(height: 4),
        TextFormField(
          style: _textStyle(context),
          maxLines: widget.maxLines,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          inputFormatters: autoInputFormatters,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          maxLength: autoMaxLength,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            constraints: widget.maxLines > 1
                ? null
                : const BoxConstraints(minHeight: AppSize.inputHeight),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            counterText: '',
            filled: true,
            // 2. Set your custom background color
            fillColor: Colors.white,
            errorStyle: AppTextStyle.labelSmall
                .responsive(context)
                .regular
                .copyWith(color: AppColors.errorColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              borderSide: BorderSide(color: AppColors.secondaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              borderSide: BorderSide(color: AppColors.secondaryColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              borderSide: BorderSide(color: AppColors.errorColor, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              borderSide: BorderSide(color: AppColors.errorColor, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              borderSide: BorderSide(color: AppColors.secondaryColor, width: 1),
            ),
            // labelText: widget.labelText,
            labelStyle: TextStyle(color: AppColors.secondaryColor),
            hintText: widget.hintText,
            hintStyle: _hintTextStyle(context),
            prefixIcon:
                widget.prefixIcon ?? Icon(_prefixIconForField(), size: 18),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 36,
              minHeight: AppSize.inputHeight,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    tooltip: _obscureText ? 'Show password' : 'Hide password',
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                  )
                : null,
            prefixIconColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.focused)) {
                return AppColors.primaryColor;
              }

              if (states.contains(WidgetState.error)) {
                return const Color(0xFFDC2626); // Error red
              }

              return const Color(0xFF64748B); // Default slate blue
            }),
          ),
        ),
      ],
    );
  }

  TextStyle _hintTextStyle(BuildContext context) {
    return AppTextStyle.bodyXSmall
        .responsive(context)
        .regular
        .copyWith(color: AppColors.textMuted);
  }

  TextStyle _textStyle(BuildContext context) {
    return AppTextStyle.bodyXSmall
        .responsive(context)
        .medium
        .copyWith(color: AppColors.textPrimary);
  }

  int? _autoMaxLength(String fieldText) {
    if (fieldText.contains('pincode') ||
        fieldText.contains('postal') ||
        fieldText.contains('zip code') ||
        fieldText.contains('zip')) {
      return 6;
    }
    if (fieldText.contains('phone') || fieldText.contains('mobile')) {
      return 10;
    }
    return null;
  }

  List<TextInputFormatter> _autoInputFormatters(
    String fieldText,
    List<TextInputFormatter>? customFormatters,
  ) {
    final formatters = <TextInputFormatter>[];
    final isDigitOnlyField =
        fieldText.contains('phone') ||
        fieldText.contains('mobile') ||
        fieldText.contains('pincode') ||
        fieldText.contains('postal') ||
        fieldText.contains('zip code') ||
        fieldText.contains('zip');

    if (isDigitOnlyField) {
      formatters.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (customFormatters != null) {
      formatters.addAll(customFormatters);
    }
    return formatters;
  }

  IconData _prefixIconForField() {
    final text = '${widget.labelText ?? ''} ${widget.hintText ?? ''}'
        .toLowerCase();

    if (text.contains('search')) return Icons.search_rounded;
    if (text.contains('password')) return Icons.lock_outline_rounded;
    if (text.contains('email')) return Icons.email_outlined;
    if (text.contains('phone') || text.contains('mobile')) {
      return Icons.phone_outlined;
    }
    if (text.contains('address')) return Icons.location_on_outlined;
    if (text.contains('city') || text.contains('state')) {
      return Icons.location_city_outlined;
    }
    if (text.contains('postal') ||
        text.contains('pincode') ||
        text.contains('zip')) {
      return Icons.markunread_mailbox_outlined;
    }
    if (text.contains('date')) return Icons.calendar_today_outlined;
    if (text.contains('quantity') || text.contains('stock')) {
      return Icons.numbers_rounded;
    }
    if (text.contains('width') ||
        text.contains('height') ||
        text.contains('depth') ||
        text.contains('thickness') ||
        text.contains('kerf') ||
        text.contains('(mm)')) {
      return Icons.straighten_rounded;
    }
    if (text.contains('status')) return Icons.flag_outlined;
    if (text.contains('note') ||
        text.contains('description') ||
        text.contains('remark') ||
        text.contains('specification')) {
      return Icons.notes_outlined;
    }
    if (text.contains('code') ||
        text.contains('number') ||
        text.contains('reference')) {
      return Icons.tag_rounded;
    }
    if (text.contains('unit')) return Icons.square_foot_outlined;
    if (text.contains('type') || text.contains('category')) {
      return Icons.category_outlined;
    }
    if (text.contains('person') || text.contains('contact')) {
      return Icons.person_outline_rounded;
    }
    if (text.contains('name')) return Icons.inventory_2_outlined;
    if (text.contains('brand')) return Icons.sell_outlined;
    if (text.contains('finish')) return Icons.palette_outlined;
    if (text.contains('ip address') || text.contains('printer')) {
      return Icons.print_outlined;
    }
    if (text.contains('port')) return Icons.settings_ethernet_rounded;
    return Icons.edit_outlined;
  }
}
