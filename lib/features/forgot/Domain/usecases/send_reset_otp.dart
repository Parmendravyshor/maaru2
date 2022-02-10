import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class SendResetPasswordOtp implements UseCase<void, String> {
  UserRepository userRepository;
  SendResetPasswordOtp(this.userRepository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    return userRepository.sendPasswordResetEmail(email);
  }
}
