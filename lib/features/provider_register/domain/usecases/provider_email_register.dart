import 'dart:ffi';

import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/domain/usecases/email_auth_params.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class ProviderEmailSignUp implements UseCase<void, EmailAuthParams> {
  UserRepository userRepository;
  ProviderEmailSignUp(this.userRepository);
  @override
  Future<Either<Failure, void>> call(EmailAuthParams params) async {
    return userRepository.providerEmailSignup(params);
  }
}
