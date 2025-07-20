import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_weight_helper.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 245,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.textColor),
            ),
            elevation: 0,
          ),
          child: const Text(
            "انشاء حساب",
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ),
    );
  }
}
