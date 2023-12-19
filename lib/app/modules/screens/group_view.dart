import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class GroupPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          User? currentUser = FirebaseAuth.instance.currentUser;

          // controller.addMessage(
          //   Message(
          //     message: currentUser!.uid.toString() + DateTime.timestamp().toString(),
          //     userId: currentUser!.uid.toString(),
          //   ),
          // );
        },
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
