import 'package:flutter/material.dart';
import 'package:ui_showcase/core/theming/app_theme_data.dart';

import 'features/auth/view/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المصري',
      theme: AppThemeData.lightTheme(context),
      locale: const Locale("ar"),
      home: const LoginScreen(),
    );
  }
}
