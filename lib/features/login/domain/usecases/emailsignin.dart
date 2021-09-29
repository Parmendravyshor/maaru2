import 'dart:ffi';

import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/domain/usecases/email_auth_params.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class EmailSignin implements UseCase<void, EmailAuthParams> {
  UserRepository userRepository;
  EmailSignin(this.userRepository);
  Future<Either<Failure, Void>> call(EmailAuthParams params) async {
    return userRepository.emailLogin(params);
  }
}
