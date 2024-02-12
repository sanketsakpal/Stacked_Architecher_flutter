import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_architecture_flutter/resources/app_colors.dart';
import 'package:stacked_architecture_flutter/resources/app_font_size.dart';

TextStyle _getTextStyle({
  Color? color,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    height: height,
  );
}

TextStyle getRegularTextStyle({
  Color color = AppColors.black,
  required double fontSize,
  double? letterSpacing,
  double? height,
}) =>
    _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      letterSpacing: letterSpacing,
      height: height,
    );

TextStyle getMediumStyle({
  Color color = AppColors.black,
  required double fontSize,
  double? letterSpacing,
  double? height,
}) =>
    _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      letterSpacing: letterSpacing,
      height: height ?? 1.4,
    );

TextStyle getSemiBoldTextStyle({
  Color color = AppColors.black,
  required double fontSize,
  double? letterSpacing,
  double? height,
}) =>
    _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
      letterSpacing: letterSpacing,
      height: height,
    );

TextStyle getBoldTextStyle({
  Color color = AppColors.black,
  required double fontSize,
  double? letterSpacing,
  double? height,
}) =>
    _getTextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      letterSpacing: letterSpacing,
      height: height,
    );

final labelTextStyle = TextStyle(
  fontFamily: 'Lato',
  color: AppColors.grey,
  fontSize: 14.sp,
);

final inputTextStyle = TextStyle(
  fontFamily: 'Lato',
  color: AppColors.black,
  fontSize: 16.sp,
);

final appBarTextStyle = TextStyle(
  fontFamily: 'TypoRoundBold',
  color: AppColors.darkBlue,
  fontSize: 20.sp,
);

final appBarPrimaryTextStyle = TextStyle(
  fontFamily: 'TypoRoundBold',
  color: AppColors.white,
  fontSize: 20.sp,
);

const errorTextStyle = TextStyle(
  fontFamily: 'Lato',
);
