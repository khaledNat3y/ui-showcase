import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/font_weight_helper.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final bool? obscureText;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true, this.onChanged, this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textAlign: textAlign,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.textColor,
          fontSize: 16,
          fontWeight: FontWeightHelper.bold,
        ),
        filled: true,
        fillColor: AppColors.white,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
