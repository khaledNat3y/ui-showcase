import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class AppTheme {
  static TextStyle font32BlackSemiBold = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: primaryFont,
    color: AppColors.primaryColor,

  );
}