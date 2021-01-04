import 'dart:convert';
import 'package:chatquick/app/models/chat.dart';
import 'package:chatquick/app/models/msm.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

// Stores
import 'package:chatquick/app/stores/data.dart';
import 'package:chatquick/app/stores/session.dart';

// Resource
import 'package:chatquick/app/resource/main_resource.dart';

// Models
import 'package:chatquick/app/models/user.dart';
import 'package:chatquick/app/models/error.dart';
import 'package:chatquick/app/models/pusher.dart';

class ChatController extends GetxController {

  final MainResource _mainResource;

  ChatController(this._mainResource);

  final RxBool ready = RxBool(false);
  final RxBool updateData = RxBool(false);

  final MyData myData = MyData.instance;

  final Session _session = Get.find<Session>();

  PusherService pusherService;

  @override
  void onReady() {
    pusherService = PusherService();
    pusherService.firePusher('chat-quick', 'msm', onChange);
    super.onReady();
  }

  @override
  void onClose() {
    ready.close();
    updateData.close();
    pusherService.unbindEvent('msm');
    pusherService.unSubscribePusher('chat-quick');
    super.onClose();
  }

  void onChange(String data) {
    try {
      final dynamic _data = json.decode(data);
      getUserChat(_data);
    } catch (e) {
    }
  }

  void getUserChat(dynamic data) {
    bool result = false;
    final ChatData _chatData = ChatData.fromJson(data);
    if(myData.myUser.id == _chatData.toUserId.id){
      for (var chat in myData.chats) {
        if(_chatData.fromUserId.id == chat.userChat.id) {
          chat.chats.add(_chatData);
          result = true;
        }
      }
      if(!result) {
        final User user = myData.users.firstWhere((u) => u.id == _chatData.fromUserId.id);
        final Chat chat = Chat(
          userChat: user,
          chats: [_chatData]
        );
        myData.chats.add(chat);
        myData.users.removeWhere((u) => u.id == user.id);
      }
      updateData.value = !updateData.value;
    }
  }

  Future<Either<MyError, bool>> getInfoUser() async {
    final Either<MyError, bool> result = await this._mainResource.getInfoUser();
    return result;
  }

  Future<Either<MyError, bool>> getUsers() async {
    final Either<MyError, bool> result = await this._mainResource.getAllUsers();
    return result;
  }

  Future<Either<MyError, bool>> getChats() async {
    final Either<MyError, bool> result = await this._mainResource.getChats();
    return result;
  }

  void filterListUsers() {
    myData.chats.forEach((chat) {
      myData.users.removeWhere((user) => user.id == chat.userChat.id);
    });
  }

  void logout() {
    _session.logout();
  }


}