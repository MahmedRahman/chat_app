import 'package:chat_app/app/service/auth.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SigupView extends GetView {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regestration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'email',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: email,
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: password,
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<AuthService>().createUserWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                  context: Get.context!,
                );
              },
              child: Text("Sign UP"),
            )
          ],
        ),
      ),
    );
  }
}
