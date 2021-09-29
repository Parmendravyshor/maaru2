import 'package:dartz/dartz.dart';
import '../../../../core/data/datasource/user.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

/// This class is responsible for Signin in using Email and Password.
///
class ResendEmail implements UseCase<void, String> {
  UserRepository userRepository;
  ResendEmail(this.userRepository);

  /// This will call [UserRepository] first to authenticate over firebase
  /// If authentication over firebase succeeds, it will Call [UserRepository] again to authenticate on triffic servers
  /// if any of above requests fails it will return [Failure] with message of cause
  @override
  Future<Either<Failure, User>> call(String email) async {
    return userRepository.sendPasswordResetEmail(email);
  }
}
