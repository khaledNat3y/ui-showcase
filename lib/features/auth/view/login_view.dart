import 'package:flutter/material.dart';
import 'package:ui_showcase/core/theming/app_colors.dart';
import 'package:ui_showcase/features/auth/view/widgets/email_login_form.dart';
import 'package:ui_showcase/features/auth/view/widgets/login_logo.dart';
import 'package:ui_showcase/features/auth/view/widgets/phone_login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPhoneLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginLogoAndToggle(
              isPhoneLogin: isPhoneLogin,
              onToggle: (value) => setState(() => isPhoneLogin = value),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: isPhoneLogin
                  ? const PhoneLoginForm()
                  : const EmailLoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
