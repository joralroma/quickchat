// Models
import 'package:chatquick/app/models/chat.dart';
import 'package:chatquick/app/models/user.dart';

enum StatesAlerts {SUCCESS, ERROR, WARNING}
enum StatesSelect {OPEN, CLOSE}
enum TypeInput {TEXT, NUMBER, DECIMAL, EMAIL}

class MyData {

  static final MyData _singleton = new MyData._internal();
  MyData._internal();
  static MyData get instance => _singleton;

  User myUser;

  List<User> users = [];

  List<Chat> chats = [];

}