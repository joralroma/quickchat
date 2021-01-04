import 'package:get/get.dart';

// Controller
import 'package:chatquick/app/app_controller.dart';

class AppBinding implements Bindings{

  @override
  void dependencies() {
    Get.put<AppController>(AppController());
  }

}