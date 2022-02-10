import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class CreateUserProfile implements UseCase<void, UserProfile1> {
  UserRepository userRepository;
  CreateUserProfile(this.userRepository);

  @override
  Future<Either<Failure, void>> call(UserProfile1 params) async {
    return userRepository.createUserProfile(params);
  }
}
class UserProfile1{
  final String city;
  final String zipcode;
  final String phoneNumber;
  UserProfile1(this.city, this.zipcode, this.phoneNumber);

}