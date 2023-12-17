import 'package:chat_app/app/models/user.dart';

class Group {
  String groupId;
  String groupName;
  List<User> members;

  Group({required this.groupId, required this.groupName, required this.members});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupId: json['groupId'],
      groupName: json['groupName'],
      members: List<User>.from(json['members'].map((x) => User.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupId': groupId,
      'groupName': groupName,
      'members': List<dynamic>.from(members.map((x) => x.toJson())),
    };
  }
}
