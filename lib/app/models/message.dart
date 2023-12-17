class Message {
  String messageId;
  String text;
  String senderId;
  DateTime timestamp;
  bool isRead;

  Message({
    required this.messageId,
    required this.text,
    required this.senderId,
    required this.timestamp,
    this.isRead = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageId: json['messageId'],
      text: json['text'],
      senderId: json['senderId'],
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'text': text,
      'senderId': senderId,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }
}
