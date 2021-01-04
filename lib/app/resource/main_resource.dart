import 'package:dartz/dartz.dart';

// Models
import 'package:chatquick/app/models/error.dart';


abstract class MainResource {
  
  Future<Either<MyError, bool>> loginUser(String nickname, String password);
  Future<Either<MyError, bool>> registerUser(Map<String, dynamic> body);
  Future<Either<MyError, bool>> getInfoUser();
  Future<Either<MyError, bool>> getAllUsers();
  Future<Either<MyError, bool>> getChats();
  Future<Either<MyError, bool>> sendMsm(String fromUserId, String toUserId, String text);

}