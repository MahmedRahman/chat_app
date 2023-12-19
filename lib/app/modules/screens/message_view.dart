import 'package:chat_app/app/models/chat.dart';
import 'package:chat_app/app/models/message.dart';
import 'package:chat_app/app/service/chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MessagePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: StreamBuilder<List<Chat>>(
        stream: Get.find<ChatService>().getChats(FirebaseAuth.instance.currentUser!.uid.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No chats found');
          }

          List<Chat> chats = snapshot.data!;

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.chat),
                  title: Text(chats[index].email.toString()),
                  onTap: () {
                    // Navigate to chat screen or perform other actions
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
