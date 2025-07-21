import 'package:flutter/material.dart';
import 'package:ui_showcase/core/helpers/shared_pref_helper.dart';
import 'package:ui_showcase/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();

  final rememberMe = SharedPrefHelper.getRememberMe();

  runApp(MyApp(rememberMe: rememberMe));
}
