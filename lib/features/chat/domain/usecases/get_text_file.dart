
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
class ChatModel{
  final String userId;
  final String userId2;
  final String message;
  final String mesageId;

  ChatModel(this.userId, this.userId2, this.message, this.mesageId);
}
// switch (e.code) {
// case "ERROR_OPERATION_NOT_ALLOWED":
// throw UnImplementedFailure();
// break;
// case "ERROR_WEAK_PASSWORD":
// throw WeakPasswordException();
// break;
// case "ERROR_INVALID_EMAIL":
// throw InvalidEmailException();
// break;
// case "ERROR_EMAIL_ALREADY_IN_USE":
// throw EmailInUseException();
// break;
// case "ERROR_INVALID_CREDENTIAL":
// throw InvalidEmailException();
// break;
// case "ERROR_NETWORK_REQUEST_FAILED":
// throw NetworkException();
// break;
// default:
// throw UnImplementedFailure();
// }