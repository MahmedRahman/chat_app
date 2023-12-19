import 'package:chat_app/app/service/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class UserPage extends GetView {
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          if (snapshot.data!.docs.length == 0) {
            return Text("No Data");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

              return Card(
                child: ListTile(
                  onTap: () {
                    Get.find<ChatService>().openChat(
                      FirebaseAuth.instance.currentUser!.uid.toString(),
                      data["id"],
                      data["email"],
                    );
                  },
                  leading: Icon(Icons.person),
                  title: Text(data["email"].toString()),
                  //subtitle: Text(data['company']),
                ),
              );
            }).toList(),
          );
        },
      ),
    ));
  }
}
