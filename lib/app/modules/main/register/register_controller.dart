import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

// Resource
import 'package:chatquick/app/resource/main_resource.dart';

// Models
import 'package:chatquick/app/models/error.dart';

// Utils
import 'package:chatquick/app/utils/extensions.dart';


class RegisterController extends GetxController {

  final MainResource _mainResource;

  RegisterController(this._mainResource);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  Future<Either<MyError, bool>> doRegister() async {
    final String nickname = userNameController.text.trim();
    final String password = passwordController.text.trim();
    if( nickname.isValid && password.isValid ) {
      final Map<String, dynamic> body = { 'nickname': nickname, 'password': password };
      final Either<MyError, bool> result = await this._mainResource.registerUser(body);
      return result;
    } else {
      return Left(MyError('Los campos no son validos.'));
    }
  }

}