import 'package:dartz/dartz.dart';
import '../repositories/user_repository.dart';
import '../../error/failure.dart';
import '../../usecases/usecase.dart';

/// This class is responsible for Signin in using Email and Password.
///
class ResendCode implements UseCase<void, String> {
  UserRepository userRepository;
  ResendCode(this.userRepository);

  /// This will call [UserRepository] first to authenticate over firebase
  /// If authentication over firebase succeeds, it will Call [UserRepository] again to authenticate on triffic servers
  /// if any of above requests fails it will return [Failure] with message of cause
  @override
  Future<Either<Failure, void>> call(String email) async {
    return userRepository.resendOtp(email);
  }
}
