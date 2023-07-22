import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginapp/repository/authentication_repository/exception/signin_email_password_exception.dart';
import 'package:loginapp/repository/authentication_repository/exception/signup_email_password_exception.dart';
import 'package:loginapp/screen/home/home_screen.dart';
import 'package:loginapp/screen/login/signin_screen.dart';

import 'exception/t_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?> (_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => SignInScreen()) : Get.offAll(() => const HomeScreen());
  }

  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.offAll(const HomeScreen());
    } on FirebaseAuthException catch(e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch(_){
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const HomeScreen()) : Get.to(() => SignInScreen());
    } on FirebaseAuthException catch(e) {
      final ex = SignInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch(_){
      const ex = SignInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> sendEmailVerification(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

    } on FirebaseAuthException catch(e) {
      final ex = TExceptions.fromCode(e.code);
      return ex.message;
    } catch(_) {
      const ex = TExceptions();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}