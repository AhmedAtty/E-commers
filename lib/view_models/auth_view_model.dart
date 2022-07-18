import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_view/home_view.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  Future<void> signUp(String email, String password, String name) async {
    var reult = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (reult != null) {
      await userRef.doc().set({
        'email': email,
        'password': password,
        'uid': reult.user!.uid,
        'name': name
      }).then((value) {
        Get.back();
        Get.snackbar("OK", "Signed Up");
      });
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      var reult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (reult != null) {
        Get.to(Home());
        Get.snackbar("OK", "Signed In");
        print(reult.user!.uid);
      }
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
        Get.snackbar("Erorr", "The email is wrong",
            backgroundColor: Colors.red.shade300);
      } else if (e.toString() ==
          "[firebase_auth/invalid-email] The email address is badly formatted.") {
        Get.snackbar("Erorr", "wright The email right",
            backgroundColor: Colors.red.shade300);
      } else if (e.toString() ==
          "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
        Get.snackbar("Erorr", "The password is wrong",
            backgroundColor: Colors.red.shade300);
      }
    }
  }
}
