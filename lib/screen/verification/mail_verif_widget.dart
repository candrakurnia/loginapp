import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/controller/email_verif_controller.dart';
import 'package:loginapp/screen/register/signup_screen.dart';

import '../../controller/login_controller.dart';

class EmailVerifWidget extends StatelessWidget {
  const EmailVerifWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content:
                        Text("Password reset has been sent to ur email"),
                      );
                    },
                  );
                  if (_formKey.currentState!.validate()) {
                    EmailVerificationController.instance
                        .sendVerificationEmail();
                  }
                },
                child: Text("Send Verification".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
