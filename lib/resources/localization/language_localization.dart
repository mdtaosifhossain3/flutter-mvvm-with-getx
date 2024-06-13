import 'package:get/get.dart';

class LanguageLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "hint": "abcdef",
          "welcome_back": "Welcome Back",
          "email_text": "Enter Email",
          "password_text": "Enter Password",
          "login_text": "Login",
          "login_button_text": "Login",
        },
        'bn_BD': {"hint": "আমি"},
      };
}
