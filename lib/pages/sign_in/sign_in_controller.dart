import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxString message = ''.obs;
  RxBool success = false.obs;

  void goToSignUp(BuildContext context) {
    print('goToSignUp');
  }

  void goToResetPassword(BuildContext context) {
    print('goToResetPassword');
  }

  void login(BuildContext context) async {
    String user = username.text;
    String passwordStr = password.text;

    // actualizar vista
    message.value = 'XD';
    success.value = true;
  }
}
