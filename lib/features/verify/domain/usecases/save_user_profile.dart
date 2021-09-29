import 'package:dartz/dartz.dart';
import '../../../../core/domain/repositories/user_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';

class SaveUserProfile implements UseCase<void, UserProfileParams> {
  UserRepository userRepository;
  SaveUserProfile(this.userRepository);

  @override
  Future<Either<Failure, void>> call(UserProfileParams params) async {
    return userRepository.saveUserProfile(params);
  }
}

class UserProfileParams {
  final String profileImage;
  final String firstName;
  final String lastName;
  final String email;
  final String city;
  final String state;
  final String zipCode;
  final String password;
  final String payment;

  UserProfileParams(
      {this.email,
      this.city,
      this.state,
      this.zipCode,
      this.profileImage,
      this.firstName,
      this.lastName,
      this.password,
      this.payment});
}
