import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';

class DoPayment implements UseCase<void,PaymentParams> {
  UserRepository userRepository;
  DoPayment(this.userRepository);

  @override
  Future<Either<Failure, void>> call(PaymentParams params) async {
    return userRepository.doPayment(params);
  }
}



