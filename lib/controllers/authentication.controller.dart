import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/controllers/user.controller.dart';

import '../views/home.view.dart';

class AuthenticationController {
  // Path: lib/controllers/authentication.controller.dart
  Future<void> signUp({required String email, required String password}) async {
    try {
      EasyLoading.show(status: 'Loading');
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        EasyLoading.dismiss();
        await UserController().handleNewUser();
      } else {
        EasyLoading.show(status: 'Error');
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        EasyLoading.showError("Password is too weak enter long password");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError("Email already in use");
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        EasyLoading.showError("Invalid email");
        print('The email is invalid');
      }
    } catch (e) {
      EasyLoading.showError("Something went wrong");
      print(e);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(status: 'Loading');
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        EasyLoading.dismiss();
        await UserController().handleNewUser();
      } else {
        EasyLoading.show(status: 'Error');
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        EasyLoading.showError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        EasyLoading.showError('The email is invalid');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    EasyLoading.show(status: 'Logging out...');
    try {
      await FirebaseAuth.instance.signOut();
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }
}
