import 'package:flutter/material.dart';
import 'package:stacked_architecture_flutter/resources/app_colors.dart';
import 'package:stacked_architecture_flutter/resources/app_font_size.dart';
import 'package:stacked_architecture_flutter/resources/app_styles.dart';
import 'package:stacked_architecture_flutter/resources/app_values.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    iconTheme: IconThemeData(
      color: AppColors.primary,
      size: AppHeight.h24,
    ),
    sliderTheme: const SliderThemeData(
      activeTickMarkColor: AppColors.primary,
      showValueIndicator: ShowValueIndicator.always,
    ),
    appBarTheme: AppBarTheme(
      elevation: 2,
      centerTitle: false,
      titleSpacing: 0,
      shadowColor: AppColors.black.withOpacity(0.5),
      surfaceTintColor: AppColors.white,
      color: AppColors.white,
      titleTextStyle: getSemiBoldTextStyle(
        color: AppColors.primary,
        fontSize: AppFontSize.s20,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primary,
        size: AppHeight.h22,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        color: AppColors.primary,
        size: AppSize.s12,
      ),
      selectedLabelStyle: getMediumStyle(
        fontSize: AppFontSize.s12,
      ),
      unselectedLabelStyle: getMediumStyle(
        color: AppColors.lightGrey,
        fontSize: AppFontSize.s12,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
    cardTheme: CardTheme(
      elevation: 4,
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r16),
      ),
    ),
    dialogTheme: const DialogTheme(
      surfaceTintColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(AppPadding.p16),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.enabledBorder,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.r4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.r4),
      ),
      floatingLabelStyle: getRegularTextStyle(
        color: AppColors.primary,
        fontSize: AppFontSize.s14,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        borderRadius: BorderRadius.circular(AppBorderRadius.r10),
      ),
      labelStyle: getMediumStyle(
        fontSize: AppFontSize.s18,
        color: AppColors.primary,
      ),
      hintStyle: getMediumStyle(
        fontSize: AppFontSize.s18,
        color: AppColors.enabledBorder,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: AppColors.white,
      elevation: 0,
      shadowColor: AppColors.white,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
        (Set<MaterialState> states) => states.contains(MaterialState.pressed)
            ? const IconThemeData(
                color: AppColors.primary,
              )
            : const IconThemeData(
                color: AppColors.grey,
              ),
      ),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) => states.contains(MaterialState.selected)
            ? getSemiBoldTextStyle(
                color: AppColors.primary,
                fontSize: AppFontSize.s12,
              )
            : getMediumStyle(
                color: AppColors.grey,
                fontSize: AppFontSize.s12,
              ),
      ),
    ),
    scaffoldBackgroundColor: AppColors.white,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.primary,
        side: const BorderSide(
          color: AppColors.primary,
        ),
        shape: const StadiumBorder(),
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
          vertical: AppPadding.p10,
        ),
        textStyle: getSemiBoldTextStyle(
          fontSize: AppFontSize.s16,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
          vertical: AppPadding.p10,
        ),
        backgroundColor: AppColors.primary,
        disabledBackgroundColor: AppColors.disabledButton,
        foregroundColor: AppColors.white,
        disabledForegroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.r100,
          ),
        ),
        textStyle: getSemiBoldTextStyle(
          fontSize: AppFontSize.s16,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          // backgroundColor: const Color(0xFFeff4ff),
          // foregroundColor: AppColors.primary,
          // padding: EdgeInsets.all(AppPadding.p14),
          // textStyle: TextStyle(
          //   fontSize: AppFontSize.s16,
          //   fontWeight: FontWeightManager.medium,
          // ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(
          //     AppBorderRadius.r10,
          //   ),
          // ),
          ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: AppFontSize.s14,
      ),
    ),
  );
}
