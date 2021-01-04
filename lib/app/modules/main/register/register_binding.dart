import 'package:get/get.dart';

// Provider
import 'package:chatquick/app/provider/http_provider.dart';
import 'package:chatquick/app/provider/main_provider.dart';

// Controller
import 'package:chatquick/app/modules/main/register/register_controller.dart';

// Controllers

class RegisterBinding implements Bindings{

  @override
  void dependencies() {
    final MainProvider mainProvider = MainProvider(Get.find<HttpProvider>());
    Get.put<RegisterController>(RegisterController(mainProvider));
  }

}