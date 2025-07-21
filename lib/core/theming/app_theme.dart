import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class AppTheme {
  static TextStyle textStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily
})=> TextStyle(
    fontSize: fontSize ??32,
    fontWeight: fontWeight ??FontWeight.bold,
    fontFamily: fontFamily ?? primaryFont,
    color: color ??AppColors.primaryColor,

  );
  static TextStyle font32BlackSemiBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: primaryFont,
    color: AppColors.primaryColor,
  );

  static TextStyle font12TextColorBold = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
    fontFamily: primaryFont,
    color: AppColors.textColor,
  );
  static TextStyle font12WhiteExtraBold = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    fontFamily: primaryFont,
    color: AppColors.textColor,
  );
  static TextStyle font16TextColorBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    fontFamily: primaryFont,
    color: AppColors.textColor,
  );

  static TextStyle font16GreyBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    fontFamily: primaryFont,
    color: AppColors.grey,
  );
}