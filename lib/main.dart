import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/config/app_colors.dart';
import 'app/pages/base_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'iLearn',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        appBarTheme: const AppBarTheme(
          color: AppColors.primaryDark,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
          elevation: 1,
        ),
      ),
      debugShowCheckedModeBanner: false,
      //initialRoute: AppRoutes.splash,
      //getPages: AppPages.pages,
      home: const BasePage(),
    );
  }
}
