import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String id;
  final String email;
  final List<String> participants;
  // Add other relevant fields, such as lastMessage, timestamp, etc.

  Chat({required this.id, required this.email, required this.participants});

  factory Chat.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Chat(
      id: doc.id,
      email: data['email'],
      participants: List<String>.from(data['participants']),
      // Initialize other fields
    );
  }
}
