import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class BookProviderCancel implements UseCase<void,String> {
  final UserRepository userRepository;
  BookProviderCancel(this.userRepository);
  @override
  Future<Either<Failure, void>> call(String id1) {
    return userRepository.bookProviderCancel(id1);
  }
}

