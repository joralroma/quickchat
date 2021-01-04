import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Shared
import 'package:chatquick/app/modules/shared/modal.dart';

// Provider
import 'package:chatquick/app/provider/http_provider.dart';

// Stores
import 'package:chatquick/app/stores/config.dart';
import 'package:chatquick/app/stores/session.dart';


class AppController extends GetxController {

  @override
  void onInit() {
    _initData();
    super.onInit();
  }

  void _initData() async {
    Get.put<Modal>(Modal());
    Get.put<Config>(Config());
    Get.put<HttpProvider>(HttpProvider());
    Get.put<Session>(Session());    
  }

}