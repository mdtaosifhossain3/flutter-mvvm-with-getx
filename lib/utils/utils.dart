import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/resources/colors/colors.dart';

class Utils {
  static void fileKeyboardFocus(
      BuildContext context, FocusNode current, FocusNode nextNode) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(msg: msg, backgroundColor: AppColors.blackcolor);
  }

  static snakbar(String title, String message) {
    Get.snackbar(title, message);
  }
}
