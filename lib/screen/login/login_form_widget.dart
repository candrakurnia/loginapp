import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/screen/register/signup_screen.dart';
import 'package:loginapp/screen/verification/email_verification.dart';

import '../../controller/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30.0),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye),
                  )),
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const EmailVerification());
                  },
                  child: const Text("Forget Password")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    LoginController.instance.login();
                  }
                },
                child: Text("Login".toUpperCase()),
              ),
            ),
            SizedBox(height: 10.0),
            Align(
                alignment: Alignment.center,
                child:
                    TextButton(onPressed: () {
                      Get.to(() => const SignUpScreen());
                    }, child: const Text("SignUp")))
          ],
        ),
      ),
    );
  }
}
