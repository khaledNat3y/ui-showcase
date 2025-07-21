import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_showcase/core/helpers/shared_pref_helper.dart';
import 'package:ui_showcase/core/routing/routes.dart';
import 'package:ui_showcase/core/theming/app_theme.dart';

import '../../../core/theming/app_colors.dart';

class HomeView extends StatelessWidget {
  final List<String> title;
  final Function(String)? onLogout;
  const HomeView({super.key, required this.title, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: AppTheme.textStyle(),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            SharedPrefHelper.clearAll();
          }, icon: const Icon(Icons.logout, color: AppColors.primaryColor,),),
          Text(title[0], style: AppTheme.textStyle(),),
          Text(title[1], style: AppTheme.textStyle(),),
          IconButton(onPressed: () async {
            await SharedPrefHelper.setRememberMe(false);
            context.goNamed(Routes.login);
          }, icon: const Icon(Icons.logout, color: AppColors.primaryColor,),)
        ],
      ),
    );
  }
}
