import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/resources/routes/routes_name.dart';
import 'package:mvvm_getx/view_model/controllers/share_preference/user_preference.dart';

class SplashScreenService {
  final user = UserPreference();
  void isLogin() {
    user.getUser().then((value) {
      if (value.isLogedin == null) {
        Timer(const Duration(seconds: 3), () {
          Get.offAllNamed(RoutesName.loginView);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.offAllNamed(RoutesName.homeView);
        });
      }
    }).onError((error, errorTrace) {
      if (kDebugMode) {
        print(error);
        print(errorTrace);
      }
    });
  }
}
