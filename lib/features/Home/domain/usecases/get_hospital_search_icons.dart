import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class GetHospitalSearchIcons extends UseCase<void, void> {
  UserRepository userRepository;
  GetHospitalSearchIcons(this.userRepository);

  @override
  Future<Either<Failure, void>> call(void params) {
    return userRepository.getHospitalSearchIcons();
  }
}
