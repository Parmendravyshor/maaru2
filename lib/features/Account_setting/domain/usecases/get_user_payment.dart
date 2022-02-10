import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';

class GetUSerPayment extends UseCase<void, void> {
  UserRepository userRepository;
  GetUSerPayment(this.userRepository);

  @override
  Future<Either<Failure, FetchCardDetailsModel>> call(void params) {
    return userRepository.getUserPayment();
  }
}
