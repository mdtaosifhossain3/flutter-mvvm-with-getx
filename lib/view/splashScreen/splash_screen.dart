import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/view_model/services/splash_screen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  SplashScreenService splashService = SplashScreenService();
  @override
  void initState() {
    splashService.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Text(
        "welcome_back".tr,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }
}
