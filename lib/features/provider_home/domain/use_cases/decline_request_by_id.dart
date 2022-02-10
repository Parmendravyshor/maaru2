import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';

class DeclineRequest implements UseCase<Failure,int>{
  UserRepository userRepository;
  DeclineRequest(this.userRepository);
  @override
  Future<Either<Failure, Failure>> call(int value) {
    return userRepository.declineRequest(value);
  }
}