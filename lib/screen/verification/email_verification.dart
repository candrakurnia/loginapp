import 'package:flutter/material.dart';
import 'package:loginapp/screen/verification/mail_verif_widget.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text("Reset Password", style: Theme.of(context).textTheme.displaySmall),
                const EmailVerifWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
