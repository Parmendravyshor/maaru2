import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/domain/usecases/pet_profile_auth_params.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';

abstract class UserRepository<T> {
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params);
  Future<Either<Failure, void>> emailLogin(EmailAuthParams params);
  Future<Either<Failure, void>> resendOtp(String email);
  Future<Either<Failure, void>> sendPasswordResetEmail(String email);
  Future<Either<Failure, void>> setNewPassword(
      {String email, String otp, String password});
  Future<Either<Failure, void>> petCreateProfile(PetProfileAuthParams params);
  Future<Either<Failure, void>> getPastAppointment();
  Future<Either<Failure, void>> getUpcomingAppointment();
  Future<Either<Failure, void>> createPetProfile();
  Future<Either<Failure, void>> createUserProfile();
  Future<Either<Failure, void>> getPetProfile();
  Future<Either<Failure, void>> getUserProfile();
  Future<Either<Failure, void>> savePetProfile(PetProfileParams params);
  Future<Either<Failure, void>> saveUserProfile(UserProfileParams params);
  Future<Either<Failure, void>> verifyCode(VerifyParams params);
  Future<Either<Failure, void>> getResentMessages();
  Future<Either<Failure, void>> getUserSaveAccountLocation();
  Future<Either<Failure, void>> getHomeSearchBarItems();
  Future<Either<Failure, void>> saveUserPayment(PaymentParams params);
  Future<Either<Failure, void>> getUserPayment();
  Future<Either<Failure, void>> getHospitalSearchIcons();
  Future<Either<Failure, void>> getHomeSearchIcons();
  Future<Either<Failure, void>> getVetSearchIcons();
  Future<Either<Failure, void>> getGroomingSearchIcons();
  Future<Either<Failure, void>> getWalkingSearchIcons();
  Future<Either<Failure, void>> getDayCareSearchIcons();
}
