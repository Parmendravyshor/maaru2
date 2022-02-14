import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure.dart';

<<<<<<< HEAD
abstract class UseCase<T, Params> {
=======
abstract class UseCase<T,Params> {
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [dynamic];
}
