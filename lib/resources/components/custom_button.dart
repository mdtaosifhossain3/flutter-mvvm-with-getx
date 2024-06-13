import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Function()? onpress;
  const CustomButton({Key? key, required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: double.infinity,
        height: 50.00,
        color: Colors.teal,
        child: Center(
          child: Text(
            "login_button_text".tr,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
