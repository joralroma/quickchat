import 'package:get/get.dart';

// Provider
import 'package:chatquick/app/provider/http_provider.dart';
import 'package:chatquick/app/provider/main_provider.dart';

// Controllers
import 'login_controller.dart';

class LoginBinding implements Bindings{

  @override
  void dependencies() {
    final MainProvider mainProvider = MainProvider(Get.find<HttpProvider>());
    Get.put<LoginController>(LoginController(mainProvider));
  }

}