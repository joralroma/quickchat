import 'package:chatquick/app/models/user.dart';

class Chat {

  User userChat;
  List<ChatData> chats;

  Chat({
    User userChat,
    List<ChatData> chats
  }) {
    this.userChat = userChat;
    this.chats = chats;
  }

  static Chat fromJson(json) {
    Chat chat = new Chat(
      userChat: User.fromJson(json['userChat']),
      chats: ChatData.fromJsonList(json['chats']),
    );
    return chat;
  }

  static List<Chat> fromJsonList(Iterable data) {
    List<Chat> list = [];
    for (var e in data) list.add(fromJson(e));
    return list;
  }

}

class ChatData {

  String id;
  User fromUserId;
  User toUserId;
  String text;
  String creationDate;

  ChatData({
    String id,
    User fromUserId,
    User toUserId,
    String text,
    String creationDate,
  }) {
    this.id = id;
    this.fromUserId = fromUserId;
    this.toUserId = toUserId;
    this.text = text;
    this.creationDate = creationDate;
  }

  static ChatData fromJson(json) {
    ChatData chatData;
    if(json != null) {
      chatData = new ChatData(
        id: json['_id'],
        fromUserId: User.fromJson(json['fromUserId']),
        toUserId: User.fromJson(json['toUserId']),
        text: json['text'],
        creationDate: json['creationDate'],
      );
    }
    return chatData;
  }

  static List<ChatData> fromJsonList(Iterable data) {
    List<ChatData> list = [];
    for (var e in data) list.add(fromJson(e));
    return list;
  }

}