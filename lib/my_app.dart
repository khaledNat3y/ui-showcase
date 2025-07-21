import 'package:flutter/material.dart';
import 'package:ui_showcase/core/routing/app_router.dart';
import 'package:ui_showcase/core/theming/app_theme_data.dart';

class MyApp extends StatelessWidget {
  final bool rememberMe;

  const MyApp({super.key, required this.rememberMe});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.getRouter(rememberMe),
      theme: AppThemeData.lightTheme(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
