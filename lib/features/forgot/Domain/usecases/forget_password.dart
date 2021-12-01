import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/forgot/Domain/usecases/reset_password.dart';

class ForgetPassword implements UseCase<void, String> {
  UserRepository userRepository;
  ForgetPassword(this.userRepository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    return userRepository.forgetPassword(
      email );
  }
}
