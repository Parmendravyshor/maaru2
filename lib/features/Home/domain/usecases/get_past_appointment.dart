import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetPastAppointment extends UseCase<void, void> {
  UserRepository userRepository;
  GetPastAppointment(this.userRepository);

  @override
  Future<Either<Failure, void>> call(void params) {
    return userRepository.getPastAppointment();
  }
}
