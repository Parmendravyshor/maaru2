import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';

class UploadVaccineREcord extends UseCase<void, vacineParams> {
  UserRepository userRepository;
  UploadVaccineREcord(this.userRepository);

  @override
  Future<Either<Failure, void>> call(vacineParams params) {
    return userRepository.uploadVaccineREcord(params);
  }
}
class vacineParams{
   var pet_id;
   var doc_url;

  vacineParams({this.pet_id, this.doc_url});

}