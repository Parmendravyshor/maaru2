import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class BookProvider implements UseCase<void, BookProviderParams> {
  UserRepository userRepository;
  BookProvider(this.userRepository);

  @override
  Future<Either<Failure, void>> call(BookProviderParams params) async {
    return userRepository.bookProvider(params);
  }
}
class BookProviderParams{
 final  pet_id;
 final  provider_id;
 final  booking_date_time;
 final  service_id;

  BookProviderParams({this.pet_id, this.provider_id, this.booking_date_time, this.service_id});

}