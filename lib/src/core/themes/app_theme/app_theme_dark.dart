// lib/core/themes/app_theme/theme_light.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_taking_app/src/core/themes/app_colors/app_color_dark.dart';

import '../../utils/constant.dart';

ThemeData getThemeColorDark(BuildContext context) => ThemeData(
      primaryColor: AppColorDark.primaryColor,
      secondaryHeaderColor: AppColorDark.secondaryColor,
      scaffoldBackgroundColor: AppColorDark.backgroundColor,
      colorScheme: ColorScheme.light(
        outline: Colors.black.withOpacity(.2),
        primaryContainer: AppColorDark.containerBackgroundColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorDark.appBarColor,
        surfaceTintColor: Colors.transparent,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(AppColorDark.iconPrimaryColor),
          foregroundColor: WidgetStatePropertyAll(AppColorDark.backgroundColor),
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
          backgroundColor: WidgetStateProperty.all(AppColorDark.primaryColor),
          foregroundColor:
              WidgetStateProperty.all(AppColorDark.backgroundColor),
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
            BorderSide(color: AppColorDark.primaryColor, width: 1.2),
          ),
          foregroundColor: WidgetStateProperty.all(AppColorDark.primaryColor),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColorDark.iconPrimaryColor,
        size: 27,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(AppColorDark.primaryColor),
      ),
      textTheme: TextTheme(
        headlineLarge: _getTextStyle(
            AppColorDark.textPrimary, 32, FontWeight.bold, context),
        headlineMedium: _getTextStyle(
            AppColorDark.textPrimary, 28, FontWeight.bold, context),
        headlineSmall: _getTextStyle(
            AppColorDark.textPrimary, 24, FontWeight.bold, context),
        titleLarge: _getTextStyle(
            AppColorDark.textPrimary, 22, FontWeight.w600, context),
        titleMedium: _getTextStyle(
            AppColorDark.textPrimary, 20, FontWeight.w600, context),
        titleSmall: _getTextStyle(
            AppColorDark.textPrimary, 18, FontWeight.w500, context),
        bodyLarge: _getTextStyle(
            AppColorDark.textSecondary, 16, FontWeight.normal, context),
        bodyMedium: _getTextStyle(
            AppColorDark.textSecondary, 14, FontWeight.normal, context),
        bodySmall: _getTextStyle(
            AppColorDark.textSecondary, 12, FontWeight.normal, context),
        labelLarge: _getTextStyle(
            AppColorDark.textTertiary, 16, FontWeight.w500, context),
        labelMedium: _getTextStyle(
            AppColorDark.textTertiary, 14, FontWeight.w500, context),
        labelSmall: _getTextStyle(
            AppColorDark.textTertiary, 12, FontWeight.w500, context),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorDark.containerBackgroundColor.withOpacity(.6),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorDark.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorDark.primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColorDark.errorColor.withOpacity(.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorDark.errorColor),
        ),
        prefixIconColor: AppColorDark.primaryColor,
        labelStyle: TextStyle(
          color: AppColorDark.primaryColor,
          fontSize: 16.0.sp,
        ),
        hintStyle: TextStyle(
          color: AppColorDark.textTertiary,
          fontSize: 17.sp,
          fontWeight: FontWeight.normal,
        ),
        errorStyle: TextStyle(
          color: AppColorDark.errorColor,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColorDark.backgroundColor,
        dragHandleSize: Size(double.infinity, 4),
        dragHandleColor: AppColorDark.primaryColor,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColorDark.primaryColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontSize: 18.sp,
            ),
          ),
          foregroundColor: WidgetStatePropertyAll(
            AppColorDark.linkTextColor,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColorDark.dividerColor,
        thickness: 1.2,
        endIndent: 10,
        indent: 10,
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: AppColorDark.primaryColor),
        checkColor: WidgetStatePropertyAll(AppColorDark.primaryColor),
        fillColor: WidgetStatePropertyAll(AppColorDark.backgroundColor),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColorDark.backgroundColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColorDark.primaryColor,
        unselectedItemColor: AppColorDark.textDisabled,
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
