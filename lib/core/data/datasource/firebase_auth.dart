import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maru/core/error/failure.dart';

abstract class IAuthFacade {
 // Future<Option<User>> getSignedInUser();
  Future<Either<Failure, void>> signInWithGoogle();
  Future<void> signOut();
}