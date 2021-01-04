import 'dart:convert';
import 'package:http/http.dart';
import 'package:dartz/dartz.dart';

// Stores
import 'package:chatquick/app/stores/data.dart';

// Stores
import 'package:chatquick/app/stores/store.dart';

// Resource
import 'package:chatquick/app/models/chat.dart';
import 'package:chatquick/app/resource/http_resource.dart';
import 'package:chatquick/app/resource/main_resource.dart';

// Models
import 'package:chatquick/app/models/user.dart';
import 'package:chatquick/app/models/error.dart';

class MainProvider implements MainResource {

  final HttpResource _httpResource;

  MainProvider(this._httpResource);

  final Store _store = Store.instance;
  final MyData _myData = MyData.instance;

  @override
  Future<Either<MyError, bool>> loginUser(String nickname, String password) async {
    String error = 'Error en el login';
    try {
      final Response response = await _httpResource.httpPost('user/1', {'nickname': nickname, 'password': password});
      final responseBody = response.body;
      final data = json.decode(responseBody);
      if (response.statusCode == 200) {
        if(data != null && data['type'] == 1 && data['token'] != null) {
          final User _user = User.fromJson(data['user']);
          _myData.myUser = _user;
          _store.setToken(data['token']);
          return Right(true);
        }
      }
      return Left(MyError(data['text'] ?? error));
    } catch (e) {
      return Left(MyError(error));
    }
  }
  
  @override
  Future<Either<MyError, bool>> registerUser(Map<String, dynamic> body) async {
    String error = 'Error en el registro';
    try {
      final Response response = await _httpResource.httpPost('user/2', body);
      final responseBody = response.body;
      final data = json.decode(responseBody);
      if (response.statusCode == 200) {
        if(data != null && data['type'] == 1 && data['token'] != null) {
          final User _user = User.fromJson(data['user']);
          _myData.myUser = _user;
          _store.setToken(data['token']);
          return Right(true);
        }
      }
      return Left(MyError(data['text'] ?? error));
    } catch (e) {
      return Left(MyError(error));
    }
  }

  @override
  Future<Either<MyError, bool>> getInfoUser() async {
    String error = 'Error al consultar la información del usuario';
    try {
      final String _token = await _store.getToken();
      final Response response = await _httpResource.httpPost('user/3', {'token': _token});
      final responseBody = response.body;
      final data = json.decode(responseBody);
      if (response.statusCode == 200) {
        if(data != null && data['type'] == 1 && data['user'] != null) {
          final User _user = User.fromJson(data['user']);
          _myData.myUser = _user;
          return Right(true);
        }
      }
      return Left(MyError(data['text'] ?? error));
    } catch (e) {
      return Left(MyError(error));
    }
  }

  @override
  Future<Either<MyError, bool>> getChats() async {
    String error = 'Error al consultar los chats';
    try {
      final String userId = _myData.myUser.id;
      final Response response = await _httpResource.httpPost('user/4', {'userId': userId});
      final responseBody = response.body;
      final data = json.decode(responseBody);
      if (response.statusCode == 200) {
        if(data != null && data['type'] == 1 && data['list'] != null) {
          final List<Chat> _chats = Chat.fromJsonList(data['list']);
          _myData.chats = _chats;
          return Right(true);
        }
      }
      return Left(MyError(data['text'] ?? error));
    } catch (e) {
      return Left(MyError(error));
    }
  }

  @override
  Future<Either<MyError, bool>> getAllUsers() async {
    String error = 'Error al consultar los usuarios';
    try {
      final String userId = _myData.myUser.id;
      final Response response = await _httpResource.httpPost('user/5', {'userId': userId});
      final responseBody = response.body;
      final data = json.decode(responseBody);
      if (response.statusCode == 200) {
        if(data != null && data['type'] == 1 && data['users'] != null) {
          final List<User> _users = User.fromJsonList(data['users']);
          _myData.users = _users;
          return Right(true);
        }
      }
      return Left(MyError(data['text'] ?? error));
    } catch (e) {
      return Left(MyError(error));
    }
  }

  @override
  Future<Either<MyError, bool>> sendMsm(String fromUserId, String toUserId, String text) async {
    String error = 'Error al consultar los usuarios';
    try {
      final Response response = await _httpResource.httpPost('chat/1', {'fromUserId': fromUserId, 'toUserId': toUserId, 'text': text});
      final responseBody = response.body;
      final data = json.decode(responseBody);
      if (response.statusCode == 200) {
        if(data != null && data['type'] == 1) {
          return Right(true);
        }
      }
      return Left(MyError(data['text'] ?? error));
    } catch (e) {
      return Left(MyError(error));
    }
  }

}