import 'package:dartz/dartz.dart';

import '../../../core/utils/errors/error_firebase.dart';
import '../entities/user.dart';
import '../repositry/base_auth_repositry.dart';

class GetLoginUseCase{
  final BaseAuthRepositry baseAuthRepositry;

  GetLoginUseCase({required this.baseAuthRepositry});
  Future<Either<ErrorFirebase, User>> login(String email,
      String password)async {
    return await baseAuthRepositry.login(email, password);
  }
}