import 'package:get/get.dart';

// Provider
import 'package:chatquick/app/provider/http_provider.dart';
import 'package:chatquick/app/provider/main_provider.dart';

// Controllers
import 'package:chatquick/app/modules/home/details.dart/details_controller.dart';

class DetailsBinding implements Bindings{

  @override
  void dependencies() {
    final MainProvider mainProvider = MainProvider(Get.find<HttpProvider>());
    Get.put<DetailsController>(DetailsController(mainProvider));
  }

}