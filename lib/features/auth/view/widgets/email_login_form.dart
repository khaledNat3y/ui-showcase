import 'package:flutter/material.dart';
import 'package:ui_showcase/core/constants/my_strings.dart';
import 'package:ui_showcase/core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_theme.dart';
import '../../../../core/theming/font_weight_helper.dart';
import 'create_account_button.dart';
import 'custom_button.dart';

class EmailLoginForm extends StatelessWidget {
  const EmailLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return MyStrings.pleaseEnterYourEmail;
                    }
                    if (AppRegex.isEmailValid(value) == false) {
                      return MyStrings.pleaseEnterValidEmail;
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    labelText: MyStrings.login,
                    labelStyle: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    alignLabelWithHint: true,
                    filled: true,
                    fillColor: AppColors.white,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                verticalSpace(16),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return MyStrings.pleaseEnterYourPassword;
                    }
                    if (AppRegex.isPasswordValid(value) == false) {
                      return MyStrings.pleaseEnterValidPassword;
                    }
                    return null;
                  },
                  obscureText: true,
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    labelText: MyStrings.password,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    alignLabelWithHint: true,
                    filled: true,
                    fillColor: AppColors.white,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          verticalSpace(8),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                print("Forgot password pressed");
              },
              child: Text(
                MyStrings.forgetPassword,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
          ),

          verticalSpace(24),

          CustomButton(text: "الدخول", formKey: formKey),
          verticalSpace(20),
          const CreateAccountButton(),
          verticalSpace(24),
          Center(
            child: Text(
              "الدخول كزائر ",
              style: AppTheme.font16GreyBold.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
