// lib/core/themes/app_theme/theme_light.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors/app_color_light.dart';

import '../../utils/constant.dart';

ThemeData getThemeColorLight(BuildContext context) => ThemeData(
      primaryColor: AppColorLight.primaryColor,
      secondaryHeaderColor: AppColorLight.secondaryColor,
      scaffoldBackgroundColor: AppColorLight.backgroundColor,
      colorScheme: ColorScheme.light(
        outline: Colors.black.withOpacity(.2),
        primaryContainer: AppColorLight.containerBackgroundColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorLight.appBarColor,
        surfaceTintColor: Colors.transparent,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(AppColorLight.iconPrimaryColor),
          foregroundColor:
              WidgetStatePropertyAll(AppColorLight.backgroundColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 47)),
          shape: const WidgetStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              letterSpacing: .7,
              fontFamily: architectsDaughterFont,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateProperty.all(AppColorLight.primaryColor),
          foregroundColor:
              WidgetStateProperty.all(AppColorLight.backgroundColor),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 47)),
          shape: const WidgetStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              letterSpacing: .7,
              fontFamily: architectsDaughterFont,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: const WidgetStatePropertyAll(0),
          side: WidgetStatePropertyAll(
            BorderSide(color: AppColorLight.primaryColor, width: 1.2),
          ),
          foregroundColor: WidgetStateProperty.all(AppColorLight.primaryColor),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColorLight.iconPrimaryColor,
        size: 27,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(AppColorLight.primaryColor),
      ),
      textTheme: TextTheme(
        headlineLarge: _getTextStyle(
            AppColorLight.textPrimary, 32, FontWeight.bold, context),
        headlineMedium: _getTextStyle(
            AppColorLight.textPrimary, 28, FontWeight.bold, context),
        headlineSmall: _getTextStyle(
            AppColorLight.textPrimary, 24, FontWeight.bold, context),
        titleLarge: _getTextStyle(
            AppColorLight.textPrimary, 22, FontWeight.w600, context),
        titleMedium: _getTextStyle(
            AppColorLight.textPrimary, 20, FontWeight.w600, context),
        titleSmall: _getTextStyle(
            AppColorLight.textPrimary, 18, FontWeight.w500, context),
        bodyLarge: _getTextStyle(
            AppColorLight.textSecondary, 16, FontWeight.normal, context),
        bodyMedium: _getTextStyle(
            AppColorLight.textSecondary, 14, FontWeight.normal, context),
        bodySmall: _getTextStyle(
            AppColorLight.textSecondary, 12, FontWeight.normal, context),
        labelLarge: _getTextStyle(
            AppColorLight.textTertiary, 16, FontWeight.w500, context),
        labelMedium: _getTextStyle(
            AppColorLight.textTertiary, 14, FontWeight.w500, context),
        labelSmall: _getTextStyle(
            AppColorLight.textTertiary, 12, FontWeight.w500, context),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorLight.containerBackgroundColor.withOpacity(.6),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorLight.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorLight.primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColorLight.errorColor.withOpacity(.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorLight.errorColor),
        ),
        prefixIconColor: AppColorLight.primaryColor,
        labelStyle: TextStyle(
          color: AppColorLight.primaryColor,
          fontSize: 16.0.sp,
        ),
        hintStyle: TextStyle(
          color: AppColorLight.textTertiary,
          fontSize: 17.sp,
          fontWeight: FontWeight.normal,
        ),
        errorStyle: TextStyle(
          color: AppColorLight.errorColor,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColorLight.backgroundColor,
        dragHandleSize: Size(double.infinity, 4),
        dragHandleColor: AppColorLight.primaryColor,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColorLight.primaryColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontSize: 18.sp,
            ),
          ),
          foregroundColor: WidgetStatePropertyAll(
            AppColorLight.linkTextColor,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColorLight.dividerColor,
        thickness: 1.2,
        endIndent: 10,
        indent: 10,
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: AppColorLight.primaryColor),
        checkColor: WidgetStatePropertyAll(AppColorLight.primaryColor),
        fillColor: WidgetStatePropertyAll(AppColorLight.backgroundColor),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColorLight.backgroundColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColorLight.primaryColor,
        unselectedItemColor: AppColorLight.textDisabled,
        elevation: 10,
      ),
    );

TextStyle _getTextStyle(
    Color color, double fontSize, FontWeight fontWeight, BuildContext context) {
  return TextStyle(
    color: color,
    fontFamily: architectsDaughterFont,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}
