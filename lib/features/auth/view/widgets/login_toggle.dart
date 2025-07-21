import 'package:flutter/material.dart';
import 'package:ui_showcase/features/auth/view/widgets/toggle_button.dart';

import '../../../../core/constants/my_strings.dart';
import '../../../../core/theming/app_colors.dart';

class LoginToggle extends StatelessWidget {
  final bool isPhoneLogin;
  final Function(bool) onToggle;

  const LoginToggle({
    super.key,
    required this.isPhoneLogin,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ToggleButton(
              text: MyStrings.enterUsingPhoneNumber,
              isSelected: isPhoneLogin,
              onTap: () => onToggle(true),
            ),
          ),
          Expanded(
            child: ToggleButton(
              text: MyStrings.login,
              isSelected: !isPhoneLogin,
              onTap: () => onToggle(false),
            ),
          ),
        ],
      ),
    );
  }
}
