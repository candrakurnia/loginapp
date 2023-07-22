import 'package:flutter/material.dart';
import 'package:loginapp/screen/register/regist_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('assets/images/logo_login.PNG'),
                ),
                Text("Register", style: Theme.of(context).textTheme.displayMedium),
                const RegistForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
