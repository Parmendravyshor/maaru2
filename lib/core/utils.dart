import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';

import 'package:maru/features/Account_setting/domain/usecases/do_payment.dart';
import 'package:maru/features/Account_setting/domain/usecases/get_user_payment.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/Account_setting/presentation/bloc/setting_bloc.dart';
import 'package:maru/features/Account_setting/presentation/payment/bloc/payment_bloc.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/book_provider_cancel.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_bookings.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_decline_appointment_request.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/post_review.dart';
import 'package:maru/features/Book_Appointment/presentation/bloc/book_appointment_bloc.dart';
import 'package:maru/features/Home/domain/usecases/get_upcoming_appointment.dart';
import 'package:maru/features/chat/domain/usecases/get_text_file.dart';
import 'package:maru/features/chat/presentation/chat_bloc.dart';
import 'package:maru/features/forgot/Domain/usecases/forget_password.dart';
import 'package:maru/features/forgot/Domain/usecases/reset_password.dart';
import 'package:maru/features/forgot/Domain/usecases/send_reset_otp.dart';
import 'package:maru/features/forgot/presentation/bloc/reset_bloc.dart';
import 'package:maru/features/login/domain/usecases/emailsignin.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/provider_home/domain/use_cases/accept_request_by_id.dart';
import 'package:maru/features/provider_home/domain/use_cases/decline_request_by_id.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_provider_request.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_user.dart';
import 'package:maru/features/provider_home/presentation/bloc/provider_home_bloc.dart';
import 'package:maru/features/provider_login/domain/usecases/provider_email_login.dart';
import 'package:maru/features/provider_register/domain/usecases/provider_email_register.dart';
import 'package:maru/features/register/domain/usecases/email_signup.dart';
import 'package:maru/features/register/domain/usecases/fb_signin.dart';
import 'package:maru/features/register/domain/usecases/google_signup.dart';
import 'package:maru/features/register/presentation/register_bloc.dart';
import 'package:maru/features/verify/domain/usecases/book_a_provider.dart';
import 'package:maru/features/verify/domain/usecases/change_password.dart';
import 'package:maru/features/verify/domain/usecases/create_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_providers.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_review_request.dart';
import 'package:maru/features/verify/domain/usecases/get_single_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/upload_vaccine_record.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/firebase_auth.dart';
import 'data/datasource/shared_pref_helper.dart';

import 'data/datasource/user.dart';
import 'data/repository/user_repository.impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/resend_verification_code.dart';

Future<void> registerDependencyInjection() async {
  var container = KiwiContainer();

  await _registerMisc(container);
  await _registerApiClient(container);
  await _registerDataSources(container);
  _registerRepositories(container);
  _registerUseCases(container);

  _registerBloc(container);
}

void _registerBloc(KiwiContainer container) {
  container.registerFactory((c) => RegisterBloc(c.resolve(), c.resolve(),c.resolve()));
  container.registerFactory(
      (c) => PaymentBloc(c.resolve(), c.resolve(), c.resolve()));
  container.registerFactory((c) => LoginBloc(
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
        c.resolve(),
      ));
  container
      .registerFactory((c) => ResetBloc(c.resolve(), c.resolve(), c.resolve()));
  container.registerFactory((c) => PetProfileBloc(
      c.resolve(),
      c.resolve(),
      c.resolve(),
      c.resolve(),
      c.resolve(),
      c.resolve(),
      c.resolve(),
      c.resolve()));
  // container.registerFactory((c) => KProfileBloc(c.resolve(), c.resolve()));
  container.registerFactory((c) => VerifyBloc(
      c.resolve(), c.resolve(), c.resolve(), c.resolve(), c.resolve()));
  container.registerFactory(
      (c) => ProviderHomeBloc(c.resolve(), c.resolve(), c.resolve()));
  container.registerFactory((c) => BookAppointmentBloc(c.resolve(), c.resolve(),
      c.resolve(), c.resolve(), c.resolve(), c.resolve()));
  container.registerFactory((c) => ChatBloc(
        c.resolve(),
        c.resolve(),
        c.resolve(),
      ));
  //container.registerFactory(
  //     (c) => BookAppointmentBloc(c.resolve(), c.resolve(), c.resolve(),c.resolve(),c.resolve()));
  container.registerFactory((c) => SettingBloc(
        c.resolve(),
        c.resolve(),
      ));
}
void _registerUseCases(KiwiContainer container) {
  container.registerFactory((c) => EmailSignin(c.resolve()));
  container.registerFactory((c) => EmailSignup(c.resolve()));
  container.registerFactory((c) => ProviderEmailSignin(c.resolve()));
  container.registerFactory((c) => ProviderEmailSignUp(c.resolve()));
  container.registerFactory((c) => ResendCode(c.resolve()));
  container.registerFactory((c) => SendResetPasswordOtp(c.resolve()));
  container.registerFactory((c) => VerifyCode(c.resolve()));
  container.registerFactory((c) => SavePetProfile(c.resolve()));
  container.registerFactory((c) => GetPetProfile(c.resolve()));
  container.registerFactory((c) => CreatePetProfile(c.resolve()));
  container.registerFactory((c) => ForgetPassword(c.resolve()));
  container.registerFactory((c) => ResetPassword(c.resolve()));
  container.registerFactory((c) => SaveUserProfile(c.resolve()));
  container.registerFactory((c) => SaveChangePassword(c.resolve()));
  container.registerFactory((c) => SaveUserPayment(c.resolve()));
  container.registerFactory((c) => GetTextFile(c.resolve()));
  container.registerFactory((c) => GetUpcomingAppointmentUserSide(c.resolve()));
  container.registerFactory((c) => GetProviders(c.resolve()));
  container.registerFactory((c) => GetReview(c.resolve()));
  container.registerFactory((c) => GetProviderRequest(c.resolve()));
  container.registerFactory((c) => GetSinglePetProfile(c.resolve()));
  container.registerFactory((c) => UploadVaccineREcord(c.resolve()));
  container.registerFactory((c) => GetProviderById(c.resolve()));
  container.registerFactory((c) => BookProvider(c.resolve()));
  container.registerFactory((c) => PostReview(c.resolve()));
  container.registerFactory((c) => GetUSerPayment(c.resolve()));
  container
      .registerFactory((c) => GetUpcomingAndPastAppointmentdddddd(c.resolve()));
  container.registerFactory((c) => DoPayment(c.resolve()));
  container.registerFactory((c) => AcceptRequest(c.resolve()));
  container.registerFactory((c) => DeclineRequest(c.resolve()));
  container.registerFactory(
      (c) => GetUpcomingPastAndDeclineAppointment(c.resolve()));
  container.registerFactory((c) => BookProviderCancel(c.resolve()));
  container.registerFactory((c) => GetUsers(c.resolve()));
  container.registerFactory((c) => GetBookingss(c.resolve()));
  container.registerFactory((c) => GoogleSignups (c.resolve()));
  container.registerFactory((c) => GoogleSignIn ());
  container.registerFactory((c) => FbSignIn (c.resolve()));
  container.registerFactory((c) => FacebookLogin ());
  // container.registerFactory((c) => SaveSingleField(c.resolve()));
}
void _registerRepositories(KiwiContainer container) {
  container.registerFactory<UserRepository>((c) => UserRepositoryImpl(
        c.resolve(),c.resolve(),c.resolve(),c.resolve()
      ));
}
_registerDataSources(KiwiContainer container) {
  container.registerFactory<IAuthFacade>(
          (c) => FirebaseUsers());
  container.registerFactory<SharedPrefHelper>(
      (c) => SharedPrefHelperImpl(c.resolve()));
}

_registerApiClient(KiwiContainer container) {}

_registerMisc(KiwiContainer container) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  container.registerFactory((c) => sharedPreferences);
}
