import 'package:chatquick/app/models/chat.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

// Controller
import 'package:chatquick/app/modules/home/chat/chat_controller.dart';

// Resource
import 'package:chatquick/app/resource/main_resource.dart';

// Models
import 'package:chatquick/app/models/msm.dart';
import 'package:chatquick/app/models/user.dart';
import 'package:chatquick/app/models/error.dart';

// Stores
import 'package:chatquick/app/stores/data.dart';
import 'package:chatquick/app/stores/session.dart';

// Utils
import 'package:chatquick/app/utils/extensions.dart';


class DetailsController extends GetxController {

  final MainResource _mainResource;

  DetailsController(this._mainResource);

  final TextEditingController msmController = TextEditingController();
  
  final ChatController _chatController = Get.find<ChatController>();

  final RxBool ready = RxBool(false);

  final MyData myData = MyData.instance;

  final Session _session = Get.find<Session>();

  final RxList<Msm> msms = RxList<Msm>([]);

  User userChat;

  Worker _ever;

  @override
  void onInit() {
    getData();
    _ever = ever(_chatController.updateData, (_) => verifyChat() ); 
    super.onInit();
  }

  void verifyChat() {
    List<Msm> _msms = [];
    final Chat chat = myData.chats.firstWhere((c) => c.userChat.id == userChat.id);
    if(chat != null) {
      _msms = chat.chats.toMsms;
    }
    if(msms.length != _msms.length) {
      msms.value = _msms;
    }
  }

  @override
  void onClose() {
    ready.close();
    _ever.dispose();
    super.onClose();
  }

  void getData() {
    final arguments = Get.arguments as Map;
    if(arguments != null && arguments['user'] != null && arguments['msms'] != null) {
      userChat = arguments['user'];
      msms.value = (arguments['msms'] as List).map((e) => e as Msm).toList();
      ready.value = true;
    }
  }

  void logout() {
    _session.logout();
  }

  void addMsm(String text,  String date, {bool me = true}) {
    msms.add(Msm(me, text, date));
  }

  Future<Either<MyError, bool>> sendMsm() async {
    final String text = msmController.text.trim();
    final String date = DateTime.now().toString();
    addMsm(text, date, me: true);
    msmController.clear();
    final String userId = myData.myUser.id;
    final Either<MyError, bool> result = await this._mainResource.sendMsm(userId, userChat.id, text);
    return result;
  }


}