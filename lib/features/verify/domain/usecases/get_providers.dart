import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetProviders implements UseCase<void, void> {
  UserRepository userRepository;
  GetProviders(this.userRepository);

  @override
  Future<Either<Failure, void>> call(void params) async {
    return userRepository.getProviders();
  }
}
// class getProvider{
//
// }