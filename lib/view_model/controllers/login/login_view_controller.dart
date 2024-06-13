import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/models/Login/user_model.dart';
import 'package:mvvm_getx/repository/login_repository/login_repository.dart';
import 'package:mvvm_getx/resources/routes/routes_name.dart';
import 'package:mvvm_getx/utils/utils.dart';
import 'package:mvvm_getx/view_model/controllers/share_preference/user_preference.dart';

class LoginViewController extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailfocusContoller = FocusNode().obs;
  final passwordfocusContoller = FocusNode().obs;

  final user_preference = UserPreference();

  void isLogin() {
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };
    //print(data);
    _api
        .loginApi(data)
        .then((value) => {
              if (value["error"] == "user not found")
                {
                  Utils.snakbar("Error", "User Not Found"),
                }
              else if (value["error"] == "Missing email or username")
                {Utils.snakbar("Error", "Missing email or username")}
              else if (value["error"] == "Missing password")
                {Utils.snakbar("Error", "Missing email or username")}
              else if (value["error"] == "Missing email")
                {Utils.snakbar("Error", "Missing email")}
              else
                {
                  user_preference
                      .saveUser(
                          UserModel(isLogedin: true, token: value["token"]))
                      .then((value) {
                    Utils.toastMessage("Success");
                    Get.delete<LoginViewController>();
                    Get.toNamed(RoutesName.homeView)!.then((val) {});
                  }).onError((error, stackError) {
                    if (kDebugMode) {
                      print(error.toString());
                    }
                    return Utils.snakbar("Error", error.toString());
                  }),
                }
            })
        .onError((error, stackError) {
      if (kDebugMode) {
        print(error.toString());
      }
      return Utils.snakbar("Error", error.toString());
    });
  }
}
