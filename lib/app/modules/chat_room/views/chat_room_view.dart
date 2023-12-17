import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Room"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              // This will be your chat messages list
              children: <Widget>[
                // Placeholder for messages
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildMessageInput(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration.collapsed(
                hintText: "Send a message",
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Implement sending message
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
  }
}
