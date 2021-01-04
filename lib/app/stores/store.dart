import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Store {


  String temporalToken;

  final keys = {
    "keyToken": "ChatToken",
  };

  final FlutterSecureStorage storage = new FlutterSecureStorage();

  static final Store _singleton = new Store._internal();
  Store._internal();
  static Store get instance => _singleton;

// ******************** User **********************

  Future<void> setToken(String token) async {
    await storage.write(key: keys["keyToken"], value: token);
  }

  Future<String> getToken() async {
    String value = await storage.read(key: keys["keyToken"]);
    if(value != null) return value;
    return null;
  }

  Future<void> deleteAllStorage() async {
    temporalToken = null;
    await storage.deleteAll();
  }

  Future<void> validateToken() async {
    String value = await getToken();
    if(value != null) {
      return true;
    }
    return false;
  }

}
