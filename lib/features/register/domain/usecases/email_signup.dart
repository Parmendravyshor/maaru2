import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/domain/usecases/email_auth_params.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

/// This class is responsible for Signup using Email and Password.
/// There will be different usecase for EmailLogin because logging in also
/// needs to check ShowAccount to actually register new PrivateKey.
class EmailSignup implements UseCase<void, EmailAuthParams> {
  UserRepository userRepository;
  EmailSignup(this.userRepository);
@override
  Future<Either<Failure, void>> call(EmailAuthParams params) async {
    return userRepository.emailSignup(params);
  }
}
