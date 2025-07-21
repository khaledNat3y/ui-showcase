import 'package:flutter/material.dart';

import '../../../../core/constants/my_strings.dart';
import '../../../../core/theming/app_theme.dart';

class EnterAsAGuestWidget extends StatelessWidget {
  const EnterAsAGuestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        MyStrings.enterAsAGuest, style: AppTheme.font16GreyBold.copyWith(
        decoration: TextDecoration.underline,
      ),),
    );
  }
}
