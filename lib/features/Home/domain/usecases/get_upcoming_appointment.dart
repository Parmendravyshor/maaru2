import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';

class GetUpcomingAppointmentUserSide extends UseCase<void, String> {
  UserRepository userRepository;
  GetUpcomingAppointmentUserSide(this.userRepository);

  @override
  Future<Either<Failure, void>> call(String date) {
    return userRepository.getUpcomingAppointmentUserSide(date);
  }
}
