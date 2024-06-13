import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/resources/localization/language_localization.dart';
import 'package:mvvm_getx/resources/routes/app_routes.dart';
import 'package:mvvm_getx/view/splashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MVVM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: LanguageLocalization(),
      locale: const Locale("en", "BD"),
      fallbackLocale: const Locale("en", "US"),
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
