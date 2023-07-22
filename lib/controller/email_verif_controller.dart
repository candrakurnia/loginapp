import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/repository/authentication_repository/authentication_repository.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();

  final email = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendVerificationEmail();  }

  Future<void> sendVerificationEmail() async {
    await AuthenticationRepository.instance.sendEmailVerification(email.text.trim());

  }
}