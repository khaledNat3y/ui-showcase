import 'package:flutter/material.dart';
import 'package:ui_showcase/core/helpers/app_regex.dart';
import 'package:ui_showcase/core/theming/app_theme.dart';
import 'package:ui_showcase/features/auth/view/widgets/create_account_button.dart';
import 'package:ui_showcase/features/auth/view/widgets/custom_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_weight_helper.dart';

class PhoneLoginForm extends StatelessWidget {
  const PhoneLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "ادخل رقم الهاتف";
                  }
                  if(AppRegex.isPhoneNumberValid(value) == false || value.length > 11){
                    return "ادخل رقم هاتف صحيح";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.right,

                decoration: const InputDecoration(
                  labelText: "أدخل رقم الهاتف",
                  labelStyle: TextStyle(color: AppColors.textColor, fontSize: 16,
                      fontWeight: FontWeightHelper.bold),
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
                      horizontal: 16, vertical: 16),
                ),
              ),
            ),
            verticalSpace(24),
        
            CustomButton(text: "ارسل رمز التائكيد", formKey: formKey,),
        
            verticalSpace(24),
           // 24.verticalSpace,
            const CreateAccountButton(),
            verticalSpace(24),
            Center(
              child: Text(
                "الدخول كزائر ", style: AppTheme.font16GreyBold.copyWith(
                decoration: TextDecoration.underline,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
