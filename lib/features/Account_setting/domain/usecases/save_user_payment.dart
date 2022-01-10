import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class SaveUserPayment extends UseCase<void, PaymentParams> {
  UserRepository userRepository;
  SaveUserPayment(this.userRepository);

  @override
  Future<Either<Failure, void>> call(PaymentParams params) {
    return userRepository.saveUserPayment(params);
  }
}

class PaymentParams {
  final String nameOnCard;
  final String bankname;
  final String creditCardNumber;
  final String expDate;
  final String cvv;

  PaymentParams(
      {this.nameOnCard, this.creditCardNumber, this.expDate, this.cvv, this.bankname });
}
