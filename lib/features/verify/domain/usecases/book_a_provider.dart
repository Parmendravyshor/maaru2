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

class BookProviderParams {
  final int pet_id;
  final int provider_id;
  final String booking_date;
  final int service_id;
  final cardno;
  final String expdate;
  final String cardHolderName;
  final String bookingTime;
  final String cardid2;
  final String cvv;
  final String cardcvv;
  BookProviderParams(
      {this.cardno,
      this.expdate,
      this.cardHolderName,
      this.cardcvv,
      this.bookingTime,
      this.cardid2,
      this.cvv,
      this.pet_id,
      this.provider_id,
      this.booking_date,
      this.service_id});
}
