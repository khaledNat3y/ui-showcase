import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_showcase/core/helpers/spacing.dart';
import 'package:ui_showcase/core/theming/app_colors.dart';
import 'package:ui_showcase/core/theming/app_theme.dart';
import 'package:ui_showcase/features/auth/view/widgets/email_login_form.dart';
import 'package:ui_showcase/features/auth/view/widgets/phone_login_form.dart';
import 'package:ui_showcase/features/auth/view/widgets/toggle_button.dart';

import '../../../generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPhoneLogin = false; // Changed to false to default to email login

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Stack(
                  children: [
                    Positioned(
                      left: -20,
                      top: 0,
                      child: Image.asset(
                        Assets.imagesCircle,
                        width: MediaQuery
                            .sizeOf(context)
                            .width * 0.41,
                        height: 264,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      right: 75,
                      top: 22,
                      child: SvgPicture.asset(Assets.svgsAppLogo),
                    ),
                    Positioned(
                      top: 250,
                      left: MediaQuery.sizeOf(context).width * 0.5 - 150,
                      child: _buildLoginToggle(),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: isPhoneLogin
                      ? const PhoneLoginForm()
                      : const EmailLoginForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginToggle() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: ToggleButton(text: "الدخول برقم الهاتف",
              isSelected: isPhoneLogin,
              onTap: () {
                if (!isPhoneLogin) {
                  setState(() {
                    isPhoneLogin = true;
                  });
                }
              },),
          ),
          Expanded(
            child: ToggleButton(
              text: "تسجيل الدخول",
              isSelected: !isPhoneLogin,
              onTap: () {
                if (isPhoneLogin) {
                  setState(() {
                    isPhoneLogin = false;
                  });
                }
              },
            )
          ),
        ],
      ),
    );
  }


}