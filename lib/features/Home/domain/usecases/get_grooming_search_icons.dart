import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class GetGroomingSearchIcons extends UseCase<void, void> {
  UserRepository userRepository;
  GetGroomingSearchIcons(this.userRepository);

  @override
  Future<Either<Failure, void>> call(void params) {
    return userRepository.getGroomingSearchIcons();
  }
}
