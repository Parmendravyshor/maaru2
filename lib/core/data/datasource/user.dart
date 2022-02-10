import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:maru/core/error/failure.dart';

import 'firebase_auth.dart';

class FirebaseUsers extends IAuthFacade{
  // @override
  // Future<Option<User>> getSignedInUser() {
  //   // TODO: implement getSignedInUser
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, void>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}