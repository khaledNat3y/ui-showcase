import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_showcase/core/helpers/constants.dart';
import 'app_colors.dart';

abstract class AppThemeData {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: GoTransitions.slide.toRight,
          TargetPlatform.iOS: GoTransitions.slide.toRight,
        },
      ),
      fontFamily: primaryFont,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primaryColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.primaryColor,
        // Change cursor color
        selectionColor: AppColors.primaryColor.withValues(alpha: 0.5),
        // Change selection highlight color
        selectionHandleColor:
            AppColors
                .primaryColor, // Change the color of selection handles (balls)
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        disabledColor: AppColors.grey.withValues(alpha: 0.5),
      ),
    );
  }

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}

