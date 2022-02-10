import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/domain/usecases/pet_profile_auth_params.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';

class PetCreateProfile implements UseCase<void, PetProfileAuthParams> {
  UserRepository userRepository;
  PetCreateProfile(this.userRepository);
  @override
  Future<Either<Failure, void>> call(PetProfileAuthParams params) async {
    return userRepository.petCreateProfile(params);
  }
}
