import 'package:flutter/material.dart';
import 'package:loginapp/repository/authentication_repository/authentication_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                Text("Ini dashboard", style: Theme.of(context).textTheme.displayMedium),
                ElevatedButton(onPressed: (){
                  AuthenticationRepository.instance.logout();
                }, child: Text("LogOut"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
