
import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class GetTextFile implements UseCase<void, String> {
  UserRepository userRepository;
  GetTextFile(this.userRepository);

  /// This will call [UserRepository] first to authenticate over firebase
  /// If authentication over firebase succeeds, it will Call [UserRepository] again to authenticate on triffic servers
  /// if any of above requests fails it will return [Failure] with message of cause
  @override
  Future<Either<Failure, void>> call(String params) async {
    return userRepository.getTextFile(params);
  }
}
