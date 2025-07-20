import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/theming/app_colors.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
     const SystemUiOverlayStyle(
      statusBarColor: AppColors.notificationStatusBarColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}



