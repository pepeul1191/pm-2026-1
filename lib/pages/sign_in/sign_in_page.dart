// lib/pages/sign_in/sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());
  
  SignInPage({super.key});

  Widget _buildBody(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return SafeArea(child: Text('SignIn Page',style: TextStyle(color: colors.tertiary),));
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
