import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';

class SaveChangePassword extends UseCase<void, UserProfileParams> {
  UserRepository userRepository;
  SaveChangePassword(this.userRepository);

  @override
  Future<Either<Failure, void>> call(UserProfileParams params) {
    return userRepository.saveChangePassword(params);
  }
}
