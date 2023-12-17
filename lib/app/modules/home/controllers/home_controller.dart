// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class HomeController extends GetxController {


  CollectionReference Group = FirebaseFirestore.instance.collection('users');

  Future<void> addMessage(Message message) {
    // Call the user's CollectionReference to add a new user
    return Group
        .add(message.toMap())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  void onInit() async {
 
    super.onInit();
  }

 

}





class Message {
  String message;
  String userId;
  DateTime? timestamp = DateTime.timestamp();
  Message({
    required this.message,
    required this.userId,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'userId': userId,
    };
  }

  @override
  String toString() => 'Message(message: $message, userId: $userId)';
}
