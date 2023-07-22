import 'package:flutter/material.dart';
import 'package:loginapp/screen/login/login_form_widget.dart';
import 'package:loginapp/screen/verification/mail_verif_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40.0),
                const Image(
                  image: AssetImage('assets/images/logo_login.PNG'),
                ),
                Text("Login", style: Theme.of(context).textTheme.displayMedium),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
