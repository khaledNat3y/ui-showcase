import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GlobalKey<FormState> formKey;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.text, required this.formKey, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 245,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
