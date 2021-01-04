import 'package:get/get.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';

// Models
import 'package:chatquick/app/models/error.dart';

// Shared
import 'package:chatquick/app/modules/shared/modal.dart';

// Widgets
import 'package:chatquick/app/modules/home/chat/widgets/empty.dart';
import 'package:chatquick/app/modules/home/chat/widgets/header.dart';
import 'package:chatquick/app/modules/home/chat/widgets/user_item.dart';
import 'package:chatquick/app/modules/home/chat/widgets/chat_item.dart';

// Controller
import 'package:chatquick/app/modules/home/chat/chat_controller.dart';

class ChatPage extends StatefulWidget {

  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final ChatController _chatController = Get.find<ChatController>();
  final Modal _modal = Get.find<Modal>();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getInfoUsers());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              HeaderChat(),
              Obx(
                () => (_chatController.updateData.value || !_chatController.updateData.value) ? Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _chatController.myData.users.map((e) => UserItem(user: e)).toList(),
                          ),
                        ),
                      ),                     
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: _chatController.myData.chats.isEmpty ?
                            [AlertEmpty(text: 'No tienes chats.')] :
                            [..._chatController.myData.chats].map((e) => ChatItem(chat: e)).toList()
                          )
                        )
                      )
                    ],
                  ),
                ) : SizedBox.shrink()
              ),
            ],
          ),
        )
      ),
    );

  }


  void _getInfoUsers() async {
    _modal.showModalLoader();
    if(_chatController.myData.myUser == null) {
      final dartz.Either<MyError, bool> result = await _chatController.getInfoUser();
      if(result != null) {
        result.fold(
          (l) => _doError(l.message),
          (r) => _getData()
        );
      } else {
        Get.back();
      }
    } else {
      _getData();
    }
  }

  void _doError(String text) {
    Get.back();
    _modal.showSnackbar('¡Error!', text);
  }

  void _doSuccess() {
    _chatController.filterListUsers();
    _chatController.ready.value = true;
    _chatController.updateData.value = !_chatController.updateData.value;
  }

  void _getData() async{
    try {
      await Future.wait([
        _getUsers(),
        _getChats()
      ]);
    } catch (e) {}
    _doSuccess();
    Get.back();
  }

  Future _getUsers() async {
    final dartz.Either<MyError, bool> result = await _chatController.getUsers();
    if(result != null) {
      result.fold(
        (l) =>  _modal.showSnackbar('¡Error!', l.message),
        (r) => null
      );
    }
  }

  Future _getChats() async {
    final dartz.Either<MyError, bool> result = await _chatController.getChats();
    if(result != null) {
      result.fold(
        (l) =>  _modal.showSnackbar('¡Error!', l.message),
        (r) => null
      );
    }
  }

}