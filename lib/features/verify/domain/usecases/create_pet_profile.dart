import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class CreatePetProfile extends UseCase<void,PetProfile1 > {
  UserRepository userRepository;
  CreatePetProfile(this.userRepository);

  @override
  Future<Either<Failure, void>> call(PetProfile1 params) async {
    return userRepository.createPetProfile(params);
  }
}
