import 'package:get/get.dart';
import 'package:mvvm_getx/models/Login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController {
  Future<bool> saveUser(UserModel user) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    sp.setBool("isLogedin", user.isLogedin!);

    return true;
  }

  Future<UserModel> getUser() async {
    final sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    final bool? isLogedin = sp.getBool("isLogedin");

    return UserModel(token: token, isLogedin: isLogedin);
  }

  Future<bool> removeUser() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();

    return true;
  }
}
