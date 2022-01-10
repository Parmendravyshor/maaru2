import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';

class PostReview implements UseCase<void,UserReviewParamsMOdel> {
  final UserRepository userRepository;
  PostReview(this.userRepository);
  @override
  Future<Either<Failure, void>> call(UserReviewParamsMOdel params) {
  return userRepository.postReview(params);
  }
}

class UserReviewParamsMOdel{
  final String providerId;
  final String bookingId;
  final String Comment ;
  final String rating;

  UserReviewParamsMOdel({this.providerId, this.bookingId, this.Comment, this.rating});
}