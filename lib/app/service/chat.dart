import 'package:chat_app/app/models/chat.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ChatService> init() async {
    // Initialization code here, if needed
    return this;
  }

  Future<void> openChat(String currentUserId, String otherUserId, email) async {
    // Generate a unique chat ID from the currentUserId and otherUserId
    String chatId = generateChatId(currentUserId, otherUserId);

    var chatQuery = await _firestore.collection('chats').doc(chatId).get();

    if (!chatQuery.exists) {
      // If chat does not exist, create a new one
      await _firestore.collection('chats').doc(chatId).set({
        'participants': [currentUserId, otherUserId],
        'email': email,
        'messages': [],
        // Add other necessary chat initialization details
      });
    } else {
      // Chat exists, logic to open the existing chat
      // You can access the chat using chatId
    }
  }

  Stream<List<Chat>> getChats(String currentUserId) {
    return FirebaseFirestore.instance
        .collection('chats')
        .where('participants', arrayContains: currentUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Chat.fromFirestore(doc)).toList());
  }

  String generateChatId(String userId1, String userId2) {
    // Ensure the IDs are always in the same order
    List<String> ids = [userId1, userId2];
    ids.sort();
    return ids.join('_');
  }

  Future<String?> getEmailByUserId(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      DocumentSnapshot userDoc = await firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        // Cast the data to a Map<String, dynamic> to access its fields
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        String? email = userData['email'];
        return email;
      } else {
        // User document does not exist
        return null;
      }
    } catch (e) {
      // Handle any errors here
      print(e);
      return null;
    }
  }
}
