import 'package:dartz/dartz.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class GetReview implements UseCase<void, void> {
  UserRepository userRepository;
  GetReview(this.userRepository);

  @override
  Future<Either<Failure, void>> call(void params) async {
    return userRepository.getReview();
  }
}
