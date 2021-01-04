import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Stores
import 'package:chatquick/app/stores/store.dart';

class Session  {
  
  final Store _store = Store.instance;
  SharedPreferences _sharedPreferences;


  Future<bool> isLogged() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (_sharedPreferences.getBool('first_run') ?? true) {
      await _store.deleteAllStorage();
      _sharedPreferences.setBool('first_run', false);
      return false;
    }
    return await _verifyToken();
  }

  Future<bool> _verifyToken() async {
    String token = await _store.getToken();
    if(token != null){
      _store.temporalToken = token;
      return true;
    }
    return false;
  }

  void logout() {
    _store.deleteAllStorage();
    Get.offAllNamed('/');
  }

}