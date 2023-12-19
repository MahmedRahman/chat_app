import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<User?> loginWithEmailPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error", // title
          "User not found", // message
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 20,
          duration: Duration(seconds: 2),
        );
        return null;
      }

      Get.snackbar(
        "Error", // title
        e.message.toString(), // message
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 20,
        duration: Duration(seconds: 2),
      );
      print(e.message);

      return null;
    }
  }

  Future<void> addUser(email, id) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          "id": id,
          'email': email,
          'full_name': "fullName", // John Doe
          'company': "company", // Stokes and Sons
          'age': "age",
          // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If the user is successfully created
      if (userCredential.user != null) {
        // You can navigate the user to the next screen or show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User created successfully!')),
        );
        addUser(email, userCredential.user!.uid.toString());
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      // Handle the error cases
      String errorMessage = 'An error occurred';

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      // Display the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      // Handle any other errors that might occur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred')),
      );
    }
  }
}
