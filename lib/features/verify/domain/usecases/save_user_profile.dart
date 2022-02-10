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

  final String city;
  final String state;
  final String zipCode;
  final String password;
final String phone;
final String email;
final String fname;
  final String lname;
final String oldPassword;
final String  NewPassword;
  UserProfileParams( {this.email, this.fname, this.lname,this.oldPassword, this.NewPassword,

       this.phone,
        this.city,
      this.state,
      this.zipCode,
      this.profileImage,
      this.password,
      }

      );
}
