import 'package:flutter/material.dart';
import 'package:ui_showcase/core/constants/my_strings.dart';
import 'package:ui_showcase/core/helpers/app_regex.dart';
import 'package:ui_showcase/core/theming/app_theme.dart';
import 'package:ui_showcase/features/auth/view/widgets/create_account_button.dart';
import 'package:ui_showcase/features/auth/view/widgets/custom_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'enter_as_a_guest_widget.dart';

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
              child: CustomTextFormField(
                labelText: MyStrings.enterPhoneNumber,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.right,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return MyStrings.enterPhoneNumber;
                  }
                  if (!AppRegex.isPhoneNumberValid(value) || value.length > 11) {
                    return MyStrings.enterCorrectPhoneNumber;
                  }
                  return null;
                },
              ),
            ),
            verticalSpace(24),
            CustomButton(text: MyStrings.confirmationMessage, formKey: formKey, onPressed: (){
              if(formKey.currentState!.validate()){
                debugPrint("valid");
              }
            },),
        
            verticalSpace(24),
            const CreateAccountButton(),
            verticalSpace(24),
            const EnterAsAGuestWidget(),
          ],
        ),
      ),
    );
  }
}




