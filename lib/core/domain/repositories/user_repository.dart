import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/domain/usecases/pet_profile_auth_params.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_bookings.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_decline_appointment_request.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/post_review.dart';
import 'package:maru/features/forgot/Domain/usecases/reset_password.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_provider_request.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_user.dart';
import 'package:maru/features/provider_login/domain/usecases/provider_email_login.dart';
import 'package:maru/features/verify/domain/usecases/book_a_provider.dart';
import 'package:maru/features/verify/domain/usecases/create_user_profile.dart';

import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_providers.dart';
import 'package:maru/features/verify/domain/usecases/get_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/upload_vaccine_record.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

abstract class UserRepository<T> {
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params);
  Future<Either<Failure, void>> googleSignup();
  Future<Either<Failure, void>> fbSignIn();
  Future<Either<Failure, void>> emailLogin(EmailAuthParams params);
  Future<Either<Failure, void>> providerEmailSignin(EmailAuthParams params);
  Future<Either<Failure, void>> providerEmailSignup(EmailAuthParams params);
  Future<Either<Failure, void>> resendOtp(String email);
  Future<Either<Failure, void>> getTextFile(params);
  Future<Either<Failure, GetUserModel>> getUsers();
  Future<Either<Failure, void>> sendPasswordResetEmail(String email);
  Future<Either<Failure, void>> saveRegistrationId();
  Future<Either<Failure, GetProviderRequestModel>> getProviderRequest(
      SearchRequestProviderParams params);
  Future<Either<Failure, Welcome2>> getSinglePetProfile(int id1);
  Future<Either<Failure, void>> postReview(UserReviewParamsMOdel params);
  Future<Either<Failure, void>> bookProviderCancel(String id1);
  Future<Either<Failure, void>> uploadVaccineREcord(vacineParams params);
  Future<Either<Failure, void>> setNewPassword(SetNewPasswordParams params);
  Future<Either<Failure, void>>  acceptRquest(int value);
  Future<Either<Failure, void>> declineRequest(int value);
  Future<Either<Failure, void>>
      getUpcomingAndPastAppointment(UpcomingBooking params);
  Future<Either<Failure, void>> petCreateProfile(PetProfileAuthParams params);
  Future<Either<Failure, void>> getPastAppointment();
  Future<Either<Failure, void>> getUpcomingAppointmentUserSide(String date);
  Future<Either<Failure, void>> createPetProfile(PetProfile1 params);
  Future<Either<Failure, void>> getProviders(text);
  Future<Either<Failure, void>> getReview();
  Future<Either<Failure, Bookingsss>> getBookingss(id1);
  Future<Either<Failure, GetAllAppointmentProvider>>  getUpcomingPastAndDeclineAppointment(SearchParams params);
  Future<Either<Failure, void>> forgetPassword(email);

  Future<Either<Failure, void>> createUserProfile(UserProfile1 params);
  Future<Either<Failure, Welcome>> getPetProfile(String text);
  Future<Either<Failure, Welcome4>> getProviderById(int id1);
  Future<Either<Failure, void>> saveChangePassword(UserProfileParams params);
  Future<Either<Failure, void>> bookProvider(BookProviderParams params);
  Future<Either<Failure, GetUserProfileMOdel>> getUserProfile();
  Future<Either<Failure, void>> savePetProfile(PetProfile1 params);
  Future<Either<Failure, void>> saveUserProfile(UserProfileParams params);
  Future<Either<Failure, void>> verifyCode(VerifyParams params);
  Future<Either<Failure, void>> getResentMessages();
  Future<Either<Failure, void>> getUserSaveAccountLocation();
  Future<Either<Failure, void>> getHomeSearchBarItems();
  Future<Either<Failure, void>> saveUserPayment(PaymentParams params);
  Future<Either<Failure, FetchCardDetailsModel>> getUserPayment();
  Future<Either<Failure, void>> getHospitalSearchIcons();
  Future<Either<Failure, void>> doPayment(PaymentParams params);
  Future<Either<Failure, void>> getHomeSearchIcons();
  Future<Either<Failure, void>> getVetSearchIcons();
  Future<Either<Failure, void>> getGroomingSearchIcons();
  Future<Either<Failure, void>> getWalkingSearchIcons();
  Future<Either<Failure, void>> getDayCareSearchIcons();
}
