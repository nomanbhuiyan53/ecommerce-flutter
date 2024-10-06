import 'package:ecommers/presentation/ui/screens/splash_screen.dart';
import 'package:ecommers/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: AppColors.themeColor,
        progressIndicatorTheme:const ProgressIndicatorThemeData(
          color: AppColors.themeColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: _outlineInputBorder(),
          enabledBorder: _outlineInputBorder(),
          focusedBorder: _outlineInputBorder(),
          errorBorder: _outlineInputBorder(Colors.red),
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:  ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fixedSize: Size.fromWidth(double.maxFinite),
          ),
        )
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return  OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor),
      borderRadius: BorderRadius.circular(8)
    );
  }
}
