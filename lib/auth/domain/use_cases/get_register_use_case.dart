import 'package:dartz/dartz.dart';

import '../../../core/utils/errors/error_firebase.dart';
import '../entities/user.dart';
import '../repositry/base_auth_repositry.dart';

class GetRegisterUseCase{
  final BaseAuthRepositry baseAuthRepositry;

  GetRegisterUseCase({required this.baseAuthRepositry});
  Future<Either<ErrorFirebase, User>> register
      ({required String name, required String email,
    required String password}) async{
    return await baseAuthRepositry.register(name: name,
        email: email, password: password);
  }
}