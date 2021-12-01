import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

/// This use case is for when user needs to reset password
/// an email link will be sent to users email address if request succeeds
class ResetPassword implements UseCase<void, SetNewPasswordParams> {
  UserRepository userRepository;
  ResetPassword(this.userRepository);

  @override
  Future<Either<Failure, void>> call(SetNewPasswordParams params) async {
    return userRepository.setNewPassword(
       params);
  }
}

class SetNewPasswordParams {
  final String otp;
  final String email;
  final String password;

  SetNewPasswordParams({this.otp, this.email, this.password});
}
