import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/resources/components/custom_button.dart';
import 'package:mvvm_getx/utils/utils.dart';
import 'package:mvvm_getx/view_model/controllers/login/login_view_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controller = Get.put(LoginViewController());
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("login_text".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: key,
                child: Column(children: [
                  TextFormField(
                    controller: _controller.emailController.value,
                    focusNode: _controller.emailfocusContoller.value,
                    onFieldSubmitted: (value) {
                      Utils.fileKeyboardFocus(
                          context,
                          _controller.emailfocusContoller.value,
                          _controller.passwordfocusContoller.value);
                    },
                    decoration: InputDecoration(
                        hintText: "email_text".tr,
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _controller.passwordController.value,
                    focusNode: _controller.passwordfocusContoller.value,
                    obscureText: true,
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                        hintText: "password_text".tr,
                        border: const OutlineInputBorder()),
                  ),
                ])),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onpress: () {
                _controller.isLogin();
              },
            )
          ],
        ),
      ),
    );
  }
}
