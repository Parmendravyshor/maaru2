import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';

class GetDeclineAppointmentRequest implements UseCase<void,void>{
  UserRepository userRepository;
  GetDeclineAppointmentRequest(this.userRepository);

  @override
  Future<Either<Failure, UpcomingPastAppointmentModel>> call(void params) {
    // TODO: implement call
   return userRepository.getDeclineAppointmentRequest();
  }
}