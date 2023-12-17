import 'package:chat_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

//final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

class HomeView extends GetView<HomeController> {
  //final String currentUserId = FirebaseAuth.instance.currentUser!.uid.toString(); // Replace with actual current user ID
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          User? currentUser = FirebaseAuth.instance.currentUser;

          controller.addMessage(
            Message(
              message: currentUser!.uid.toString() + DateTime.timestamp().toString(),
              userId: currentUser!.uid.toString(),
            ),
          );
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(
                        Routes.CHAT_ROOM,
                        arguments: data['message'],
                      );
                    },
                    title: Text(data['message']),
                    trailing: Text("currentUser!.uid == data['userId'].toString()"),
                    // subtitle: Text(data['company']),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
