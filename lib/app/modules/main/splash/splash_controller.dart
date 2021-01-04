import 'dart:async';
import 'package:get/get.dart';

// Stores
import 'package:chatquick/app/stores/session.dart';


class SplashController extends GetxController {

  Session _session;

  @override
  void onReady() {
    _verifyInitApp();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }


  void _verifyInitApp() async {
    Timer(Duration(seconds: 2), () => this._getPage()); 
  }

  void _getPage() async {
    _session = Get.find<Session>();
    final bool isLogged = await _session.isLogged();
    if(isLogged) Get.offAllNamed('/chat');
    else Get.offAllNamed('/login');
  }

}