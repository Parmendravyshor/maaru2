import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';

class GetUpcomingAppointment extends UseCase<void, void> {
  UserRepository userRepository;
  GetUpcomingAppointment(this.userRepository);

  @override
  Future<Either<Failure, void>> call(void params) {
    return userRepository.getUpcomingAppointment();
  }
}
