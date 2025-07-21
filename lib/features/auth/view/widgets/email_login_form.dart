import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_showcase/core/constants/my_strings.dart';
import 'package:ui_showcase/core/helpers/app_regex.dart';
import 'package:ui_showcase/core/helpers/shared_pref_helper.dart';
import 'package:ui_showcase/core/routing/routes.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'create_account_button.dart';
import 'custom_button.dart';
import 'enter_as_a_guest_widget.dart';

class EmailLoginForm extends StatefulWidget {
  const EmailLoginForm({super.key});

  @override
  State<EmailLoginForm> createState() => _EmailLoginFormState();
}

class _EmailLoginFormState extends State<EmailLoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isObscure = true;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordFocusNode = FocusNode();

    final savedEmail = SharedPrefHelper.getUserEmail();
    final savedPassword = SharedPrefHelper.getUserPassword();
    var rememberMe = SharedPrefHelper.getRememberMe();

    if (savedEmail != null) {
      emailController.text = savedEmail;
    }
    if (savedPassword != null) {
      passwordController.text = savedPassword;
    }

    setState(() {
      rememberMe = rememberMe;
    });

    if (savedEmail != null && savedEmail.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 200), () {
        passwordFocusNode.requestFocus();
      });
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }


  void handleRememberMe(bool? value) async {
    setState(() {
      rememberMe = value ?? false;
    });

    if (rememberMe) {
      await SharedPrefHelper.setUserEmail(emailController.text);
      await SharedPrefHelper.setUserPassword(passwordController.text);
      await SharedPrefHelper.setRememberMe(value ?? false);
    } else {
      await SharedPrefHelper.clearAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: MyStrings.login,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.right,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return MyStrings.pleaseEnterYourEmail;
                    }
                    if (!AppRegex.isEmailValid(value)) {
                      return MyStrings.pleaseEnterValidEmail;
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                CustomTextFormField(
                  labelText: MyStrings.password,
                  textAlign: TextAlign.right,
                  controller: passwordController,
                  obscureText: isObscure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return MyStrings.passwordIsShort;
                    }
                    if (!AppRegex.isPasswordValid(value)) {
                      return MyStrings.pleaseEnterValidPassword;
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          verticalSpace(8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                log("Forgot password pressed");
              },
              child: Text(
                MyStrings.forgetPassword,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
          ),
          CheckboxListTile(
            value: rememberMe,
            activeColor: AppColors.primaryColor,
            side: const BorderSide(color: AppColors.primaryColor),
            onChanged: handleRememberMe,
            title: const Text(MyStrings.rememberMe),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
          CustomButton(
            text: MyStrings.enter,
            formKey: formKey,
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                SharedPrefHelper.setRememberMe(rememberMe);
                GoRouter.of(context).pushReplacementNamed(
                  Routes.home,
                  extra: [emailController.text, passwordController.text],
                );
              }
            },
          ),
          verticalSpace(20),
          const CreateAccountButton(),
          verticalSpace(24),
          const EnterAsAGuestWidget(),
        ],
      ),
    );
  }
}
