import 'package:get/get.dart';

// Controllers
import 'package:chatquick/app/modules/main/splash/splash_controller.dart';

class SplahsBinding implements Bindings{

  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }

}