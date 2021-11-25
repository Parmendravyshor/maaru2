import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class SaveRegistrationId implements UseCase<void, NoParams> {
  UserRepository userRepository;
  SaveRegistrationId(this.userRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return userRepository.saveRegistrationId();
  }
}