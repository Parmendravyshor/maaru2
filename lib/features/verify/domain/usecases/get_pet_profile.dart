import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetPetProfile implements UseCase<void, Welcome> {
  UserRepository userRepository;
  GetPetProfile(this.userRepository);

  @override
  Future<Either<Failure, Welcome>> call(void params) async {
    return userRepository.getPetProfile();
  }
}
