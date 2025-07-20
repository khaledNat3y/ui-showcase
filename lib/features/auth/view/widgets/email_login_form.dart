import 'package:flutter/material.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                labelText: "البريد الإلكتروني",
                labelStyle: TextStyle(color: AppColors.textColor),
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
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),

            verticalSpace(16),

            TextFormField(
              obscureText: true,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                labelText: "الرقم السري",
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
                alignLabelWithHint: true,
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
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                prefixIcon: Icon(Icons.visibility_off, color: Colors.grey[400]),
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
                  "نسيت كلمة المرور؟",
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ),
            ),

            verticalSpace(24),

            const CustomButton(text: "الدخول",),
            verticalSpace(20),
            const CreateAccountButton(),
            verticalSpace(24),
            Center(
              child: Text("الدخول كزائر ", style: AppTheme.font16GreyBold.copyWith(
                decoration: TextDecoration.underline,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}



