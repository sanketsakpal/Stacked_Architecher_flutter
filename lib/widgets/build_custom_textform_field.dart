import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_architecture_flutter/resources/app_colors.dart';
import 'package:stacked_architecture_flutter/resources/app_styles.dart';

/// This is a custom text form filed used across the app displaying the widget
class BuildCustomTextFormField extends StatelessWidget {
  const BuildCustomTextFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.labelText,
    this.hintText,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.errorMaxLines,
    this.filled,
    this.fillColor,
    this.isPassword = false,
    this.enabled,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.autofillHints,
    this.focusNode,
    this.autocorrect = true,
    this.autofocus = false,
    this.autovalidateMode,
    this.initialValue,
    this.counterText,
    this.contentPadding,
    this.inputFormatters,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.textFieldHeight,
    this.onTap,
    this.cursorColor = Colors.black,
    this.isDense = true,
    this.textCapitalization = TextCapitalization.none,
    this.prefixText,
    this.prefix,
    this.textAlign = TextAlign.start,
    this.scrollPadding,
    this.readOnly,
    this.enableInteractiveSelection = true,
    this.showCursor = true,
    this.maxLength,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final String? labelText;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final bool? filled;
  final bool? enabled;
  final Color? fillColor;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool autocorrect;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;
  final String? counterText;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool? alignLabelWithHint;
  final double? textFieldHeight;
  final VoidCallback? onTap;
  final Color? cursorColor;
  final bool? isDense;
  final TextCapitalization textCapitalization;
  final String? prefixText;
  final Widget? prefix;
  final TextAlign textAlign;
  final EdgeInsets? scrollPadding;
  final bool? readOnly;
  final bool? enableInteractiveSelection;
  final bool? showCursor;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: textFieldHeight,
      child: TextFormField(
        maxLength: maxLength,
        readOnly: readOnly ?? false,
        showCursor: showCursor,
        enableInteractiveSelection:
            isPassword ? false : enableInteractiveSelection,
        textAlign: textAlign,
        key: key,
        controller: controller,
        cursorColor: AppColors.black,
        scrollPadding: scrollPadding ?? const EdgeInsets.all(36.0),
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        style: style ?? inputTextStyle,
        obscureText: isPassword,
        decoration: InputDecoration(
          alignLabelWithHint: alignLabelWithHint,
          prefixText: prefixText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.h),
            borderSide: const BorderSide(
              color: AppColors.black,
            ),
          ),
          errorBorder: errorBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder,
          filled: filled,
          fillColor: fillColor,
          hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle ?? labelTextStyle,
          hintStyle: hintStyle,
          errorStyle: errorStyle ?? errorTextStyle,
          errorMaxLines: errorMaxLines,
          prefix: prefix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          counterText: counterText,
          contentPadding: contentPadding,
          isDense: isDense,
        ),
        initialValue: initialValue,
        autocorrect: autocorrect,
        autovalidateMode: autovalidateMode,
        autofocus: autofocus,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        autofillHints: autofillHints,
        focusNode: focusNode,
        enabled: enabled,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        textCapitalization: textCapitalization,
      ),
    );
  }
}
