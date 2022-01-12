import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetSinglePetProfile implements UseCase<void, int> {
  UserRepository userRepository;
  GetSinglePetProfile(this.userRepository);

  @override
  Future<Either<Failure, Welcome2>> call(int id1) async {
    return userRepository.getSinglePetProfile(id1);
  }
}
