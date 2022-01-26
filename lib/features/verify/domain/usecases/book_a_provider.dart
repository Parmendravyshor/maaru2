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
  final  cardno;
  final String expdate;
  final String cardHolderName;
  final String bookingTime;
  final String cardId;
  final String cvv;

  BookProviderParams({this.cardno, this.expdate, this.cardHolderName,
      this.bookingTime, this.cardId, this.cvv,
      this.pet_id, this.provider_id, this.booking_date, this.service_id});
  factory BookProviderParams.fromJson(Map<String, dynamic> json) => BookProviderParams(
  pet_id: json['pet_id']);
  Map<String, dynamic> toJson() =>
      {
        'pet_id': pet_id
      };
}
