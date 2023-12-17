import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  TextEditingController email = TextEditingController(text: "atp@gmail.com");
  TextEditingController pass = TextEditingController(text: "123456789");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              controller: pass,
            ),
            ElevatedButton(
              onPressed: () {
                controller
                    .loginWithEmailPassword(
                  email.text,
                  pass.text,
                )
                    .then((value) {
                  if (value == null) {
                    return;
                  }

                  Get.offAndToNamed(Routes.HOME);
                });
              },
              child: Text("Login"),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.SIGUP);
              },
              child: Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
