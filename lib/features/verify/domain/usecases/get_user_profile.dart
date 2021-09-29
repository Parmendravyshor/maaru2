import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetUserProfile implements UseCase<Failure, void> {
  UserRepository userRepository;
  GetUserProfile(this.userRepository);

  @override
  Future<Either<Failure, Failure>> call(void params) async {
    return userRepository.getUserProfile();
  }
}
