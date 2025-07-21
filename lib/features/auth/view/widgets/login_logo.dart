import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_showcase/features/auth/view/widgets/login_toggle.dart';

import '../../../../generated/assets.dart';

class LoginLogoAndToggle extends StatelessWidget {
  final bool isPhoneLogin;
  final Function(bool) onToggle;
  const LoginLogoAndToggle({super.key, required this.isPhoneLogin, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: Stack(
        children: [
          Positioned(
            left: -20,
            top: 0,
            child: Image.asset(
              Assets.imagesCircle,
              width: MediaQuery.sizeOf(context).width * 0.41,
              height: 264,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 75,
            top: 55,
            child: SvgPicture.asset(Assets.svgsAppLogo),
          ),
          Positioned(
            top: 250,
            left: MediaQuery.sizeOf(context).width * 0.5 - 150,
            child: LoginToggle(isPhoneLogin: isPhoneLogin, onToggle: onToggle),
          ),
        ],
      ),
    );
  }
}
