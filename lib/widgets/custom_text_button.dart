import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_architecture_flutter/resources/app_colors.dart';
import 'package:stacked_architecture_flutter/resources/app_styles.dart';

/// Create an Custom [TextButton].
/// The [text] parameter must not be null.
/// [onPressed] Signature of callbacks that have no arguments and return no data.
class BuildCustomTextButton extends StatelessWidget {
  const BuildCustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.borderRadius,
    this.padding,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 50.h),
        ),
        backgroundColor: buttonColor,
        padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
      ),
      child: Text(
        text,
        style: getMediumStyle(
            fontSize: 18.sp, color: textColor ?? AppColors.black),
      ),
    );
  }
}
